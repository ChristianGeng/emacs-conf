;; Capture

;; Targets that contribute to the agenda view
;; '(org-agenda-files (quote ("~/.emacs.d/agenda.org")))
;; Den Standard File mit den Bookmarks immer aufmachen
;; (find-file (concat (org-directory "/ref.org")))
;; https://stackoverflow.com/questions/11384516/how-to-make-all-org-files-under-a-folder-added-in-agenda-list-automatically
;; Targets that contribute to the agenda view

;; Variablen wie org-directory können nicht mit setq gesetzt werden wie in (setq org-directory "~/Dropbox/org")
;; Man muss custom-set-variables verwenden, siehe
;; https://stackoverflow.com/questions/36873628/how-to-add-org-files-under-org-directory-to-agenda
(custom-set-variables
 '(org-directory "~/Dropbox/org")
 '(org-default-notes-file (joindirs org-directory "agenda.org"))
'(org-agenda-files (list org-directory)))
;;  '(org-default-notes-file (joindirs org-directory "ref.org"))
;;  '(org-directory "~/Dropbox/org")

;;(setq org-agenda-files (list org-directory))

;;
;;  '(org-agenda-files (joindirs org-directory "agenda.org"))
;; (find-file org-default-notes-file)

(add-to-list 'org-link-abbrev-alist '("local"   ."~/"))
(add-to-list 'org-link-abbrev-alist '("val"     . "TBA"))
