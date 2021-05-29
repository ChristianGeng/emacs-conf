;;; package --- Summary"
;;; Commentary:
;;; Code:
;;;
;; nearly all of this is the default layout
;; interesting example conf at https://github.com/purcell/emacs.d/blob/master/lisp/init-ibuffer.el
;; https://www.emacswiki.org/emacs/IbufferMode#toc4


;; after load raises an issue!
;; (after-load 'ibuffer
;;   ;; Use human readable Size column instead of original one
;;   (define-ibuffer-column size-h
;;     (:name "Size" :inline t)
;;     (cond
;;      ((> (buffer-size) 1000000) (format "%7.1fM" (/ (buffer-size) 1000000.0)))
;;      ((> (buffer-size) 1000) (format "%7.1fk" (/ (buffer-size) 1000.0)))
;;      (t (format "%8d" (buffer-size))))))



(setq ibuffer-formats
      '((mark modified read-only " "
              (name 40 40 :left :elide) ; change: 30s were originally 18s
              " "
              (size 9 -1 :right)
              " "
              (mode 16 16 :left :elide)
              " " filename-and-process)
        (mark " "
              (name 16 -1)
              " " filename)))


(setq ibuffer-saved-filter-groups
      (quote (
              ("pythonic"
               ("shell" (
                         or
                         (mode . shell-mode)
                         (mode . eshell-mode)
                         (mode . term-mode)
                         ))
               ("python" (
                          or (mode . python-mode)
                             (mode . django-mode)
                             (mode . elpy-mode)
                             (mode . inferior-python-mode)
                             (name . "^\\*Elpy Output\\*$")
                             ))

               ("planner" (or
                           (name . "^\\*Calendar\\*$")
                           (name . "^diary$")
                           (mode . muse-mode)
                           (mode . org-mode)
                           (mode . markdown-mode)
                           (mode . rst-mode)
                           ))
               ("config"(
                         or (mode . yaml-mode)
                            (mode . nxml-mode)
                            (mode . json-mode)
                            (mode . conf-mode)
                            (mode . conf-space-mode)
                            (mode . shell-script-mode)
                            (mode . dockerfile-mode)
                            (mode . jinja2-mode)
                         ))
               ("jvm languages" (or
                             (mode . groovy-mode)
                             (mode . shell-mode)
                             (mode . java-mode)
                             ))
               ("web" (or
                       (mode . javascript-mode)
                       (mode . web-mode)
                       (mode . vue-mode)
                       (mode . js-mode)
                       (mode . js2-mode)
                             ))
               ("dired" (mode . dired-mode))
               ("emacs/lisp" (or
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*Messages\\*$")
                         (mode . emacs-lisp-mode)))
               )
              ("default2"
               ("python" (
                          or (mode . python-mode)
                             (mode . shell-mode)
                             (mode . django-mode)
                             (mode . elpy-mode)
                             (mode . inferior-python-mode)
                             (name . "^\\*Elpy Output\\*$")
                             ))
               ("dired" (mode . dired-mode))
               ("json/js" (mode . javascript-mode))
               ("planner" (or
                           (name . "^\\*Calendar\\*$")
                           (name . "^diary$")
                           (mode . muse-mode)
                           (mode . org-mode)
                           ))
               ("emacs" (or
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*Messages\\*$")
                         (mode . emacs-lisp-mode)))
               )


              )
             )
      )



;;(add-to-list 'ibuffer-never-show-predicates "^\\*Hmm")

 (add-hook 'ibuffer-mode-hook
              (lambda ()
                (ibuffer-switch-to-saved-filter-groups "pythonic")))

(provide 'setup-ibuffer)
;;; setup-ibuffer.el ends here
