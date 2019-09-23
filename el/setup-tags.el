;;; package --- Summary
;;; Commentary:
;; https://www.emacswiki.org/emacs/EmacsTags
;; https://www.emacswiki.org/emacs/BuildTags
;; https://www.gnu.org/software/global/

;;; Code:

  (defun create-tags (dir-name)
     "Create tags file."
     (interactive "DDirectory: ")
     (eshell-command
      (format "find %s -type f -name \"*.[ch]\" | etags -" dir-name)))


(provide 'setup-tags)
;;; setup-tags.el ends here
