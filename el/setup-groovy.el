;;; package --- setup groovy
;;; Commentary:
;;; Setup Groovy
;;; Code:


;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
;; (add-to-list 'load-path "~/.emacs.d/lisp/vendor/groovy-mode")
(autoload 'groovy-mode "groovy-mode" "Major mode for editing Groovy code." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'auto-mode-alist '("\.gradle$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

;;; make Groovy mode electric by default.
(add-hook 'groovy-mode-hook
          '(lambda ()
;;             (require 'groovy-electric)
;;             (groovy-electric-mode)
             (paren-activate)
             (rainbow-delimiters-mode)
             )
          )

(add-hook 'groovy-mode-hook
          (lambda ()  (yas-minor-mode 1))
          (paren-activate)
          )

(provide 'setup-groovy)
;;; setup-groovy ends here
