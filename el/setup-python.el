;;; setup-python.el --- summary -*- lexical-binding: t -*-
;;
;;; Code:


(require 'linum)
(require 'pycoverage)


(defun my-coverage ()
  (interactive)
  (when (derived-mode-p 'python-mode)
    (progn
      (linum-mode)
      (pycoverage-mode))))


(message "Lsp for Python: pyright version")

;; (defun lsp-python-ms-format-buffer ()
;;   (interactive)
;;   (when (and (executable-find "yapf") buffer-file-name)
;;     (call-process "yapf" nil nil nil "-i" buffer-file-name)))

;; (add-hook 'python-mode-hook
;;           (lambda ()
;;             (add-hook 'after-save-hook #'lsp-python-ms-format-buffer t t)))


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
  (setq lsp-pyright-auto-search-paths t)

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
