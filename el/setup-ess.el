;;; setup-ess.el --- summary -*- lexical-binding: t -*-
  ;;
    ;;; Code:

  (message "Setting up ESS.")

;;; emacs speaks statistics
  (use-package ess
    :ensure t
    :init
    (require 'ess-site)
    )

  (provide 'setup-ess)
  ;;; setup-ess ends here
