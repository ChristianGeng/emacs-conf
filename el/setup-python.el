;;; setup-python.el --- summary -*- lexical-binding: t -*-
;;
;;; Code:

(message "Lsp Python begins here")

(defun lsp-workspace-restart-deep ()
  (interactive
   (delete-file (joindirs user-emacs-directory  ".lsp-session-v1"))
   (lsp-workspace-restart))
  )

;;   ;;;###autoload
;; (defun toggle-menubar ()
;; "Toggle menubar visibility.
;; If toolbar is invisible, turn it on.  Otherwise turn it off."
;;   (interactive)
;;   (if (eq menu-bar-mode t)
;;       (menu-bar-mode -1)
;;           (menu-bar-mode t)

;; ))

(use-package python-pytest
  :ensure t
  )

(defun cg/python-yapf-format-buffer ()
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

(defun python-cleanup-this-file ()
  "All cleaning actions run in chain..."
  (interactive)
  (blacken-buffer)
  (python-remove-unused-imports)
  (py-isort-buffer)
  (python-remove-unused-imports)
  )

(require 'auto-complete-rst)
(auto-complete-rst-init)

;; specify other sources to use in rst-mode
(setq auto-complete-rst-other-sources
      '(ac-source-filename
        ac-source-abbrev
        ac-source-dictionary
        ac-source-yasnippet))

(defconst python-linewidth 89)

(require 'pycoverage)


(defun my-coverage ()
  (interactive)
  (when (derived-mode-p 'python-mode)
    (progn
      ;; (linum-mode)
      (pycoverage-mode))))

;; (add-hook 'flycheck-mode-hook #'flycheck-virtualenv-setup)
(defun flycheck-python-setup ()
  (flycheck-mode)
  )
;; (add-hook 'python-mode-hook #'flycheck-python-setup)

(use-package lsp-mode
  :ensure t
  :config

  ;; make sure we have lsp-imenu everywhere we have LSP
  (require 'lsp-imenu)
  (add-hook 'lsp-after-open-hook 'lsp-enable-imenu)
  ;; get lsp-python-enable defined
  ;; NB: use either projectile-project-root or ffip-get-project-root-directory
  ;;     or any other function that can be used to find the root directory of a project
  (lsp-define-stdio-client lsp-python "python"
                           #'projectile-project-root
                           '("pyls"))

  ;; make sure this is activated when python-mode is activated
  ;; lsp-python-enable is created by macro above
  (add-hook 'python-mode-hook
            (lambda ()
              (lsp-python-enable)))

  ;; lsp extras
  (use-package lsp-ui
    :ensure t
    :config
    (setq lsp-ui-sideline-ignore-duplicate t)
    (add-hook 'lsp-mode-hook 'lsp-ui-mode))

  (use-package company-lsp
    :config
    (push 'company-lsp company-backends))

  ;; NB: only required if you prefer flake8 instead of the default
  ;; send pyls config via lsp-after-initialize-hook -- harmless for
  ;; other servers due to pyls key, but would prefer only sending this
  ;; when pyls gets initialised (:initialize function in
  ;; lsp-define-stdio-client is invoked too early (before server
  ;; start)) -- cpbotha
  (defun lsp-set-cfg ()
    (let ((lsp-cfg `(:pyls (:configurationSources ("flake8")))))
      ;; TODO: check lsp--cur-workspace here to decide per server / project
      (lsp--set-configuration lsp-cfg)))

  (add-hook 'lsp-after-initialize-hook 'lsp-set-cfg))

  ;; (require 'lsp-pylsp)

(use-package pyvenv
  :config
  (pyvenv-mode 1)
  ;; (setq pyvenv-workon "py37")  ; Default venv
  (pyvenv-tracking-mode 1)
  )  ; Automatically use pyvenv-workon via dir-locals

(provide 'setup-python)

;;; setup-python-lsp-python ends here
