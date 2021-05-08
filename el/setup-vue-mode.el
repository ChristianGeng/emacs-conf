;;; package --- setup vue mode
;;; Commentary:
;;; taken from https://azzamsa.com/blog/vue-emacs
;;; npm install -g vue-language-server
;;; update:
;;; vue-language-server deprecated, republished as vls,
;;; see https://github.com/neoclide/coc-vetur/issues/28
;;; also:
;;; npm uninstall -g vue-language-server -save
;;; npm install -g vls
;;; npm install -g eslint
;;; https://github.com/emacs-lsp-legacy/lsp-vue
;;; vue mode setup
;;; Here is how to manually install eslint checker:
;;; https://github.com/flycheck/flycheck/issues/514
;;; However, we don't need that, because lsp takes care of this!
;;; Code:


(use-package lsp-mode
  :commands lsp)

;; for completions
;; (use-package company-lsp
;;   :after lsp-mode
;;   :config (push 'company-lsp company-backends))

(use-package vue-mode
  :mode "\\.vue\\'"
  :config
  (add-hook 'vue-mode-hook #'lsp))


(defun local-vue-hook ()
  (emmet-mode)
  )

(add-hook 'vue-mode-hook
          (lambda ()
            (local-vue-hook)
            ()
            )
          )

(add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode))

;; cant add checker ...
;; (add-hook 'vue-mode-hook (flycheck-select-checker 'javascript-eslint))
;; (setq mmm-vue-html-mode-exit-hook (lambda ()
;;                                 (message "Run when leaving vue-html mode")
;;                                 (emmet-mode -1)))
;; (setq mmm-vue-html-mode-enter-hook (lambda ()
;;                                 (message "Run when entering vue-html mode")
;;                                 (emmet-mode 1)))

;; add emmet mode  hooks:
;; see https://github.com/AdamNiederer/vue-mode/issues/18
;; this post explains why web-mode should not be hooked into vue mode
(add-hook 'vue-html-mode 'emmet-mode)
(add-hook 'vue-mode 'emmet-mode)






;; does not work
(defun vue-mode/init-vue-mode ()
  "Change the region coloring.
0, 1, or 2, representing (respectively) none, low, and high coloring.
see https://github.com/AdamNiederer/vue-mode"
  (use-package vue-mode
               :config
               (setq mmm-submode-decoration-level 1)))

(provide 'setup-vue-mode)
;;; setup-vue-mode.el ends here
