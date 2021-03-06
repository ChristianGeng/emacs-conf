;;; Pretty lambdas

(add-hook 'emacs-lisp-mode-hook 'pretty-lambdas)

;;; ElDoc

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)




;;; Lisp without paredit is a pain
(require 'paredit)

(defun turn-on-paredit ()
  (paredit-mode +1))

;; (enable-paredit-mode)
;; (add-hook 'emacs-lisp-mode-hook 'turn-on-paredit)

(add-hook 'emacs-lisp-mode-hook 'projectile-mode)

;;; Remove compiled .elc files on source changes

(defun esk-remove-elc-on-save ()
  "If you're saving an elisp file, likely the .elc is no longer valid."
  (make-local-variable 'after-save-hook)
  (add-hook 'after-save-hook
            (lambda ()
              (if (file-exists-p (concat buffer-file-name "c"))
                  (delete-file (concat buffer-file-name "c"))))))

(add-hook 'emacs-lisp-mode-hook 'esk-remove-elc-on-save)

(provide 'setup-lisp)

