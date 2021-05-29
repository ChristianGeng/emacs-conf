;;; reformat nxml mode

;; https://www.emacswiki.org/emacs/NxmlModeSchemas
;; emacs variable rng-schema-locating-files
;; 
;; https://lgfang.github.io/mynotes/emacs/emacs-xml.html#sec-8-1

(defun local-nxml-hook ()
  (setq indent-tabs-mode t)
  (setq nxml-child-indent 4)
  (setq sgml-set-face t)
  ;; validiting with xmllint, so XML decl. not needed
  (setq sgml-declaration nil)
  ;; invoke xmllint for external validation
  (setq sgml-validation-command "xmllint --noout --postvalid %s %s")
  (setq popcmp-group-alternatives nil)
  (setq rng-validate-delay 3)
  (setq nxml-slash-auto-complete-flag t)
  (setq nxml-child-indent 2)
  (setq nxml-attribute-indent 2)
  (define-key nxml-mode-map "\C-c\C-i" 'yas/expand)
  (rng-nxml-mode-init)
  )

(add-hook 'nxml-mode-hook '(lambda () (local-nxml-hook)))

(push (cons (concat "\\." (regexp-opt '("svg" "x3d") t)
                      "\\'") 'nxml-mode) auto-mode-alist)



;; Showing the current xpath in the echo area.
;;
;; Based on code snippet
;; from http://www.emacswiki.org/emacs/NxmlMode
(defun nxml-current-xpath ()
  "Displays the XPATH of where you currently are in the  XML docment."
  (interactive)
  (let ((path nil))
    (save-excursion
      (save-restriction
        (widen)
        ;; Doesn't error if point is at beginning of buffer
        (while (and (< (point-min) (point))
                    (condition-case nil
                        (progn
                          (nxml-backward-up-element) ; always returns nil
                          t)
                      (error nil)))
          (setq path
                (cons
                 (if (xmltok-start-tag-prefix)
                     (concat (xmltok-start-tag-prefix) ":"
                             (xmltok-start-tag-local-name))
                   (xmltok-start-tag-local-name))
                 path)))
        (if (called-interactively-p t)
            (message (concat "/" (mapconcat 'identity path "/"))))))))

(provide 'setup-nxml)
