
;; https://github.com/szermatt/emacs-bash-completion

;; add this into your .emacs file:

 (autoload 'bash-completion-dynamic-complete 
   "bash-completion"
   "BASH completion hook")
 (add-hook 'shell-dynamic-complete-functions
           'bash-completion-dynamic-complete)

;; or simpler, but forces you to load this file at startup:

;; (require 'bash-completion)
;; (bash-completion-setup)

;; .  /etc/bash_completion does not exist, use this one: ??
;; .  /etc/bash_completion.d/cygport-bash-completion

;; add yasnippet hook in shell scripts
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(provide 'setup-bash)
