
(require 'org)
(require 'org-capture)
(require 'org-crypt)
(require 'org-tempo)
(require 'org-id)
;; Enable ob-calc
(require 'ob-calc)
;; Enable org-mobile
(require 'org-mobile)
;; Enable org-collector
(require 'org-collector)
;; Enable org-protocol
(require 'org-protocol)
;; (require 'org-protocol-capture-html)
;; (setq org-protocol-capture-html-pandoc-no-wrap-option "--wrap=none")
;; org-web-tools
;; (require 'org-web-tools)
;; (setq org-web-tools-pandoc-sleep-time 5.0)
;; Enable org-contacts
(require 'org-contacts)
(add-to-list 'org-contacts-files (concat org-directory "/peo.org"))
(setq org-contacts-icon-use-gravatar nil)
;; Enable org-eww
;; (require 'org-eww)
;; (require 'org-journal)

;; (require 'org-outlook) -> windows

 ;; Kill the frame if one was created for the capture
  (defvar kk/delete-frame-after-capture 0 "Whether to delete the last frame after the current capture")

  (defun kk/delete-frame-if-neccessary (&rest r)
    (cond
     ((= kk/delete-frame-after-capture 0) nil)
     ((> kk/delete-frame-after-capture 1)
      (setq kk/delete-frame-after-capture (- kk/delete-frame-after-capture 1)))
     (t
      (setq kk/delete-frame-after-capture 0)
      (delete-frame))))

  (advice-add 'org-capture-finalize :after 'kk/delete-frame-if-neccessary)
  (advice-add 'org-capture-kill :after 'kk/delete-frame-if-neccessary)
  (advice-add 'org-capture-refile :after 'kk/delete-frame-if-neccessary)




(defun transform-square-brackets-to-round-ones(string-to-transform)
  "Transforms [ into ( and ] into ), other chars left unchanged."
  (concat 
  (mapcar #'(lambda (c) (if (equal c ?[) ?\( (if (equal c ?]) ?\) c))) string-to-transform))
  )

(setq org-capture-templates `(
	("p" "Protocol" entry (file+headline ,(concat org-directory "notes.org") "Inbox")
        "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")	
	("L" "Protocol Link" entry (file+headline ,(concat org-directory "notes.org") "Inbox")
        "* %? [[%:link][%(transform-square-brackets-to-round-ones \"%:description\")]]\n")
))

(provide 'setup-org-slim)
;;; setup-org.el ends here
