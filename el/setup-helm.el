;;; package --- Helm Configuration
;;; Commentary:
;;; Helm Setup
;;; Code:

(require 'helm)
(require 'helm-config)



;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))


;; helm-split-window-in-side-p           nil ; open helm buffer inside current window, not occupy whole other window

;; (setq helm-move-to-line-cycle-in-source     t   ; move to end or beginning of source when reaching top or bottom of source.
;;       helm-ff-search-library-in-sexp        t   ; search for library in `require' and `declare-function' sexp.
;;       helm-scroll-amount                    8   ; scroll 8 lines other window using M-<next>/M-<prior>
;;       helm-ff-file-name-history-use-recentf t
;;       helm-echo-input-in-header-line t)



(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 20)
(helm-autoresize-mode 1)

(helm-mode 1)


;; (global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x

;;(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-M-y") 'helm-show-kill-ring)

(global-set-key (kbd "C-x b") 'helm-mini)

(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)

(require 'helm-dictionary)

(provide 'setup-helm)
;;; setup-helm.el ends here
