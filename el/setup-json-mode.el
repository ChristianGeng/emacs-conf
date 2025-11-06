;;; setup-json-mode.el --- summary -*- lexical-binding: t -*-

;; Author: CGeng
;; Maintainer: CGeng
;; Version: version
;; Package-Requires: (dependencies)

;;; Commentary:

;; commentary

;;; Code:


  ;;; name.el ends here
(add-hook 'json-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 4)
            (flycheck-mode)
            )
          )


(defun beautify-json ()
"Make json formatting beautiful in selected region.
    Formats json region to be better readable by a human."
  (interactive)
  (let ((b (if mark-active (min (point) (mark)) (point-min)))
        (e (if mark-active (max (point) (mark)) (point-max))))
    (shell-command-on-region b e
                             "python -m json.tool" (current-buffer) t)))


(provide 'setup-json-mode)
;;; setup-json-mode.el ends here
