
(use-package wttrin
  :ensure t
  :commands (wttrin)
  :init
  (setq wttrin-default-cities '("München" "Meersburg" "Bayrischzell" "Berlin"))
  (setq wttrin-default-accept-language '("Accept-Language" . "de-DE"))
  )

  (provide 'setup-wttrin)
