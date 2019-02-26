
;; (use-package projectile
;;    :ensure t
;;    :bind-keymap (("C-c p" . projectile-command-map)))

(use-package projectile
   :ensure tg
   :bind-keymap (("s-c" . projectile-command-map)))


(add-hook 'clojure-mode-hook 'projectile-mode)
(add-hook 'ruby-mode-hook 'projectile-mode)


(provide 'setup-projectile)
