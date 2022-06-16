;;; setup-ess.el --- summary -*- lexical-binding: t -*-
;;
  ;;; Code:

(message "Lsp Python begins here")

        ;;; emacs speaks statistics
(use-package ess
  :ensure t
  :init
  (require 'ess-site)
  )

(provide 'setup-ess)
;;; setup-python-lsp-python ends here
