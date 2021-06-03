;;; package --- Flycheck Configuration
;;; Commentary:
;;;
;;; Wahrscheinlich ist der flycheck mode bereits in anderen Modes
;;; global gesetzt worden:
;;; el/setup-web-mode.el
;;; 60:40:(add-hook 'after-init-hook #'global-flycheck-mode)
;;; 21:32:(add-hook 'prog-mode-hook #'flycheck-mode)
;;; File: el/setup-ensime.el
;;; 21:32:(add-hook 'prog-mode-hook #'flycheck-mode)
;;;
;;; (global-flycheck-mode) ;; enable flycheck globally
;;; https://stackoverflow.com/questions/37720869/emacs-how-do-i-set-flycheck-to-python-3

;;; Code:

(add-hook 'after-init-hook #'global-flycheck-mode)

;; das hier scheint für die package liste zu tun
;; (defcustom dse/package-menu/package-column-width 10
;;   "Column width of package name in list-packages menu."
;;   :type 'number :group 'package)
;; (defcustom dse/package-menu/archive-column-width 12
;;   "Column width of archive name in list-packages menu."
;;   :type 'number :group 'package)
;; (defun dse/package-menu/fix-column-widths ()
;;   (let ((tlf (append tabulated-list-format nil)))
;;     (setf (cadr (assoc "Package" tlf)) dse/package-menu/package-column-width)
;;     (setf (cadr (assoc "Archive" tlf)) dse/package-menu/archive-column-width)
;;     (setq tabulated-list-format (vconcat tlf))))

;; (add-hook 'package-menu-mode-hook #'dse/package-menu/fix-column-widths)

;;; https://github.com/flycheck/flycheck/issues/1101

 ;; (add-hook 'flycheck-error-list-mode-hook
 ;;            (lambda ()
 ;;              (setq tabulated-list-format '[("Line" 5 flycheck-error-list-entry-< :right-align t)
 ;;                                            ("Col" 3 nil :right-align t)
 ;;                                            ("Level" 8 flycheck-error-list-entry-level-<)
 ;;                                            ("ID" 20 t)
 ;;                                            (#("Message (Checker)" 0 9
 ;;                                               (face default)
 ;;                                               9 16
 ;;                                               (face flycheck-error-list-checker-name)
 ;;                                               16 17
 ;;                                               (face default))
 ;;                                             0 t)])))

;;; Modify Error List Display to be at the bottom rather than a full buffer on the side

;; DEFAULT
;; [("File" 6)
;;  ("Line" 5 flycheck-error-list-entry-< :right-align t)
;;  ("Col" 3 nil :right-align t)
;;  ("Level" 8 flycheck-error-list-entry-level-<)
;;  ("ID" 6 t)
;;  (#("Message (Checker)" 0 7
;;     (face flycheck-error-list-error-message)
;;     9 16
;;     (face flycheck-error-list-checker-name))
;;   0 t)]

;; Diese hier sind zu schmal:
;; File **
;; Line
;; Col
;; Level **
;; ID **
;; Message

;; Das hier waren meine Adaptionen, die halbwegs tun
(defconst flycheck-error-list-format
`[("File" 30)
 ("Line" 5 flycheck-error-list-entry-< :right-align t)
 ("Col" 3 nil :right-align t)
 ("Level" 30 flycheck-error-list-entry-level-<)
 ("ID" 30 t)
 (#("Message (Checker)" 0 7
    (face flycheck-error-list-error-message)
    9 16
    (face flycheck-error-list-checker-name))
  0 t)]
 "Table format for the error list.")

;;; see https://www.flycheck.org/en/latest/user/error-list.html
(add-to-list 'display-buffer-alist
             `(,(rx bos "*Flycheck errors*" eos)
              (display-buffer-reuse-window
               display-buffer-in-side-window)
              (side            . bottom)
              (reusable-frames . visible)
              (window-height   . 0.33)))


(provide 'setup-flycheck-mode)
;;; setup-flycheck-mode.el ends here
