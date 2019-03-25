;; (require 'yasnippet)


(message "before yasnippet settup el!")

(use-package yasnippet
  :if (not noninteractive)
  :diminish yas-minor-mode
  :commands (yas-global-mode yas-minor-mode)
  :config
  (progn
    (setq yas-indent-line nil)
    (setq yas-snippet-dirs
      '("~/.emacs.d/snippets"
        ))
  )
)



;; (setq yas-snippet-dirs
;;       '("~/.emacs.d/snippets"                 ;; personal snippets
;;         "/path/to/some/collection/"           ;; foo-mode and bar-mode snippet collection
;;         "/path/to/yasnippet/yasmate/snippets" ;; the yasmate collection
;;         ))

;;(require 'setup-yasnippet)
(message "AFTER yasnippet settup el!")



;; Python devel und yasnippet: http://longhorizon.org/blog/2013/03/31/improving-python-development-in-emacs-with-yasnippet/

;;(add-to-list 'warning-suppress-types '(yasnippet backquote-change))

;; Use only own snippets, do not use bundled ones
;;
(setq yas-snippet-dirs (list (concat user-emacs-directory "snippets")))
(setq yas-snippets-dirs (list (concat user-emacs-directory "snippets")))

;; (setq yas-snippet-dirs (list (concat user-emacs-directory "snippets")))
;; (setq yas-snippetsg-dirs (list (concat user-emacs-directory "snippets")))

;; (concat user-emacs-directory "yasnippets")


;; (setq yas-snippet-dirs (list
;;                          (concat user-emacs-directory  "elpa/elpy-20161229.1103/snippets/python-mode/")
;;                          (concat  user-emacs-directory "elpa/yasnippet-20181211.2219/snippets/")
;;                          ))



;;(yas-reload-all)
(yas-global-mode 1)
(setq yas-global-mode 1)

;; Include snippets for Buster.js
;;(require 'buster-snippets)

;; Jump to end of snippet definition
;; (define-key yas-keymap (kbd "<return>") 'yas-exit-all-snippets)

;; Inter-field navigation
;; (defun yas-goto-end-of-active-field ()
;;   (interactive)
;;   (let* ((snippet (car (yas-snippets-at-point)))
;;         (position (yas-field-end (yas-snippet-active-field snippet))))
;;     (if (= (point) position)
;;         (move-end-of-line)
;;       (goto-char position))))

;; (defun yas-goto-start-of-active-field ()
;;   (interactive)
;;   (let* ((snippet (car (yas-snippets-at-point)))
;;         (position (yas-field-start (yas-snippet-active-field snippet))))
;;     (if (= (point) position)
;;         (move-beginning-of-line)
;;       (goto-char position))))

;; (define-key yas-keymap (kbd "C-e") 'yas-goto-end-of-active-field)
;; (define-key yas-keymap (kbd "C-a") 'yas-goto-start-of-active-field)

;; No dropdowns please, yas
;;(setq yas-prompt-functions '(yas-ido-prompt yas-completing-prompt))


;; Wrap around region
(setq yas-wrap-around-region t)

(provide 'setup-yasnippet)
