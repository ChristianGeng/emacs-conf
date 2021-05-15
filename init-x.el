
;;;;;;;; ;;;;;;;; ;;;;;;;; ;;;;;;;;
;;;;;;;;;;;;;; Load - Path  ;;;;;;;;
;;;;;;;; ;;;;;;;; ;;;;;;;; ;;;;;;;;
 (add-to-list 'load-path "~/.emacs.d/el/desktopaid-1.0.5/")
 (add-to-list 'load-path "~/.emacs.d/el")
;; (add-to-list 'load-path "~/.emacs.d/el/auctex")
;; (add-to-list 'load-path "~/el/")



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; AUCTEX  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "auctex.el" nil t t)

;; compile in pdf mode by default
(setq TeX-PDF-mode t)




(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)


;; testen eigener environments
;; \newenvironment{loop}[3]{}{}{}

;; (TeX-add-style-hook
;;  "myEnv"
;;  (lambda ()
;;    (LaTeX-add-environments
;;     '("myEnv" "frametitle" "framesubtitle"))))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; REFTEX  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'reftex)
(setq reftex-plug-into-AUCTeX t)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; DEFINE FUNCTION TO INSERT DATE ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key [(control ?c) ?D] 'insert-date)

(defun insert-date (prefix)
  "Insert the current date. With prefix-argument, use ISO format. With
   two prefix arguments, write out the day and month name."
  (interactive "P")
  (let ((format (cond
                 ((not prefix) "%A, %B %d, %Y")
                 ((equal prefix '(4)) "%m-%d-%Y")
                 ((equal prefix '(16)) "%m.%d.%Y"))))
    (insert (format-time-string format))))






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; PYTHON ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(setq auto-mode-alist
; 	      (cons '("\\.py$" . python-mode) auto-mode-alist))
; 	(setq auto-mode-alist
; 	      (cons '("\\.vpy$" . python-mode) auto-mode-alist))
; 	(setq auto-mode-alist
; 	      (cons '("\\.cpy$" . python-mode) auto-mode-alist))
; 	(setq interpreter-mode-alist
; 	      (cons '("python" . python-mode)
; 	            interpreter-mode-alist))
 ;;	(autoload 'python-mode "python-mode" "Python editing mode." t)

 	;; Add missing shortcut for uncomment-region
        ;; (add-hook 'python-mode-hook (lambda ()
 	;;    (define-key py-mode-map "\C-c3"
 	;;      (lambda (beg end) (interactive "r")
 	;;         (py-comment-region beg end '(4))))))
 	;; ;; remember that comment-dwim is M-;








;;;; GNU FSF emacs specific
;; NEU
;(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;(add-to-list 'load-path "/home/christian/.emacs.d/el/python-mode.el-6.0.10/")
;(setq py-install-directory "/home/christian/.emacs.d/el/python-mode.el-6.0.10/")
;(require 'python-mode)
;(autoload 'pymacs-apply "pymacs")
;(autoload 'pymacs-call "pymacs")
;(autoload 'pymacs-eval "pymacs" nil t)
;(autoload 'pymacs-exec "pymacs" nil t)
;(autoload 'pymacs-load "pymacs" nil t)
;(pymacs-load "ropemacs" "rope-")
;(setq ropemacs-enable-autoimport t)

;(add-to-list 'load-path "/usr/share/emacs/site-lisp/auto-complete/")
;(require 'auto-complete-config)
;(add-to-list 'ac-dictionary-directories "/usr/share/auto-complete/dict/")
;(require 'auto-complete-config)
;(ac-config-default)

;(add-to-list 'load-path "/usr/share/auto-complete")

;(require 'auto-complete)
;(global-auto-complete-mode t)
;;(setq py-shell-name "python")



;;(add-to-list 'interpreter-mode-alist '("python" . python-mode))
;;(add-to-list 'load-path "/home/christian/.emacs.d/el/python-mode.el-6.0.10/")
;;(setq py-install-directory "/home/christian/.emacs.d/el/python-mode.el-6.0.10/")
;(setq py-install-directory "/home/christian/.emacs.d/el/python-mode.el-6.0.10/")

;;(require 'python-mode)

;(add-to-list 'load-path "/usr/share/emacs/site-lisp/auto-complete/")
;(require 'auto-complete-config)
;(add-to-list 'ac-dictionary-directories "/usr/share/auto-complete/dict/")
;(require 'auto-complete-config)
;(ac-config-default)

;(add-to-list 'load-path "/usr/share/auto-complete")

;(require 'auto-complete)
;(global-auto-complete-mode t)





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; SPELL CHECKER ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq-default ispell-program-name "aspell")
;; For some reason version 3.0 of ispell.el (the lisp program that (x)emacs uses)
;; wants to reverse the suggestion list. To fix this add this line:
;; (setq-default ispell-extra-args '("--reverse"))
(setq ispell-dictionary "american")
;;(setq ispell-dictionary "german-old")
;;(setq ispell-dictionary "amero")
;;(setq-default ispell-program-name "F:/GNU Emacs 23.3/aspell/bin/aspell.exe")
(setq-default ispell-program-name "aspell")
(setq TeX-source-specials-mode t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;; 24h format ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 (setq display-time-day-and-date t
                display-time-24hr-format t)
             (display-time)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; ESS ;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; I am using rstudio and statet
;; (load "~/.xemacs/ess-init")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;; ------ Octave-mode ---------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;; a tip from Jason Mobarak, http://cs.unm.edu/~jmob/windows-octave.txt
    ;; I don't know the reason
    ;; (setenv "DISPLAY" "127.0.0.1:0.0")

    ;; autolad octave mode for *.m-files
       (autoload 'octave-mode "octave-mod" nil t)
       (setq auto-mode-alist
       (cons '("\\.m$" . octave-mode) auto-mode-alist))

    ;; to turn on the abbrevs, auto-fill and font-lock features automatically
       (add-hook 'octave-mode-hook
         (lambda ()
         (abbrev-mode 1)
         (auto-fill-mode 1)
         (if (eq window-system 'x)
          (font-lock-mode 1))))


;;(autoload 'cua "cua")
;;  (require 'cua)
;;   (CUA-mode t)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;; CUA - Windows-like copy and paste --------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (cua-mode 0)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; Clipboard behavior, see  http://www.gnu.org/software/emacs/manual/html_node/emacs/Clipboard.html#Clipboard
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)







;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; color-theme ;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(require 'color-theme)
(color-theme-initialize)

;;;Clarity and Beauty

;(require 'color-theme)
(setq my-color-themes (list 'color-theme-billw 'color-theme-jsc-dark
			    'color-theme-sitaramv-solaris 'color-theme-resolve
			    'color-theme-classic 'color-theme-jonadabian-slate
			    'color-theme-kingsajz 'color-theme-shaman
			    'color-theme-subtle-blue 'color-theme-snowish
			    'color-theme-sitaramv-nt 'color-theme-wheat))


;; (color-theme-dark-blue)
;; (color-theme-robin-hood)
;; (color-theme-snowish)
;; (color-theme-shaman)
;; (color-theme-billw)
;; (color-theme-resolve)
;; (color-theme-cyberpunk); geht nicht


(defun set-colour-theme (theme)
  "Helper function to set a bunch of faces and ignore potential errors from missing faces."
  (mapc (lambda (setting)
          (condition-case nil
              (face-spec-set (car setting) (cdr setting))
            (error t)))
        theme))

(defun light-on-dark-theme ()
  "Setup the colors for a light-on-dark theme."
  (interactive)
  (set-colour-theme
   '((default . ((((type x w32)) (:background "black" :foreground "grey")) (t (:background "unspecified-bg" :foreground "grey"))))
     (cursor . ((t (:background "plum"))))
     (mode-line . ((t (:foreground "grey5" :background "grey75" :box (:style released-button)))))
     (mode-line-inactive . ((t (:foreground "grey80" :background "grey30" :box (:color "grey50" :line-width 1)))))
     (minibuffer-prompt . ((t (:foreground "deepskyblue" :bold t))))
     (font-lock-keyword-face . ((t (:foreground "white" :bold t))))
     (font-lock-comment-face . ((t (:foreground "steelblue" :italic t))))
     (font-lock-string-face . ((t (:foreground "lightgreen"))))
     (font-lock-doc-face . ((t (:foreground "deepskyblue" :italic t))))
     (font-lock-function-name-face . ((t (:foreground "coral" :bold t))))
     (font-lock-type-face . ((t (:foreground "steelblue" :bold t))))
     (font-lock-variable-name-face . ((t (:foreground "orchid"))))
     (font-lock-reference-face . ((t (:foreground "coral"))))
     (font-lock-builtin-face . ((t (:foreground "coral"))))
     (font-lock-constant-face . ((t (:foreground "coral"))))
     (font-lock-warning-face . ((t (:foreground "darkorange" :bold t))))
     (error . ((t (:foreground "red"))))
     (paren-match . ((t (:background "midnightblue"))))
     (show-paren-match-face . ((t (:background "midnightblue"))))
     (zmacs-region . ((t (:foreground "grey5" :background "lightcoral"))))
     (region . ((t (:foreground "grey5" :background "lightcoral"))))
     (isearch . ((t (:foreground "white" :background "red"))))
     (isearch-secondary . ((t (:foreground "red3" :background "grey"))))
     (isearch-lazy-highlight-face . ((t (:foreground "red3" :background "grey"))))
     (trailing-whitespace . ((t (:background "grey15"))))
     (shadow . ((t (:foreground "grey40"))))
     (link . ((t (:foreground "deepskyblue"))))
     (visited-link . ((t (:foreground "orchid"))))
     (highlight . ((t (:foreground "white" :background "gray15" :underline t))))
     (flymake-errline . ((t (:background nil :underline "red"))))
     (flymake-warnline . ((t (:background nil :underline "orange"))))
     (diff-removed . ((t (:foreground "coral"))))
     (diff-added . ((t (:foreground "lightgreen"))))
     (diff-refine-removed . ((t (:inherit diff-removed :foreground "sienna" :background nil :strike-through t))))
     (diff-refine-added . ((t (:inherit diff-added :foreground "palegreen" :background nil :bold t))))
     (ediff-even-diff-A . ((t (:foreground nil :background "grey15"))))
     (ediff-odd-diff-A . ((t (:foreground nil :background "grey15"))))
     (ediff-even-diff-B . ((t (:foreground nil :background "grey15"))))
     (ediff-odd-diff-B . ((t (:foreground nil :background "grey15"))))
     (ediff-current-diff-A . ((t (:foreground "coral" :bold nil :italic nil))))
     (ediff-current-diff-B . ((t (:foreground "lightgreen" :bold nil :italic nil))))
     (ediff-fine-diff-A . ((t (:foreground "sienna" :background nil :strike-through t))))
     (ediff-fine-diff-B . ((t (:foreground "palegreen" :background nil :bold t))))
     (outline-1 . ((t (:foreground "coral" :bold t))))
     (outline-2 . ((t (:foreground "orchid" :bold t))))
     (outline-3 . ((t (:foreground "steelblue" :bold t))))
     (outline-4 . ((t (:foreground "steelblue" :italic t))))
     (rst-level-1 . ((t (:foreground "coral" :background nil :bold t))))
     (rst-level-2 . ((t (:foreground "orchid" :background nil :bold t))))
     (rst-level-3 . ((t (:foreground "steelblue" :background nil :bold t))))
     (rst-level-4 . ((t (:foreground "steelblue" :background nil :italic t))))
     (rst-adornment-face . ((t (:foreground "grey40"))))
     (org-code . ((t (:foreground "lightgreen"))))
     (org-verbatim . ((t (:foreground "lightgreen")))))))
(defun dark-on-light-theme ()
  "Setup the colors for a dark-on-light theme."
  (interactive)
  (set-colour-theme
   '((default . ((t (:background "grey100" :foreground "grey5"))))
     (cursor . ((t (:background "red"))))
     (mode-line . ((t (:foreground "grey5" :background "grey70" :box (:style released-button)))))
     (mode-line-inactive . ((t (:foreground "grey45" :background "grey85" :box (:color "grey75" :line-width 1)))))
     (minibuffer-prompt . ((t (:foreground "deepskyblue4" :bold t))))
     (font-lock-keyword-face . ((t (:foreground "grey5" :bold t))))
     (font-lock-comment-face . ((t (:foreground "blue" :italic t :underline nil))))
     (font-lock-string-face . ((t (:foreground "green4"))))
     (font-lock-doc-face . ((t (:foreground "deepskyblue4" :italic t))))
     (font-lock-function-name-face . ((t (:foreground "red" :bold t))))
     (font-lock-type-face . ((t (:foreground "steelblue" :bold t))))
     (font-lock-variable-name-face . ((t (:foreground "magenta"))))
     (font-lock-reference-face . ((t (:foreground "red3"))))
     (font-lock-builtin-face . ((t (:foreground "red3"))))
     (font-lock-constant-face . ((t (:foreground "red3"))))
     (font-lock-warning-face . ((t (:foreground "darkorange" :bold t))))
     (error . ((t (:foreground "red"))))
     (paren-match . ((t (:background "lightsteelblue"))))
     (show-paren-match-face . ((t (:background "lightsteelblue"))))
     (zmacs-region . ((t (:background "lightcoral"))))
     (region . ((t (:background "lightcoral"))))
     (isearch . ((t (:foreground "white" :background "red"))))
     (isearch-secondary . ((t (:foreground "red3" :background "grey"))))
     (isearch-lazy-highlight-face . ((t (:foreground "red3" :background "grey"))))
     (trailing-whitespace . ((t (:background "mistyrose"))))
     (shadow . ((t (:foreground "grey60"))))
     (link . ((t (:foreground "deepskyblue4"))))
     (visited-link . ((t (:foreground "magenta"))))
     (highlight . ((t (:foreground "black" :background "mistyrose" :underline t))))
     (flymake-errline . ((t (:background nil :underline "red"))))
     (flymake-warnline . ((t (:background nil :underline "orange"))))
     (diff-removed . ((t (:foreground "red3"))))
     (diff-added . ((t (:foreground "green4"))))
     (diff-refine-removed . ((t (:inherit diff-removed :foreground "lightcoral" :background nil :strike-through t))))
     (diff-refine-added . ((t (:inherit diff-added :foreground "darkgreen" :background nil :bold t))))
     (ediff-even-diff-A . ((t (:foreground nil :background "grey85"))))
     (ediff-odd-diff-A . ((t (:foreground nil :background "grey85"))))
     (ediff-even-diff-B . ((t (:foreground nil :background "grey85"))))
     (ediff-odd-diff-B . ((t (:foreground nil :background "grey85"))))
     (ediff-current-diff-A . ((t (:foreground "red3" :bold nil :italic nil))))
     (ediff-current-diff-B . ((t (:foreground "green4" :bold nil :italic nil))))
     (ediff-fine-diff-A . ((t (:foreground "lightcoral" :background nil :strike-through t))))
     (ediff-fine-diff-B . ((t (:foreground "darkgreen" :background nil :bold t))))
     (outline-1 . ((t (:foreground "red" :bold t))))
     (outline-2 . ((t (:foreground "magenta" :bold t))))
     (outline-3 . ((t (:foreground "steelblue" :bold t))))
     (outline-4 . ((t (:foreground "steelblue" :italic t))))
     (rst-level-1 . ((t (:foreground "red" :background nil :bold t))))
     (rst-level-2 . ((t (:foreground "magenta" :background nil :bold t))))
     (rst-level-3 . ((t (:foreground "steelblue" :background nil :bold t))))
     (rst-level-4 . ((t (:foreground "steelblue" :background nil :italic t))))
     (rst-adornment-face . ((t (:foreground "grey60"))))
     (org-code . ((t (:foreground "green4"))))
     (org-verbatim . ((t (:foreground "green4")))))))
(light-on-dark-theme)




;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto byte compile - now byte compiles after saving
;;;;;;;;;;;;;;;;;;;;;;;;

(defun byte-compile-current-buffer ()
  "`byte-compile' current buffer if it's emacs-lisp-mode and compiled file exists."
  (interactive)
  (when (and (eq major-mode 'emacs-lisp-mode)
             (file-exists-p (byte-compile-dest-file buffer-file-name)))
    (byte-compile-file buffer-file-name)))

(add-hook 'after-save-hook 'byte-compile-current-buffer)




;; (setq GNU (not (string-match "XEmacs\\|Lucid" (emacs-version))))
;; (if GNU
;; (
;; ;; GNU EMACS

;; ) ;; GNU END
;; (

;; );; xemacs end
;; )



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;; DESKTOPAID ;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;   (autoload 'dta-hook-up "desktopaid.elc" "Desktop Aid" t)
  (autoload 'dta-hook-up "desktopaid.el" "Desktop Aid" t)
  (dta-hook-up)


 (defun call-if-fbound (function &rest args)
      "Call FUNCTION with optional ARGS, only if it is fbound.
    Return t if it is fbound and called without error, and nil otherwise."
      (when (fboundp function)
        (apply function args)
        t))


(or
 (call-if-fbound 'iswitchb-mode 1)
 (call-if-fbound 'iswitchb-default-keybindings)
) ; the old way


;;  desktop.el
(desktop-load-default)
;;(desktop-save-mode)
;; Automatically save and restore sessions
(setq desktop-dirname             "~/.emacs.d/desktop/"
      desktop-base-file-name      "emacs.desktop"
      desktop-base-lock-name      "lock"
      desktop-path                (list desktop-dirname)
      desktop-save                t
      desktop-files-not-to-save   "^$" ;reload tramp paths
      desktop-load-locked-desktop nil)
;;(desktop-save-mode 1)

(add-hook 'kill-emacs-hook
  '(lambda ()
     (desktop-truncate search-ring 3)
     (desktop-truncate regexp-search-ring 3)))

(desktop-read)




;; do not make backup files at all
;; (setq make-backup-files nil)

(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)

(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Use Okular as the pdf viewer. Build okular
;; command, so that Okular jumps to the current line
;; in the viewer.
 (setq TeX-view-program-selection
  '((output-pdf "PDF Viewer")))
 (setq TeX-view-program-list
  '(("PDF Viewer" "okular --unique %o#src:%n%b")))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


 ;; '(TeX-view-program-selection (cond ((eq system-type (quote windows-nt)) (quote (((output-dvi style-pstricks) "dvips and start") (output-dvi "Yap") (output-pdf "start") (output-html "start")))) (t (\` (((output-dvi style-pstricks) "dvips and gv") (output-dvi "xdvi") (output-pdf (\, (if (executable-find "evince") "Evince" "xpdf"))) (output-html "xdg-open"))))))

;;; Text zwischen Braces setzen:
(defun cg-insert-braces ()
  (interactive)
  (if (region-active-p)
      (insert-pair 1 ?{ ?})
    (insert "{}")
    (backward-char)))

     ;;; Keybinding for  cg-insert-braces
     ; I use occur a lot, so let's bind it to a key:
     ;;(global-set-key (kbd "f9") 'cg-insert-braces)


 ;;; Unten im Befehlsfenster (Minibuffer) schreiben
(defun cg-hello-world ()
  "Hallo Welt schreiben"
  (interactive)
  (message "Hello, World")
)

(defun cg-hello-world-print ()
  (interactive)
  ;;; Einen einfügen an der momentanen Stelle
  (insert "Hello, World")

  )

;;(defun cg-insert-file-name ()
;;    "Insert contents of the file quest into the buffer after point."
;;    (interactive)
;;    (insert-file "/D/myfiles/2013/Phonetik1-WS13-14/quest")
;;)

(defun cg-wrap-markup-region (start end)
  "Insert a markup <b></b> around a region."
  (interactive "r")
  (save-excursion
    (goto-char end) (insert "</b>")
    (goto-char start) (insert "<b>")
    ))



;; mit C-Tab die Fenster wechseln
;; nur emacs:
(global-set-key [C-tab] 'next-multiframe-window)


;;(define-key LaTeX-mode-map (kbd "C-S-i") 'TeX-font)
;;(define-key LaTeX-mode-map (kbd "C-F-P") 'TeX-font)


;;  (goto-char (forward-point -2)))
;; (- (point) 2)


 (defun cg-insert-ipa()
  "places textit{} into LaTeX buffer."
  (interactive)
  (if (region-active-p)
      (progn
        (save-excursion
          (goto-char (region-beginning))
          (insert "\\ipa{" ))
        (save-excursion
          (goto-char (region-end))
          (insert "}")))
    (insert "\\ipa{}")
    (goto-char  (forward-point -2)))
  (goto-char (forward-point 1)))

    ;; (add-hook 'LaTeX-mode-hook
    ;;   (lambda ()
    ;;     (define-key LaTeX-mode-map (kbd  "C-c C-i") 'cg-insert-ipa)
    ;;   )
    ;; )


;; (eval-after-load "latex"
;; '(add-to-list 'LaTeX-font-list '(?\C-p "\\textipa{" "}")))
;; '(add-to-list 'LaTeX-font-list '(?\C-p "\\textipa{" "}"))

;; (global-set-key (kbd "M-{") 'insert-pair)
;; (global-set-key (kbd "M-[") 'insert-pair)
;; (global-set-key (kbd "M-{") 'insert-pair)
;; (global-set-key (kbd "M-\"") 'insert-pair)

;; (require 'iso-transl)


;;(set-frame-parameter (selected-frame) 'alpha '(100 100))
;;(add-to-list 'default-frame-alist '(alpha 100 100))
