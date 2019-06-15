(add-hook 'json-mode-hook #'flycheck-mode)


(defun beautify-json ()
  (interactive)
  (let ((b (if mark-active (min (point) (mark)) (point-min)))
        (e (if mark-active (max (point) (mark)) (point-max))))
    (shell-command-on-region b e
     "python -m json.tool" (current-buffer) t)))


(provide 'setup-json-mode)





