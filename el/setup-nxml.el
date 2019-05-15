;;; reformat nxml mode

(defun local-nxml-hook ()
  (setq indent-tabs-mode t)
  (setq nxml-child-indent 4)
  )

(add-hook 'nxml-mode-hook '(lambda () (local-nxml-hook)))

(provide 'setup-nxml)
