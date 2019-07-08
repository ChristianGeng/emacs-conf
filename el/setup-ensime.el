
(require 'ensime)

(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))


(defun local-scala-hook ()
  (yas-reload-all)
  (add-hook 'prog-mode-hook #'yas-minor-mode)
  )


(add-hook 'prog-mode-hook #'flycheck-mode)

(add-hook 'scala-mode-hook '(lambda () (local-scala-hook)))


(provide 'setup-ensime)
