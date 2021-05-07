(require 'dired)
(require 'dash)
(require 'dired-narrow)
;; installed via el-get
;; (require 'dired+)

;; (require 'atool)
;; (dired-atool-setup)

;; vcs highlighting in dired mode, see
;; https://emacs.stackexchange.com/questions/9503/how-can-i-visualize-vcs-status-in-dired
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)
(add-hook 'dired-mode-hook 'diff-hl-margin-mode)

;; Note: atool needs to be installed using apt-get install
(define-key dired-mode-map "z" #'dired-atool-do-unpack)
(define-key dired-mode-map "Z" #'dired-atool-do-pack)
;; alternative:
;; https://stackoverflow.com/questions/1431351/how-do-i-uncompress-unzip-within-emacs
;; (eval-after-load "dired-aux"
;;    '(add-to-list 'dired-compress-file-suffixes
;;                  '("\\.zip\\'" ".zip" "unzip")))

;;narrow dired to match filter
(use-package dired-narrow
  :ensure t
  :bind (:map dired-mode-map
              ("/" . dired-narrow)))


;; Inside `use-package dired`
;; https://github.com/daviwil/emacs-from-scratch/blob/master/show-notes/Emacs-10.org
(use-package dired-single)


;; https://www.emacswiki.org/emacs/DiredSorting
;; (setq dired-listing-switches "-alh")
(setq dired-listing-switches "-aBhl  --group-directories-first")

;; setting is cool if you want to split dired windows and copy files between them. See here:
;; https://emacs.stackexchange.com/questions/5603/how-to-quickly-copy-move-file-in-emacs-dired
(setq dired-dwim-target t)

;; don not ask for recursive deletion separately for each dir
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; see https://www.emacswiki.org/emacs/DiredReuseDirectoryBuffer
(eval-after-load "dired"
  ;; don't remove `other-window', the caller expects it to be there
  '(defun dired-up-directory (&optional other-window)
     "Run Dired on parent directory of current directory such that '^' does not create a new buffer"
     (interactive "P")
     (let* ((dir (dired-current-directory))
     	    (orig (current-buffer))
     	    (up (file-name-directory (directory-file-name dir))))
       (or (dired-goto-file (directory-file-name dir))
     	   ;; Only try dired-goto-subdir if buffer has more than one dir.
     	   (and (cdr dired-subdir-alist)
     		(dired-goto-subdir up))
     	   (progn
     	     (kill-buffer orig)
     	     (dired up)
     	     (dired-goto-file dir))))))



;; not bad but too much rebinding (overrides marking of files etc)
;;(dired-fdclone)

;; Make dired less verbose
;; (require 'dired-details)
;; (setq-default dired-details-hidden-string "--- ")
;; (dired-details-install)

;; Reload dired after making changes
(--each '(dired-do-rename
          dired-create-directory
          wdired-abort-changes)
        (eval `(defadvice ,it (after revert-buffer activate)
                 (revert-buffer))))

;; C-a is nicer in dired if it moves back to start of files
(defun dired-back-to-start-of-files ()
  (interactive)
  (backward-char (- (current-column) 2)))

(define-key dired-mode-map (kbd "C-a") 'dired-back-to-start-of-files)

;; M-up is nicer in dired if it moves to the fourth line - the first file
(defun dired-back-to-top ()
  (interactive)
  (beginning-of-buffer)
  (dired-next-line 4))

(define-key dired-mode-map (vector 'remap 'beginning-of-buffer) 'dired-back-to-top)
(define-key dired-mode-map (vector 'remap 'smart-up) 'dired-back-to-top)

;; M-down is nicer in dired if it moves to the last file
(defun dired-jump-to-bottom ()
  (interactive)
  (end-of-buffer)
  (dired-next-line -1))

(define-key dired-mode-map (vector 'remap 'end-of-buffer) 'dired-jump-to-bottom)
(define-key dired-mode-map (vector 'remap 'smart-down) 'dired-jump-to-bottom)

;; Delete with C-x C-k to match file buffers and magit
(define-key dired-mode-map (kbd "C-x C-k") 'dired-do-delete)

(eval-after-load "wdired"
  '(progn
     (define-key wdired-mode-map (kbd "C-a") 'dired-back-to-start-of-files)
     (define-key wdired-mode-map (vector 'remap 'beginning-of-buffer) 'dired-back-to-top)
     (define-key wdired-mode-map (vector 'remap 'end-of-buffer) 'dired-jump-to-bottom)))



;; If you add this to your .emacs, you'll be able to open the files via the keybinding 'F'.
;; https://stackoverflow.com/questions/1110118/in-emacs-dired-how-to-find-visit-multiple-files
(eval-after-load "dired"
  '(progn
     (define-key dired-mode-map "F" 'my-dired-find-file)
     (defun my-dired-find-file (&optional arg)
       "Open each of the marked files, or the file under the point, or when prefix arg, the next N files "
       (interactive "P")
       (let* ((fn-list (dired-get-marked-files nil arg)))
         (mapc 'find-file fn-list)))))


(require 'dired-k)
(define-key dired-mode-map (kbd "K") 'dired-k)


(require 'dired-quick-sort)
(dired-quick-sort-setup)


;; (add-hook 'python-mode-hook 'isort-mode)

(require 'dired-sort)



(defun xah-open-in-external-app (&optional @fname)
  "Open the current file or dired marked files in external app.
When called in emacs lisp, if @fname is given, open that.
URL `http://ergoemacs.org/emacs/emacs_dired_open_file_in_ext_apps.html'
Version 2019-11-04 2021-02-16"
  (interactive)
  (let* (
         ($file-list
          (if @fname
              (progn (list @fname))
            (if (string-equal major-mode "dired-mode")
                (dired-get-marked-files)
              (list (buffer-file-name)))))
         ($do-it-p (if (<= (length $file-list) 5)
                       t
                     (y-or-n-p "Open more than 5 files? "))))
    (when $do-it-p
      (cond
       ((string-equal system-type "windows-nt")
        (mapc
         (lambda ($fpath)
           (shell-command (concat "PowerShell -Command \"Invoke-Item -LiteralPath\" " "'" (shell-quote-argument (expand-file-name $fpath )) "'")))
         $file-list))
       ((string-equal system-type "darwin")
        (mapc
         (lambda ($fpath)
           (shell-command
            (concat "open " (shell-quote-argument $fpath))))  $file-list))
       ((string-equal system-type "gnu/linux")
        (mapc
         (lambda ($fpath) (let ((process-connection-type nil))
                            (start-process "" nil "xdg-open" $fpath))) $file-list))))))

(define-key dired-mode-map (kbd "<C-return>") 'xah-open-in-external-app)




(provide 'setup-dired)
