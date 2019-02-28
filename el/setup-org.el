;; Links:
;; https://orgmode.org/worg/org-tutorials/orgtutorial_dto.html
;; https://orgmode.org/worg/org-tutorials/org4beginners.html
;; cool agenda commands
;; https://orgmode.org/manual/Agenda-commands.html


(require 'ox-taskjuggler)
(require 'org-tempo)
(require 'ox-rst)
(setq org-element-use-cache nil)

;; (add-to-list 'load-path (concat site-lisp-dir "/org-mode/lisp"))
;; (require 'org)


(defconst org-linewidth 100)
(add-hook 'org-mode-hook 'auto-fill-mode)
(add-hook 'org-mode-hook
          (lambda ()
            (set-fill-column org-linewidth)))

(defun myorg-update-parent-cookie ()
  (when (equal major-mode 'org-mode)
    (save-excursion
      (ignore-errors
        (org-back-to-heading)
        (org-update-parent-todo-statistics)))))

(defadvice org-kill-line (after fix-cookies activate)
  (myorg-update-parent-cookie))

(defadvice kill-whole-line (after fix-cookies activate)
  (myorg-update-parent-cookie))

;; Ensure the Latest Org-mode manual is in the info directory
(if (boundp 'Info-directory-list)
    (setq Info-directory-list (append Info-directory-list
                                      Info-default-directory-list))
  (setq Info-directory-list Info-default-directory-list))
(add-to-list 'Info-directory-list
             (concat site-lisp-dir "/org-mode/doc"))

(setq org-src-fontify-natively t
      org-src-tab-acts-natively t
      org-startup-indented t
      org-log-into-drawer t
      org-time-clocksum-format '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))

;;; a few undisputed global keybindings every org'er will want

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(define-key org-mode-map (kbd "C-c f") 'org-footnote-action)


(use-package org-chef
  :ensure t)


(setq org-capture-templates
      '(("c" "Cookbook" entry (file "~/.emacs.d/cookbook.org")
         "%(org-chef-get-recipe-from-url)"
         :empty-lines 1)))

;; https://orgmode.org/worg/org-tutorials/org4beginners.html
(setq org-todo-keywords
  '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))



;; yas issue: https://orgmode.org/manual/Conflicts.html
;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (setq-local yas/trigger-key [tab])
;;             (define-key yas/keymap [tab] 'yas/next-field-or-maybe-expand)))

;; (defun yas/org-very-safe-expand ()
;;   (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))

;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (make-variable-buffer-local 'yas/trigger-key)
;;             (setq yas/trigger-key [tab])
;;             (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
;;             (define-key yas/keymap [tab] 'yas/next-field)))


;; Make windmove work in Org mode:
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)


;; Activate Languages for org mode evaluation
;; https://orgmode.org/manual/Languages.html
;; https://emacs.stackexchange.com/questions/17673/no-org-babel-execute-function-for-c-and-no-org-babel-execute-function-for-c
;; ob-sh was remamed to ob-shell in org 8.2
;; https://emacs.stackexchange.com/questions/37692/how-to-fix-symbols-function-definition-is-void-org-babel-get-header
                                                                              
(require 'ob-async)   
(setq org-confirm-babel-evaluate nil)     

(org-babel-do-load-languages
 'org-babel-load-languages '((C . t)
                             (sh . t)
                             (shell . t)
                             (python . t)
                             (emacs-lisp . t)
                             (ruby . t)
                             (clojure . t)
                             (sql . t)
                             (matlab . t)
                             (java . t)
                             (latex . t)
                             (awk . t)
                             (R . t)
                             (sqlite t)
                             (sed . t)
                             )
 )

(provide 'setup-org)
