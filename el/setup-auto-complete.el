

(use-package company
  :ensure t
  :diminish company-mode
  :config
  (add-to-list 'company-backends 'company-elisp)
  (add-to-list 'company-backends 'company-yasnippet)
  (add-to-list 'company-backends 'company-dabbrev)
  (add-to-list 'company-backends 'company-dabbrev-code)
  (add-to-list 'company-backends 'company-etags)
  (setq company-auto-complete nil
        company-tooltip-flip-when-above t
        company-minimum-prefix-length 2
        company-tooltip-limit 10
        company-idle-delay 0.5)
  (global-company-mode 1))

;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20140414/dict")
;; (ac-config-default)

(provide 'setup-auto-complete)
