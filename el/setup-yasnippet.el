;; (require 'yasnippet)

(use-package yasnippet
  :if (not noninteractive)
  :diminish yas-minor-mode
  :hook ((text-mode
          ;; prog-mode
          conf-mode
          ruby-mode
          sphinx-doc-mode
          rst-minor-mode
          jdee-mode
          lsp-mode
          java-mode
          Shell-script-mode
          web-mode
          groovy-mode
          python-mode
          vue-html-mode
          vue-mode
          snippet-mode) . yas-minor-mode-on)
  ;; :commands (yas-global-mode yas-minor-mode)
  :config
  ;; (yas-global-mode)
  (yas-reload-all)
  ()
  (progn
    (setq yas-indent-line nil)
    ;; (setq yas-snippet-dirs
    ;;       (list
    ;;        (joindirs user-emacs-directory "snippets")
    ;;        (joindirs user-emacs-directory "yasmate" "snippets")))
    ;; Wrap around region
    (setq yas-wrap-around-region t)
    )
  :bind
  (:map yas-minor-mode-map
        ("<tab>" . nil)
        ("TAB" . nil)
        )
)

(defvar yasmate-snippet-root (expand-file-name "snippets/yasmate" user-emacs-directory))

(defun yasmate-snippets-initialize ()
  (let ((snip-dir  (expand-file-name "yasmate/snippets" user-emacs-directory)))
    (when (boundp 'yas-snippet-dirs)
      (add-to-list 'yas-snippet-dirs snip-dir t))
    (yas-load-directory snip-dir)))

(yasmate-snippets-initialize)
;; (add-to-list 'yas-snippet-dirs (expand-file-name "yasmate/snippets" user-emacs-directory) t)

(message (concat (number-to-string(length yas-snippet-dirs)) " nsnippet drectories" ))
(yas-snippet-dirs)
(printlist yas-snippet-dirs)


;; (defun doom-snippets-initialize ()
;;   (let ((snip-dir  (expand-file-name "snippets/doom-snippets" user-emacs-directory)))
;;     (when (boundp 'yas-snippet-dirs)
;;       (add-to-list 'yas-snippet-dirs snip-dir t))
;;     (yas-load-directory snip-dir)))

;; (doom-snippets-initialize)

;; not loadable, why???
;; (use-package doom-snippets
;;   :load-path (joindirs user-emacs-directory "snippets" "doom-snippets")
;;   :after yasnippet)

;; from buster
;;;###autoload
;; (defun buster-snippets-initialize ()
;;   (let ((snip-dir (expand-file-name "snippets" buster-snippets-root)))
;;     (when (boundp 'yas-snippet-dirs)
;;       (add-to-list 'yas-snippet-dirs snip-dir t))
;;     (yas-load-directory snip-dir)))

;; ;;;###autoload
;; (eval-after-load "yasnippet"
;;   '(buster-snippets-initialize))


;; (append-)

;; (setq yas-snippet-dirs '("~/.emacs.d/snippets" "~/.emacs.d/yasmate/snippets"))
;; ;; (yas-global-mode 1)

;; (setq yas-snippet-dirs (list (concat user-emacs-directory "snippets")))(provide 'setup-groovy)
;; ;;; setup-groovy ends here





;;(add-to-list (list (yas-snippet-dirs)) "asdas")
;;(concat 'yas-snippet-dirs '("asdas"))

;; (setq yas-snippet-dirs (append yas-snippet-dirs '("other dir")))
;; ;;                    '((joindirs user-emacs-directory "yasmate" "snippets"))))

;;

;; (setq yas-snippet-dirs (list (concat user-emacs-directory "snippets")))
;; (setq yas-snippets-dirs (list (concat user-emacs-directory "snippets")))

;; (setq yas-snippet-dirs (list (concat user-emacs-directory "snippets")))
;; (setq yas-snippetsg-dirs (list (concat user-emacs-directory "snippets")))


;; (directory-files (joindirs user-emacs-directory "yasmate" "snippets"))

;; unbind the tab for the snippets
;; (define-key yas-minor-mode-map (kbd "<tab>") nil)
;; (define-key yas-minor-mode-map (kbd "TAB") nil)


;; (setq yas-snippet-dirs
;;       '("~/.emacs.d/snippets"                 ;; personal snippets
;;         "/path/to/some/collection/"           ;; foo-mode and bar-mode snippet collection
;;         "/path/to/yasnippet/yasmate/snippets" ;; the yasmate collection
;;         ))
;;
;; Python devel und yasnippet: http://longhorizon.org/blog/2013/03/31/improving-python-development-in-emacs-with-yasnippet/



(provide 'setup-yasnippet)
