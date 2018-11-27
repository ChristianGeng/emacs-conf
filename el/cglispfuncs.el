
(defun close-all-buffers ()
(interactive)
  (mapc 'kill-buffer (buffer-list)))

;; rename a currently open buffer
;; https://stackoverflow.com/questions/384284/how-do-i-rename-an-open-file-in-emacs
;; https://sites.google.com/site/steveyegge2/my-dot-emacs-file
;; better; rename-current-buffer-file
(defun rename-file-and-buffer (new-name)
 "Renames both current buffer and file it's visiting to NEW-NAME." (interactive "sNew name: ")
 (let ((name (buffer-name))
	(filename (buffer-file-name)))
 (if (not filename)
	(message "Buffer '%s' is not visiting a file!" name)
 (if (get-buffer new-name)
	 (message "A buffer named '%s' already exists!" new-name)
	(progn 	 (rename-file filename new-name 1) 	 (rename-buffer new-name) 	 (set-visited-file-name new-name) 	 (set-buffer-modified-p nil)))))) ;;




;; interesting: http://web-mode.org/


;; lines words characters
 (defun wc (&optional start end)
   "Prints number of lines, words and characters in region or whole buffer."
   (interactive)
   (let ((n 0)
         (start (if mark-active (region-beginning) (point-min)))
         (end (if mark-active (region-end) (point-max))))
     (save-excursion
       (goto-char start)
       (while (< (point) end) (if (forward-word 1) (setq n (1+ n)))))
     (message "%3d %3d %3d" (count-lines start end) n (- end start))))

;;; print elements of list,. see https://www.gnu.org/software/emacs/manual/html_node/eintr/print_002delements_002dof_002dlist.html
(defun printlist (list)
  "Print each element of LIST on a line of its own."
  (while list
    (print (car list))
    (setq list (cdr list))))







;;;;;;;;;;;;;;;;;;;;;;;;
;;;; see https://stackoverflow.com/questions/8674912/how-to-collapse-whitespaces-in-a-region




;; https://www.emacswiki.org/emacs/ChangingEncodings

    (defun recode-region (start end &optional coding-system)
      "Replace the region with a recoded text."
      (interactive "r\n\zCoding System (utf-8): ")
      (setq coding-system (or coding-system 'utf-8))
      (let ((buffer-read-only nil)
	    (text (buffer-substring start end)))
        (delete-region start end)
        (insert (decode-coding-string (string-make-unibyte text) coding-system))))


;;; see this one: https://stackoverflow.com/questions/12492/pretty-printing-xml-files-on-emacs
(require 'sgml-mode)
(defun reformat-xml ()
  (interactive)
  (save-excursion
    (sgml-pretty-print (point-min) (point-max))
    (indent-region (point-min) (point-max))))

;;; this one is the better one!
(defun nxml-pretty-format ()
    (interactive)
    (save-excursion
        (shell-command-on-region (point-min) (point-max) "xmllint --format -" (buffer-name) t)
        (nxml-mode)
        (indent-region begin end)))





;; https://www.emacswiki.org/emacs/EndOfLineTips
(defun unix-file ()
  "Change the current buffer to Unix line-ends."
  (interactive)
  (set-buffer-file-coding-system 'unix t))

(defun dos-file ()
  "Change the current buffer to DOS line-ends."
  (interactive)
  (set-buffer-file-coding-system 'dos t))

(defun mac-file ()
  "Change the current buffer to Mac line-ends."
  (interactive)
  (set-buffer-file-coding-system 'mac t))

;; lumps several function into a big one for etengo thing
(defun format-properly (b e)
  "Run `indent-region', `untabify' and `delete-trailing-whitespace' in sequence."
  (interactive "*r")
  (when (use-region-p)
    (save-restriction
      (narrow-to-region b e)
      (replace-newlines-with-semicolon)
      (just-one-space-in-region b e)
      (kill-space-before-semicolon)
      )))
  
;; (global-set-key [f8] 'format-properly)


;;;;;;;;;;;;;;;;;;
;;; see https://stackoverflow.com/questions/5194294/how-to-remove-all-newlines-from-selected-region-in-emacs
(defun remove-newlines-in-region ()
  "Removes all newlines in the region."
  (interactive)
  (save-restriction
    (narrow-to-region (point) (mark))
    (goto-char (point-min))
    (while (search-forward "\n" nil t) (replace-match "" nil t))))


;;;;;;;;;;;;;;;;;;
(defun replace-newlines-with-semicolon ()
  "Removes all newlines in the region."
  (interactive)
  (save-restriction
    (narrow-to-region (point) (mark))
    (goto-char (point-min))
    (while (search-forward "\n" nil t) (replace-match ";" nil t))))



  ;;(global-set-key [f8] 'remove-newlines-in-region)

;;;;;;;;;;;;;;;;;;
(defun kill-space-before-semicolon ()
  "Removes all newlines in the region."
  (interactive)
  (save-restriction
    (narrow-to-region (point) (mark))
    (goto-char (point-min))
    (while (search-forward " ;" nil t) (replace-match "; " nil t))))

(defun just-one-space-in-region (beg end)
  "replace all whitespace in the region with single spaces"
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (while (re-search-forward "\\s-+" nil t)
        (replace-match " ")))))


(defun forwardize-slashes (beg end)
  "replace all backward slashes in the region with forward slashes"
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (while (search-forward "\\" nil t)
        (replace-match "/"))))
  )

(defun backwardize-slashes (beg end)
  "replace all forward slashes in the region with backward slashes"
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (while (search-forward "/" nil t)
        (replace-match "\\"))))
  )


;; from cursor, get a region delimited by parentheses
;; https://stackoverflow.com/questions/5194417/how-to-mark-the-text-between-the-parentheses-in-emacs
;; then use mark-sexp
(defun backward-up-sexp (arg)
  (interactive "p")
  (let ((ppss (syntax-ppss)))
    (cond ((elt ppss 3)
           (goto-char (elt ppss 8))
           (backward-up-sexp (1- arg)))
          ((backward-up-list arg)))))

(defun tpon ()
 "Activate the touchpad"
 (interactive)
 (shell-command "source cglib; tpon"))

(defun tpoff ()
 "Deactivate the touchpad"
 (interactive)
 (shell-command "source cglib; tpoff"))

(defun lock-screen ()
 "lock screen using screensaver"
 (interactive)
 (shell-command ". cglib; lock"))

(defun pull-google-cal()
 "update the google calendar ChristianGeng from google using script"
 (interactive)
 (shell-command "source cglib; bash getgooglecal.sh &>/dev/null"))





