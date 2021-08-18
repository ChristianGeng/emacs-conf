;;; setup-python.el --- summary -*- lexical-binding: t -*-
;;
;;; Code:

(message "Lsp Python begins here")

(defun python-yapf-format-buffer ()
   (interactive)
   (when (and (executable-find "yapf") buffer-file-name)
     (call-process "yapf" nil nil nil "-i" buffer-file-name)))

;; add hook example
;; (add-hook 'python-mode-hook
;;           (lambda ()
;;             (add-hook 'after-save-hook #'lsp-python-ms-format-buffer t t)))

;; does not work as custom variable
;; (defcustom python-autoflake-path
;;   (replace-regexp-in-string "\n$" "" (shell-command-to-string "which autoflake"))
;;   )

(defvar python-autoflake-path
(replace-regexp-in-string "\n$" "" (shell-command-to-string "which autoflake"))
)

(defun python-remove-unused-imports()
  "Use Autoflake to remove unused function"
  "autoflake --remove-all-unused-imports -i unused_imports.py"
  (interactive)
  (shell-command
   (format "%s --remove-all-unused-imports -i %s"
       python-autoflake-path
           (shell-quote-argument (buffer-file-name))))
  (revert-buffer t t t))

(defun python-remove-unused-variables()
"Use Autoflake to remove unused function"
"autoflake --remove-all-unused-imports -i unused_imports.py"
(interactive)
(shell-command
 (format "%s --remove-unused-variables -i %s"
     python-autoflake-path
         (shell-quote-argument (buffer-file-name))))
(revert-buffer t t t))

(require 'linum)
(require 'pycoverage)


(defun my-coverage ()
  (interactive)
  (when (derived-mode-p 'python-mode)
    (progn
      (linum-mode)
      (pycoverage-mode))))


(use-package python-mode
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp-deferred)
                         ;; (yapf-mode)
                         (lsp-treemacs)
                         )
                     )
  :custom
  ;; NOTE: Set these if Python 3 is called "python3" on your system!
  ;; (python-shell-interpreter "python3")
  ;; (dap-python-executable "python3")
  ;; should be .dir-local:
  ;; (lsp-pyright-venv-path "~/.venvs/py37")
  (dap-python-debugger 'debugpy)
  :config
  (require 'dap-python)
  ;; (setq lsp-pyright-server-cmd `("node" "~/.vscode/extensions/ms-python.vscode-pylance-2021.5.3/dist/pyright.bundle.js" "--stdio"))
  )


  (setq lsp-enable-file-watchers nil)
  (setq lsp-file-watch-threshold 2000)

  (setq lsp-pyright-auto-import-completions t)
  ;;  Determines whether pyright automatically adds common search paths.
  ;; i.e: Paths like "src" if there are no execution environments defined in the
  ;; config file.
  (setq lsp-pyright-auto-search-paths t)
  (setq lsp-pyright-log-level "trace")

(require 'dap-python)

;; (lsp-client-settings)

(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  ;; :bind (:map company-active-map
  ;;        ("<tab>" . company-complete-selection))
  ;;       (:map lsp-mode-map
  ;;        ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package pyvenv
  :config
  (pyvenv-mode 1)
  ;; (setq pyvenv-workon "py37")  ; Default venv
  (pyvenv-tracking-mode 1)
  )  ; Automatically use pyvenv-workon via dir-locals

(provide 'setup-python)

;;; setup-python-lsp-python ends here
