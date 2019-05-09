
;; (use-package projectile
;;    :ensure t
;;    :bind-keymap (("C-c C-p" . projectile-command-map)))

;; (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)

(setq projectile-keymap-prefix (kbd "C-c C-p"))
(require 'projectile)


;; (use-package projectile
;;    :ensure t
;;    :bind-keymap (("s-c" . projectile-command-map)))


;; (add-hook 'clojure-mode-hook 'projectile-mode)
;; (add-hook 'ruby-mode-hook 'projectile-mode)


(provide 'setup-projectile)
