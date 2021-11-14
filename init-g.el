(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-language-environment 'utf-8)
(set-selection-coding-system 'utf-8)

;; Setup packages
    ;; code obsolete in emacs27
    (if (version< emacs-version "27.1")
        (package-initialize)
      )

    (add-to-list 'load-path (expand-file-name "doom-snippets" user-emacs-directory))
    (add-to-list 'load-path "~/.emacs.d/el")
    (add-to-list 'load-path "~/.emacs.d/el-get/dired+")
    ;;(add-to-list 'load-path "~/.emacs.d/elpa/s-20210603.736/")



    (setq user-emacs-directory "~/.emacs.d/")
    (message user-emacs-directory)

    ;; Functions (load all files in defuns-dir)
    ;;(add-to-list 'load-path user-emacs-directory)
    (setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
    (dolist (file (directory-files defuns-dir t "^[^.#].*el$"))
      (when (file-regular-p file)
        (load (file-name-sans-extension file))))
    ;; (load-library "cglispfuncs")

    ;;  (require 'title-time)
    ;; (require 'setup-daimler-proxy)
    ;; ;; No splash screen please ... jeez
    (setq inhibit-startup-message t)

    ;; Settings for currently logged in user
    ;; keep automatic customizations separately
    (setq custom-file "~/.emacs.d/custom.el")
    (load custom-file 'noerror)

  ;; create user customization directory for specific username/hostname combination
  (defvar user-settings-dir)
  (setq user-settings-dir
        (joindirs user-emacs-directory "users" (concat user-login-name "-" (system-name) )))

  (mkdir user-settings-dir t)
  (add-to-list 'load-path user-settings-dir)

  ;; load all settings from user machine combination
  (when (file-exists-p user-settings-dir)
      (mapc 'load (directory-files user-settings-dir nil "^[^.#].*el$")))

  ;; Write backup files to own directory
  (setq backup-directory-alist
        `(("." . ,(expand-file-name "backups" user-emacs-directory))))

  ;; Make backups of files, even when they're in version control
  (setq vc-make-backup-files t)

  ;; Save point position between sessions
  (require 'saveplace)
  (setq-default save-place t)
  (setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Setup elnode before packages to stop it from starting a server
;;(require 'setup-elnode)
;; Setup packages
(require 'setup-package)
;; Set path to dependencies
(setq site-lisp-dir
       (expand-file-name "site-lisp" user-emacs-directory))

;; Set up load path and
(add-to-list 'load-path site-lisp-dir)

;; Add external projects to load path
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Allow pasting selection outside of Emacs
  (setq x-select-enable-clipboard t)
  (setq x-select-enable-primary t)

  ;; Auto refresh buffers
  (global-auto-revert-mode 1)

  ;; Also auto refresh dired, but be quiet about it
  (setq global-auto-revert-non-file-buffers t)
  (setq auto-revert-verbose nil)

  ;; Show keystrokes in progress
  (setq echo-keystrokes 0.1)

  ;; Move files to trash when deleting
  (setq delete-by-moving-to-trash t)

  ;; Real emacs knights don't use shift to mark things
  (setq shift-select-mode nil)

  ;; Transparently open compressed files
  (auto-compression-mode t)

  ;; Enable syntax highlighting for older Emacsen that have it off
  (global-font-lock-mode t)

  ;; Answering just 'y' or 'n' will do
  (defalias 'yes-or-no-p 'y-or-n-p)

  ;; UTF-8 please
  (setq locale-coding-system 'utf-8) ; pretty
  (set-terminal-coding-system 'utf-8) ; pretty
  (set-keyboard-coding-system 'utf-8) ; pretty
  (set-selection-coding-system 'utf-8) ; please
  (prefer-coding-system 'utf-8) ; with sugar on top

  ;; Frame titles which are short and informative
  (setq frame-title-format '("%b - Emacs"))

  ;; Show active region
  (transient-mark-mode 1)
  (make-variable-buffer-local 'transient-mark-mode)
  (put 'transient-mark-mode 'permanent-local t)
  (setq-default transient-mark-mode t)

  ;; Remove text in active region if inserting text
  (delete-selection-mode 1)

  ;; ;; Don't highlight matches with jump-char - it's distracting
  ;; (setq jump-char-lazy-highlight-face nil)

  ;; Always display line and column numbers
  (setq line-number-mode t)
  (setq column-number-mode t)

  ;; Lines should be 80 characters wide, not 72
  (setq fill-column 80)

  ;; Save a list of recent files visited. (open recent file with C-x f)
  (recentf-mode 1)
  (setq recentf-max-saved-items 100) ;; just 20 is too recent

  ;; Highlight matching parentheses when the point is on them.
  (show-paren-mode 1)

  ;; Undo/redo window configuration with C-c <left>/<right>
  (winner-mode 1)

  ;; Never insert tabs
  (setq-default indent-tabs-mode nil)

  ;; Show me empty lines after buffer end
  (setq-default indicate-empty-lines t)

  ;; Easily navigate sillycased words
  (global-subword-mode 1)

  ;; ;; Don't break lines for me, please
  ;; (setq-default truncate-lines t)

  ;; Keep cursor away from edges when scrolling up/down
  (require 'smooth-scrolling)
  ;; (setq scroll-step 1)
  ;; (setq scroll-conservatively 10000)
  (setq auto-window-vscroll nil)

  ;; org-mode: Don't ruin S-arrow to switch windows please (use M-+ and M-- instead to toggle)
  (setq org-replace-disputed-keys t)

  ;; Fontify org-mode code blocks
  (setq org-src-fontify-natively t)

  ;; Represent undo-history as an actual tree (visualize with C-x u)
  (setq undo-tree-mode-lighter "")
  (require 'undo-tree)
  (global-undo-tree-mode)

  ;; ;; Sentences do not need double spaces to end. Period.
  ;; (set-default 'sentence-end-double-space nil)

  ;; Add parts of each file's directory to the buffer name if not unique
  (require 'uniquify)
  (setq uniquify-buffer-name-style 'forward)

  ;; A saner ediff
  (setq ediff-diff-options "-w")
  (setq ediff-split-window-function 'split-window-horizontally)
  (setq ediff-window-setup-function 'ediff-setup-windows-plain)

  ;; Nic says eval-expression-print-level needs to be set to nil (turned off) so
  ;; that you can always see what's happening.
  (setq eval-expression-print-level nil)

  ;; When popping the mark, continue popping until the cursor actually moves
  ;; Also, if the last command was a copy - skip past all the expand-region cruft.
  (defadvice pop-to-mark-command (around ensure-new-position activate)
    (let ((p (point)))
      (when (eq last-command 'save-region-or-current-line)
        ad-do-it
        ad-do-it
        ad-do-it)
      (dotimes (i 10)
        (when (= p (point)) ad-do-it))))

  ;; don't try to raise windows when switching to a buffer, because this
  ;; fails in any sane tiling window manager
  (setq ido-default-file-method 'selected-window
        ido-default-buffer-method 'selected-window)

  ;; highlight the current line in all buffers
  (global-hl-line-mode 1)

(setq  realgud-safe-mode nil)

(global-display-line-numbers-mode t)

;; Override some modes which derive from the above
(dolist (mode '(term-mode-hook
                shell-mode-hook
                ibuffer-mode
                eshell-mode-hook))
(add-hook mode (lambda () (display-line-numbers-mode 0))))

(scroll-bar-mode -1)        ; Disable visible scrollbar
  (tool-bar-mode -1)          ; Disable the toolbar
;;  (tooltip-mode -1)           ; Disable tooltips
  (set-fringe-mode 10)       ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar

(require 'realgud)

(require 'setup-dired)
(require 'setup-wttrin)
(require 'setup-projectile)

;; Setup extensions
 (require 'setup-themes)
;; (eval-after-load 'ido '(require 'setup-ido)) ;; interactive break M-x
;; (eval-after-load 'dired '(require 'setup-python))

;; Setup lsp mode prior to setup-java
;; setup for lsp and dap
(require 'setup-auto-complete)

(require 'setup-lsp)
;; (require 'setup-java)
;; deactivate  jdee for  loading java files
  (setq auto-mode-alist
        (append '(("\\.java\\'" . java-mode)) auto-mode-alist))
(require 'setup-dap-mode)

(use-package use-package-ensure-system-package :ensure t)
(use-package blacken
    :ensure t
    :ensure-system-package (black . "pip3 install black")
    ;; :custom
    ;; (blacken-line-length 119)
    )

;; not  lsp
;; (require 'setup-python-elpy-jedi)   ;; was the old setup-python.el
;; (require 'setup-python-lsp-emacs-from-scratch)
;; (require 'setup-python-pyright)
;; (require 'setup-python-lsp-pyright)
;; now: Alays write into setup-python and require so
(require 'setup-python)

(require 'setup-ess)
(require 'setup-typescript)
(require 'setup-angular)
(require 'setup-c-lsp-clangd)
;; (require 'setup-c++)
;; (require 'setup-python-lsp-remember-you)

(eval-after-load 'whitespace '(require 'setup-whitespace))
(eval-after-load 'tramp '(require 'setup-tramp))
;; (require 'setup-perspective)
;; (require 'setup-ffip)
;; (require 'setup-paredit)

(require 'mmm-auto)
(mmm-add-mode-ext-class 'html-mode "\\.php\\'" 'html-php)

(require 'setup-js2-mode)
(require 'setup-web-mode)
(require 'mmm-auto)
(require 'setup-web-mode)
(require 'setup-vue-mode)

;; (require 'setup-speedbar)

;; (eval-after-load 'sgml-mode '(require 'setup-html-mode))
(eval-after-load 'lisp-mode '(require 'setup-lisp))

(require 'setup-org) ;; organizer todo notes etc

(require 'setup-plantuml) ;; organizer todo notes etc

(require 'setup-latex)

(require 'setup-calendar)
;;(require 'setup-bash)
(require 'setup-octave)
;; (require 'mc)

;;(require 'setup-web-mode)
(require 'setup-jabber)
(require 'setup-chat-tracking)
;; (eval-after-load 'ruby-mode '(require 'setup-ruby-mode))
 (eval-after-load 'clojure-mode '(require 'setup-clojure-mode))
;; (eval-after-load 'markdown-mode '(require 'setup-markdown-mode))
;;(require 'setup-pandoc)

;; Load slime-js when asked for
;; (autoload 'slime-js-jack-in-browser "setup-slime-js" nil t)
;; (autoload 'slime-js-jack-in-node "setup-slime-js" nil t)

;; Map files to modes
(require 'mode-mappings)


;; (require 'expand-region)
;; (require 'mark-more-like-this)
;; (require 'inline-string-rectangle)
;;(require 'multiple-cursors)
;; (require 'delsel)
;; (require 'jump-char)
;; (require 'eproject)
;; (require 'wgrep)
;; (require 'smart-forward)
;; (require 'change-inner)
;; (require 'multifiles)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ansi Farben in compilation buffers:                                                                  ;;
;; Also hook:                                                                                           ;;
;; https://stackoverflow.com/questions/13397737/ansi-coloring-in-compilation-mode                       ;;
;; Als Function:                                                                                        ;;
;; https://stackoverflow.com/questions/23378271/how-do-i-display-ansi-color-codes-in-emacs-for-any-mode ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun display-ansi-colors ()
  (interactive)
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region (point-min) (point-max))))

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region compilation-filter-start (point))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
;; gehen alle nicht;
; (add-hook 'sbt-mode-hook 'display-ansi-colors)
;; (add-hook 'sbt-mode-hook 'ansi-color-for-comint-mode-on)
;; (add-to-list 'comint-output-filter-functions 'ansi-color-process-output)
;; (add-hook 'async-bytecomp-package-mode-hook 'colorize-compilation-buffer)

;; Fill column indicator
;; (require 'fill-column-indicator)

;; Browse kill ring
(require 'browse-kill-ring)
(setq browse-kill-ring-quit-action 'save-and-restore)

;; Smart M-x is smart - der ido fuer M-x
(require 'smex)
(smex-initialize)

;; Setup key bindings
(require 'key-bindings)
(require 'setup-helm)
(require 'setup-ibuffer)
(require 'setup-doom-modeline)

;; (require 'setup-eclim)
;; This currently breaks dired icons. Why?
;; (require 'setup-scala)
(require 'setup-treemacs)
(require 'setup-groovy)
;; (require 'setup-eclim)


;; Misc
;; (require 'appearance)
;; (require 'my-misc)

;; Diminish modeline clutter
(require 'diminish)
;; (diminish 'eldoc-mode)
;; (diminish 'paredit-mode)

;; Elisp go-to-definition with M-. and back again with M-,
;; (autoload 'elisp-slime-nav-mode "elisp-slime-nav")
;; (add-hook 'emacs-lisp-mode-hook (lambda () (elisp-slime-nav-mode t) (eldoc-mode 1)))
;; (eval-after-load 'elisp-slime-nav '(diminish 'elisp-slime-nav-mode))

;; Email, baby
;; (require 'setup-mule)

;; Run at full power please
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; electric-pair-mode
;; geht nur in emacs 24 turn on automatic bracket insertion by pairs. New in emacs 24
;; see http://ergoemacs.org/emacs/emacs_insert_brackets_by_pair.html
(electric-pair-mode 1)

(when (fboundp 'cycle-themes)
  (cycle-themes))

(put 'scroll-left 'disabled nil)


  (setq abbrev-file-name             ;; tell emacs where to read abbrev
        "~/.emacs.d/abbrev_defs")    ;; definitions from...

;;(add-to-list 'load-path "/path/to/downloaded/openwith.el")
;;./elpa/openwith-20120531.1436/openwith.el:1

;; ("\\.pdf\\'"  "okular" (file))

(require 'openwith)
(setq openwith-associations '(
                              ("\\.mp4\\'"  "vlc" (file))
                              ("\\.docx\\'" "lowriter" (file))
                              ("\\.odt\\'"  "lowriter" (file))
                              ("\\.pptx\\'"  "loimpress" (file))
                              ))
;; unset associations altogether
;; (setq openwith-associations '())

(openwith-mode)
(display-battery-mode)
(setq require-final-newline t)

(require 'setup-nxml)
;; (require 'setup-pdf-tools)
(require 'setup-json-mode)
(require 'setup-magit)
;; (require 'setup-tags)

(require 'setup-flycheck-mode)
;; company mode autocompletion
;;(add-hook 'after-init-hook 'global-company-mode)

;;(require 'pasc-mode)

(require 'setup-yasnippet)

(require 'setup-supercollider)
(require 'setup-yaml-mode)
(require 'setup-editorconfig)
(require 'setup-rtags)
(require 'setup-treemacs)

(require 'setup-shell-scripting)

(require 'calfw)
(require 'calfw-gcal)
(require 'calfw-org)
(require 'calfw-gcal)
(require 'calfw-ical)
(require 'setup-user-menu)

(put 'erase-buffer 'disabled nil)

;; fix misalignment in popus:
(setq popup-use-optimized-column-computation nil)

(add-hook 'makefile-mode-hook 'makefile-executor-mode)

(setq shell-file-name "bash")
(setq shell-command-switch "-c")

;; - '(safe-local-variable-values '((testvar\  . "hello")))
;; + '(safe-local-variable-values
;; +   '((pyvenv-activate . "~/.venvs/py37/")
;; +     (testvar\  . "hello")))
;;   '(sql-connection-alist
;;     '(("dataupload local container mysql"

;; (put 'pyvenv-activate 'safe-local-variable (lambda (_) t))

;; projectile-project-test-cmd :

(put 'pyvenv-activate 'safe-local-variable (lambda (_) t))
(put 'projectile-project-test-cmd 'safe-local-variable (lambda (_) t))
(put 'py-pythonpath  'safe-local-variable (lambda (_) t))

(setq x-alt-keysym 'meta)
(put 'set-goal-column 'disabled nil)

(defun edit-current-file-as-root ()
  "Edit the file that is associated with the current buffer as root"
  (interactive)
  (if (buffer-file-name)
      (progn
        (setq file (concat "/sudo:localhost:" (buffer-file-name)))
        (find-file file))
    (message "Current buffer does not have an associated file.")))

;; add Imenu whenever possible.
;; see https://www.emacswiki.org/emacs/ImenuMode for documentation
(defun try-to-add-imenu ()
  (condition-case nil (imenu-add-to-menubar "Index") (error nil)))
 (add-hook 'font-lock-mode-hook 'try-to-add-imenu)

(setq visible-bell t)
;; ring-bell function not doing what its supposed to?
;; see https://www.emacswiki.org/emacs/AlarmBell
;; (defun ring-bell-function()
;;   "do not ring the bell when cursor has gone too far outside."
;;   (message "Went outside but not ringing the bell.")
;;     )

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))
;; Setup environment variables from the user's shell.
(when is-mac (exec-path-from-shell-initialize))
;; (when is-mac (require 'mac))

(require 'calibredb)
(setq calibredb-root-dir "/D/Calibre_Science/")
(setq calibredb-db-dir (expand-file-name "metadata.db" calibredb-root-dir))

    ;;(setq calibredb-root-dir "~/OneDrive/Doc/Calibre")
    ;;(setq calibredb-db-dir (expand-file-name "metadata.db" calibredb-root-dir))

(require 'adoc-mode)
 (add-to-list 'auto-mode-alist '("\.adoc$" . adoc-mode))
;;  (add-to-list adoc-mode '("\\.adoc\\'" . adoc-mode))
  (autoload 'adoc-mode "adoc-mode" nil t)

(defun rcd-command-output-from-input (program input &rest args)
  "Returns output from PROGRAM INPUT with optional ARGS"
  (let* ((output (with-temp-buffer
                   (insert input)
                   (apply #'call-process-region nil nil program t t nil args)
                   (buffer-string))))
    output))

(defun rcd-asciidoctor (string &rest args)
  (interactive)
  "Returns plain text from Markdown by using pandoc"
  (apply 'rcd-command-output-from-input "asciidoctor" string "-" args))

(defun rcd-asciidoctor-preview ()
  "Preview asciidoctor"
  (interactive)
  (let* ((output (rcd-asciidoctor (buffer-string)))
         (file (concat (or (getenv "TMPDIR") "/tmp/") "asciidoctor.html")))
    (with-temp-file file (insert output))
    (browse-url file)))

;; (global-set-key (kbd "C-c a") 'rcd-asciidoctor-preview)

(add-to-list 'load-path "~/.emacs.d/el/org-asciidoc")
(require 'ox-asciidoc)

(add-to-list 'auto-mode-alist '(".local_configs" . shell-script-mode))

(require 'server)
(unless (server-running-p)
  (server-start))

;;  value=155
(setq value 155)
