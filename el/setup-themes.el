;;; setup-themes.el --- summary -*- lexical-binding: t -*-

;; Author: CGeng
;; Maintainer: CGeng
;; Version: version
;; Package-Requires: (dependencies)
;; Homepage: homepage
;; Keywords: keywords


;;; Commentary:

;; commentary

;;; Code:

;;; name.el ends here
;; (load-theme 'fantom)
;; jetbrains-darcula
; doom-1337

;;(load-theme 'moe-light) - unfortunatel colors, got it from the supercollider guy
;; (load-theme 'doom-1337)

;;
;; Configure the Modus Themes' appearance
(setq modus-themes-mode-line '(accented borderless)
      modus-themes-bold-constructs t
      modus-themes-italic-constructs t
      modus-themes-fringes 'subtle
      modus-themes-tabs-accented t
      modus-themes-paren-match '(bold intense)
      modus-themes-prompts '(bold intense)
      ;; modus-themes-completions 'opinionated
      modus-themes-org-blocks 'tinted-background
      modus-themes-scale-headings t
      modus-themes-region '(bg-only)
      modus-themes-headings
      '((1 . (rainbow overline background 1.4))
        (2 . (rainbow background 1.3))
        (3 . (rainbow bold 1.2))
        (t . (semilight 1.1))))

;; Load the dark theme by default
(load-theme 'modus-vivendi t)


;; (load-theme 'wombat)
(defcustom cycle-themes '(material material-light doom-solarized-dark doom-solarized-light atom-dark intellij idea-darkula subatomic moe-light)
  "List of themes through which one can switch easily by calling
`cycle-themes' repeatedly. The first element is loaded at startup."
  :type '(repeat symbol))

(defvar cycle-current-theme nil
  "Used internally to hold a pointer to the currently loaded theme.")

(defun reload-current-theme ()
  "Reload the theme in `cycle-current-theme', if it is active."
  (interactive)
  (when (custom-theme-enabled-p cycle-current-theme)
    (load-theme cycle-current-theme t)))


;; andere gute thems:
;; deeper-blue
;; misterioso
;; tango-dark tango

(defun cycle-themes ()
  "Cycle through themes from the variable cycle-themes."
  (interactive)
  (let ((next-theme (car (or (cdr (memq cycle-current-theme cycle-themes))
                             cycle-themes))))
    (when next-theme
     (when (custom-theme-enabled-p cycle-current-theme)
       (disable-theme cycle-current-theme))
     (when (load-theme next-theme t)
       (setq cycle-current-theme next-theme)))))

;; (dolist (feature '(magit org-faces whitespace flyspell))
;;   (unless (featurep feature)
;;     (eval-after-load feature '(reload-current-theme))))


;; cycle theme once at startup.
;; (when (fboundp 'cycle-themes)
;;  (cycle-themes))

(provide 'setup-themes)
