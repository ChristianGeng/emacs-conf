;; https://github.com/szermatt/emacs-bash-completion

;; add this into your .emacs file:

 (autoload 'bash-completion-dynamic-complete 
   "bash-completion"
   "BASH completion hook")
 (add-hook 'shell-dynamic-complete-functions
           'bash-completion-dynamic-complete)


;; ;; https://stackoverflow.com/questions/1008750/ide-emacs-mode-for-shell-scripting-in-bash-sh-etc
  (require 'auto-complete)
  (require 'auto-complete-config)
;;   (ac-config-default)


;; (yas-reload-all)
;; (add-hook 'shell-script-mode-hook #'yas-minor-mode)


;;(add-hook 'shell-script-mode-hook (lambda ()
;;                                    (yas-minor-mode)))

;;(add-hook 'sh-script-mode-hook (lambda ()  (yas-minor-mode)))


;; or simpler, but forces you to load this file at startup:

;; (require 'bash-completion)
;; (bash-completion-setup)

;; .  /etc/bash_completion does not exist, use this one: ??
;; .  /etc/bash_completion.d/cygport-bash-completion

;; add yas in shell scripts                                                                                                                                                                                                                                                                                                                                                
;;(yas-reload-all)
;; (add-hook 'shell-script-mode-hook #'yas-minor-mode)


;;(yas-reload-all)
;;(add-hook 'shell-mode-hook #'yas-minor-mode)

(provide 'setup-bash)
