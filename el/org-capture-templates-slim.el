
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
;; (require 'org-contacts)
;; (add-to-list 'org-contacts-files (concat org-directory "/peo.org"))
;; (setq org-contacts-icon-use-gravatar nil)
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



;; Note: capture op and oL have to match the browser extension's values
(setq org-capture-templates `(
   ("e" "Events")
   ("t" "Tasks")
   ("o" "Org-Protocol")
   ("op" "Protocol" entry (file+headline , (joindirs org-directory "protocol.org") "Inbox")
    "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
   ("oL" "Protocol Link" entry (file+headline ,(joindirs org-directory "protocol.org") "Inbox")
    "* %? [[%:link][%(transform-square-brackets-to-round-ones \"%:description\")]]\n")
))

;; (message (concat (number-to-string(length org-capture-templates)) " Org capture templates ohne Zusätze" ))

;; (print org-capture-templates)


;; --- RECIPES
;; https://github.com/Chobbes/org-chef
(use-package org-chef
  :straight t)

;; (message (concat (number-to-string(length org-capture-templates)) " Org Templates inklusive aus einem URL" ))


(add-to-list 'org-capture-templates
     '("or" "RECIPE    (r) Cooking Recipe (Manual Entry)" entry
      (file "cookbook.org")
      "* %^{Recipe title: }
      :PROPERTIES:
:source-url:
:servings:
:prep-time:
:cook-time:
:ready-in:
 :END:
** Ingredienats:
 %?
** Directions:

" :empty-lines 1) t
     )


(add-to-list 'org-capture-templates
     '("oR" "RECIPE    (R) Cooking Recipe (from URL)" entry
      (file "cookbook.org")
      "%(org-chef-get-recipe-from-url)") t
     )



(add-to-list 'org-capture-templates
   ;; TODO     (t) Todo template
   '("tt" "TODO      (t) Todo" entry (file org-default-notes-file)
    "* TODO %?
  :PROPERTIES:
  :Via:
  :Note:
  :END:
  :LOGBOOK:
  - State \"TODO\"       from \"\"           %U
  :END:" :empty-lines 1) t
  )

(add-to-list 'org-capture-templates
   ;; DONE     (d) Done template
   '("td" "DONE      (d) Done" entry (file org-default-notes-file)
    "* DONE %?
  CLOSED: %U
  :PROPERTIES:
  :Via:
  :Note:
  :END:
  :LOGBOOK:
  - State \"DONE\"       from \"\"           %U
  :END:" :empty-lines 1) t
  )

(add-to-list 'org-capture-templates
   ;; MEETING  (m) Meeting template
   '("em" "MEETING   (m) Meeting" entry (file org-default-notes-file)
    "* MEETING %?
  CLOSED: %^U
  :PROPERTIES:
  :Attend:   [[peo:Christian Geng][Christian Geng]]
  :Location:
  :Via:
  :Note:
  :END:
  :LOGBOOK:
  - State \"MEETING\"    from \"\"           %U
  :END:
  %^T--%^T" :empty-lines 1) t
  )


(provide 'setup-org-slim)
;;; setup-org.el ends here
