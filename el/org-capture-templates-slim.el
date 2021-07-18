
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
;; (add-to-list 'org-contacts-files (concat org-directory "/peo.org"))
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



;;;; original main categories inherited:
;; ("t" "Tasks")
;; tt TODO
;; ("p" "Possessions")
;; pl-loaned; pk - sell, p - j purchased
;; Templates for the MULTIMEDIA keyword sequence
;; ("m" "Multimedia")
;; mr - consume
;; These templates are used with the EVENTS TODO sequence
;; ("e" "Events")
;; em - meeting, ey -  visited
;; ("n" "Non-TODO States")
;; nj - journal;
;; nn - note
;; np - paycheck
;; ("o" "Org-Protocol")

;; BrainTool uses the **PARA** Topic Model
;; https://braintool.org/2021/04/21/My-BrainTool-orgmode-and-emacs-workflow.html
;;
;;
;;
;; P Projects,
;; A Areas,
;; R Resources
;; A Archive
;; Although I add a ‘T’ for ‘To Rea


;; Example: Writing a Blog Post:
;; Project: “product X launch,”
;; falls under an area of responsibility called “Product Development.”
;;


;; t - tasks - gut mit todods
;; e - events m meeting
;; n non toto: enhält nur das contact template das interessant sein könnten
;; o - org protocol - hat autch todo meeting (aber wichtiger: website recipes)



;; '(org-default-notes-file (joindirs org-directory "agenda.org"))



;; die brauche ich nachher:
(setq org-capture-templates `(
	("p" "Protocol" entry (file+headline , (joindirs org-directory "protocol.org") "Inbox")
        "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
	("L" "Protocol Link" entry (file+headline ,(joindirs org-directory "protocol.org") "Inbox")
        "* %? [[%:link][%(transform-square-brackets-to-round-ones \"%:description\")]]\n")
))


;; (setq org-capture-templates
;;       '(
;;    ;; Templates for the TASKS keyword sequence
;;    ("t" "Tasks")
;;    ("o" "Org-Protocol")
;;    )
;; )


(message (concat (number-to-string(length org-capture-templates)) " Org capture templates ohne Zusätze" ))

(print org-capture-templates)


;; --- RECIPES
;; https://github.com/Chobbes/org-chef
(use-package org-chef
  :ensure t)

;; (add-to-list 'org-capture-templates
;;      '("or" "RECIPE    (r) Cooking Recipe (Manual Entry)" entry
;;       (file "cookbook.org")
;;       "* %^{Recipe title: }
;;       :PROPERTIES:
;; :source-url:
;; :servings:
;; :prep-time:
;; :cook-time:
;; :ready-in:
;;  :END:
;; ** Ingredienats:
;;  %?
;; ** Directions:

;; " :empty-lines 1) t
;;      )
;; (add-to-list 'org-capture-templates
;;              '("o" "Org-Protocol")
;; )

;; (add-to-list 'org-capture-templates
;;      '("oR" "RECIPE    (R) Cooking Recipe (from URL)" entry
;;       (file "cookbook.org")
;;       "%(org-chef-get-recipe-from-url)") t
;;      )

(message (concat (number-to-string(length org-capture-templates)) " Org Templates inklusive aus einem URL" ))




(provide 'setup-org-slim)
;;; setup-org.el ends here
