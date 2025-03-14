`(setq use-package-compute-statistics t)

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(setq cg/is-termux
      (string-suffix-p "Android" (string-trim (shell-command-to-string "uname -a"))))

;; Fix an issue accessing the ELPA archive in Termux
(when cg/is-termux
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

;; The default is 800 kilobytes.  Measured in bytes.
;; (setq gc-cons-threshold (* 50 1000 1000))
;; (setq gc-cons-threshold (* 350 1000 1000))

;; Profile emacs startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "*** Emacs loaded in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

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
(setq doom-snippets-enable-short-helpers nil)
(add-to-list 'load-path (expand-file-name "el" user-emacs-directory))
;; (add-to-list 'load-path "~/.emacs.d/elpa/s-20210616.619/")
;; (require 's)

(use-package s :ensure t)
;; Functions (load all files in defuns-dir)
;;(add-to-list 'load-path user-emacs-directory)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "^[^.#].*el$"))
  (when (file-regular-p file)
    (load (file-name-sans-extension file))))

;;  (require 'title-time)
;; (require 'setup-daimler-proxy)
;; ;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Settings for currently logged in user
;; keep automatic customizations separately
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
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

(setq straight-base-dir (joindirs (getenv "HOME") ".config" "emacs" emacs-version))
(mkdir straight-base-dir t)

(defvar bootstrap-version)
  (let ((bootstrap-file
         (expand-file-name
          "straight/repos/straight.el/bootstrap.el"
          (or (bound-and-true-p straight-base-dir)
              user-emacs-directory)))
        (bootstrap-version 7))
    (unless (file-exists-p bootstrap-file)
      (with-current-buffer
          (url-retrieve-synchronously
           "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
           'silent 'inhibit-cookies)
        (goto-char (point-max))
        (eval-print-last-sexp)))
    (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(straight-use-package 'yasnippet)

;; org-20210929
  ;; org-contrib-0.6
  ;; org-ml-20230410.30
  ;; org-sql-20240819.2145
  ;; org-roam-20240715.1750
  ;; org-chef-20231127.1601
  ;; org-tree-slide-20230826.1234
  ;; org-special-block-extras-20230721.43
  ;; calfw-org-20170411.220
(use-package org :straight (:type built-in))
(use-package org-contrib :straight t)
(use-package org-ml :straight t)
(use-package org-sql :straight t)
(use-package org-roam :straight t)
(use-package org-tree-slide :straight t)
(use-package org-special-block-extras :straight t)
(use-package calfw-org :straight t)
(use-package yasnippet-classic-snippets :straight t)

;; (use-package org :straight t)

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

;; Set to t in order to move files to trash when deleting
(setq delete-by-moving-to-trash nil)

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
;; (require 'smooth-scrolling)
;; (setq scroll-step 1)
;; (setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)

;; org-mode: Don't ruin S-arrow to switch windows please (use M-+ and M-- instead to toggle)
(setq org-replace-disputed-keys t)

;; Fontify org-mode code blocks
(setq org-src-fontify-natively t)


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
                ag-mode-hook
                magit-mode-hook
                dired-mode-hook
                comint-mode-hook
                shell-mode-hook
                helm-mode-hook
                ibuffer-mode-hook
                eshell-mode-hook))

  (add-hook mode (lambda () (display-line-numbers-mode 0)))
  )

(set-frame-parameter (selected-frame) 'alpha '(99 . 99))
(add-to-list 'default-frame-alist '(alpha . (99 . 99)))
(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(if (display-graphic-p)
    (progn
      (tool-bar-mode t)
      (scroll-bar-mode -1)
      (set-fringe-mode 10)        ; Give some breathing room
      ))

(tool-bar-mode 1)          ; Disable the toolbar
;;  (tooltip-mode -1)           ; Disable tooltips

(menu-bar-mode t)            ; Disable the menu bar

;; Smart M-x is smart - der ido fuer M-x
(require 'smex)
(smex-initialize)

;; Setup key bindings
(require 'key-bindings)
(require 'setup-helm)

;; Diminish modeline clutter
(require 'diminish)

(use-package expand-region
  :bind ("C-=" . er/expand-region))

;; Represent undo-history as an actual tree (visualize with C-x u)
;; (setq undo-tree-mode-lighter "")
;;(setq undo-tree-mode-lighter "Undo-Tree") defaul

;;(setq evil-want-fine-undo t)
(require 'undo-tree)
(global-undo-tree-mode)

(setq undo-tree-auto-save-history nil)

;; do ot apply yet
(defun cg/evil-hook ()
  (dolist (mode '(custom-mode
                  eshell-mode
                  shell-mode
                  term-mode
                  ibuffer-mode
                  ag-mode
                  dired-mode
                  flycheck-mode
                  python-ts-mode
                  python-mode
                  ))
    (add-to-list 'evil-emacs-state-modes mode)
    ))

(use-package evil
  :init
  (setq evil-want-integration t)  ;; seems to be always good
  (setq evil-want-keybinding nil) ;; david wilson prefers not to use thes3
  (setq evil-want-C-u-scroll nil) ;; do not override C-u prefix
  (setq evil-want-C-i-jump nil)
  (setq evil-undo-system 'undo-tree) ;; alternative is undo-fu
  ;; :hook
  :config
  ;; evil: green: normal mode;
  (evil-mode 1)
  ;; drop back to normal mode using C-g
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  ;; in vim insert mode, C-h is now backspace. Normally in emacs it would enter help
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
  :hook (evil-mode . cg/evil-hook)
  )

;;  (evil-set-initial-state 'messages-buffer-mode 'normal)
;;  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package evil-nerd-commenter
  :ensure t
  :bind ("M-/" . evilnc-comment-or-uncomment-lines))

(require 'realgud)
(require 'setup-projectile)
;; (eval-after-load 'ido '(require 'setup-ido)) ;; interactive break M-x
;; Setup lsp mode prior to setup-java
;; setup for lsp and dap
(require 'setup-auto-complete)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode)
  )

(require 'setup-lsp)

;; (require 'setup-java)
;; deactivate  jdee for  loading java files
(setq auto-mode-alist
      (append '(("\\.java\\'" . java-mode)) auto-mode-alist))

;; run dap mode setup
(require 'setup-dap-mode)

(use-package use-package-ensure-system-package :ensure t)
(use-package blacken
  ;; :ensure t
  ;; :ensure-system-package (black . "pip3 install black")
  :custom
  (blacken-executable "brunette")
  ;; (blacken-line-length 119)
  )

;; not  lsp
;; (require 'setup-python-elpy-jedi)   ;; was the old setup-python.el
;; (require 'setup-python-lsp-emacs-from-scratch)
;; (require 'setup-python-pyright)
;; (require 'setup-python-lsp-pyright)
(require 'setup-python)

(require 'setup-typescript)
(require 'setup-angular)
;; currently broken:
;; (require 'setup-c-lsp-clangd)
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

(require 'setup-ess)

;; see http://ergoemacs.org/emacs/emacs_insert_brackets_by_pair.html
(electric-pair-mode 1)

(setq sqlformat-command 'sqlformat)
(setq sqlformat-args nil)

;; (setq sqlformat-command 'pgformatter)
;; (setq sqlformat-args '("-s2" "-g"))

(use-package org-roam
  :straight t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/RoamNotes")
  (org-roam-completion-everywhere t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         :map org-mode-map
         ("C-M-i" . completion-at-point)
         :map org-roam-dailies-map
         ("Y" . org-roam-dailies-capture-yesterday)
         ("T" . org-roam-dailies-capture-tomorrow))
  :bind-keymap
  ("C-c n d" . org-roam-dailies-map)
  :config
  (require 'org-roam-dailies) ;; Ensure the keymap is available
  (org-roam-db-autosync-mode))

(require 'setup-org) ;; organizer todo notes etc

(use-package org-tree-slide
  :custom
  (org-image-actual-width nil))

(if (require 'toc-org nil t)
    (progn
      (add-hook 'org-mode-hook 'toc-org-mode)

      ;; enable in markdown, too
      (add-hook 'markdown-mode-hook 'toc-org-mode)
      (define-key markdown-mode-map (kbd "\C-c\C-o") 'toc-org-markdown-follow-thing-at-point))
  (warn "toc-org not found"))

;; (require 'setup-speedbar)

(use-package flymake-shellcheck
:commands flymake-shellcheck-load
:init
(add-hook 'sh-mode-hook 'flymake-shellcheck-load))

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

;; (require 'setup-speedbar)

;; (eval-after-load 'sgml-mode '(require 'setup-html-mode))
(eval-after-load 'lisp-mode '(require 'setup-lisp))

(require 'setup-plantuml) ;; organizer todo notes etc

(require 'setup-latex)

(require 'setup-calendar)
;;(require 'setup-bash)
(require 'setup-octave)
;; (require 'mc)

;;(require 'setup-web-mode)
;; (require 'setup-jabber)
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

(put 'scroll-left 'disabled nil)


(setq abbrev-file-name             ;; tell emacs where to read abbrev
      "~/.emacs.d/abbrev_defs")    ;; definitions from...

;;(add-to-list 'load-path "/path/to/downloaded/openwith.el")
;;./elpa/openwith-20120531.1436/openwith.el:1

;; ("\\.pdf\\'"  "okular" (file))

(require 'openwith)
(setq openwith-associations '(
                              ("\\.pdf\\'"  "okular" (file))
                              ("\\.mp4\\'"  "vlc" (file))
                              ("\\.docx\\'" "lowriter" (file))
                              ("\\.odt\\'"  "lowriter" (file))
                              ("\\.pptx\\'"  "loimpress" (file))
                              ))
;; unset associations altogether
;; (setq openwith-associations '())

(openwith-mode)
(display-battery-mode)
(setq require-final-newline nil)

(require 'setup-nxml)
;; (require 'setup-pdf-tools)
(require 'setup-json-mode)
(require 'setup-magit)
;; (require 'setup-tags)

(require 'setup-flycheck-mode)
;; company mode autocompletion
;;(add-hook 'after-init-hook 'global-company-mode)

;;(require 'pasc-mode)

;; (require 'setup-supercollider)
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

(put 'erase-buffer 'disabled nil)

;; fix misalignment in popus:
(setq popup-use-optimized-column-computation nil)

(add-hook 'makefile-mode-hook 'makefile-executor-mode)

(require 'setup-yasnippet)
(define-key yas-minor-mode-map [(tab)] nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(message "nach yasnippet loading")

(add-to-list 'auth-sources (joindirs org-directory ".authinfo.gpg"))
  (add-to-list 'auth-sources (joindirs org-directory ".authinfo"))

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))
;; Setup environment variables from the user's shell.
(when is-mac (exec-path-from-shell-initialize))
;; (when is-mac (require 'mac))

(defun get-codeium-api-key ()
    "Retrieve the codeium API key from one of the authinfo files."
    (let ((auth (nth 0 (auth-source-search
                        :site "codeium.com"
                        :user "privat-email-account"
                        :max 1
                        :require '(:secret)))))
      (if auth
          (funcall (plist-get auth :secret))
        (error "No codeium API key found in authinfo file(s)"))))

(defvar codeium/metadata/api_key (get-codeium-api-key) "Your codeium key for accessing the ChatGPT API.")

(add-to-list 'load-path "~/.emacs.d/el/codeium/")
(load-file (joindirs straight-base-dir "straight" "build" "codeium" "codeium.el"))
;;  ~/.config/emacs/31.0.50/straight/build/codeium/codeium.el

(straight-use-package '(codeium :type git :host github :repo "Exafunction/codeium.el"))

;; we recommend using use-package to organize your init.el
(use-package codeium
    :straight t
    ;; if you use straight
    ;; :straight '(:type git :host github :repo "Exafunction/codeium.el")
    ;; otherwise, make sure that the codeium.el file is on load-path

    :init
    ;; use globally
    (add-to-list 'completion-at-point-functions #'codeium-completion-at-point)
    ;; or on a hook
    ;; (add-hook 'python-mode-hook
    ;;     (lambda ()
    ;;         (setq-local completion-at-point-functions '(codeium-completion-at-point))))

    ;; if you want multiple completion backends, use cape (https://github.com/minad/cape):
    ;; (add-hook 'python-mode-hook
    ;;     (lambda ()
    ;;         (setq-local completion-at-point-functions
    ;;             (list (cape-super-capf #'codeium-completion-at-point #'lsp-completion-at-point)))))
    ;; an async company-backend is coming soon!

    ;; codeium-completion-at-point is autoloaded, but you can
    ;; optionally set a timer, which might speed up things as the
    ;; codeium local language server takes ~0.2s to start up
    ;; (add-hook 'emacs-startup-hook
    ;;  (lambda () (run-with-timer 0.1 nil #'codeium-init)))

    ;; :defer t ;; lazy loading, if you want
    :config
    (setq use-dialog-box nil) ;; do not use popup boxes

    ;; if you don't want to use customize to save the api-key
    ;; (setq codeium/metadata/api_key "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")

    ;; get codeium status in the modeline
    (setq codeium-mode-line-enable
        (lambda (api) (not (memq api '(CancelRequest Heartbeat AcceptCompletion)))))
    (add-to-list 'mode-line-format '(:eval (car-safe codeium-mode-line)) t)
    ;; alternatively for a more extensive mode-line
    ;; (add-to-list 'mode-line-format '(-50 "" codeium-mode-line) t)

    ;; use M-x codeium-diagnose to see apis/fields that would be sent to the local language server
    (setq codeium-api-enabled
        (lambda (api)
            (memq api '(GetCompletions Heartbeat CancelRequest GetAuthToken RegisterUser auth-redirect AcceptCompletion))))
    ;; you can also set a config for a single buffer like this:
    ;; (add-hook 'python-mode-hook
    ;;     (lambda ()
    ;;         (setq-local codeium/editor_options/tab_size 4)))

    ;; You can overwrite all the codeium configs!
    ;; for example, we recommend limiting the string sent to codeium for better performance
    (defun my-codeium/document/text ()
        (buffer-substring-no-properties (max (- (point) 3000) (point-min)) (min (+ (point) 1000) (point-max))))
    ;; if you change the text, you should also change the cursor_offset
    ;; warning: this is measured by UTF-8 encoded bytes
    (defun my-codeium/document/cursor_offset ()
        (codeium-utf8-byte-length
            (buffer-substring-no-properties (max (- (point) 3000) (point-min)) (point))))
    (setq codeium/document/text 'my-codeium/document/text)
    (setq codeium/document/cursor_offset 'my-codeium/document/cursor_offset))

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

(setq ansible-vault-password-file "~/.ansible/vault_pass.txt")
(add-to-list 'auto-mode-alist '("/encrypted$" . yaml-mode))

(defun ansible-vault-mode-maybe ()
  (when (ansible-vault--is-encrypted-vault-file)
    (ansible-vault-mode 1)))

(use-package ansible-vault
  :init (add-hook 'yaml-mode-hook 'ansible-vault-mode-maybe))

(require 'setup-themes)

(require 'cl)
(require 'color)

(defun csv-highlight (&optional separator)
  (interactive (list (when current-prefix-arg (read-char "Separator: "))))
  (font-lock-mode 1)
  (let* ((separator (or separator ?\,))
         (n (count-matches (string separator) (point-at-bol) (point-at-eol)))
         (colors (cl-loop for i from 0 to 1.0 by (/ 2.0 n)
                       collect (apply #'color-rgb-to-hex
                                      (color-hsl-to-rgb i 0.3 0.5)))))
    (cl-loop for i from 2 to n by 2
          for c in colors
          for r = (format "^\\([^%c\n]+%c\\)\\{%d\\}" separator separator i)
          do (font-lock-add-keywords nil `((,r (1 '(face (:foreground ,c)))))))))

(add-hook 'csv-mode-hook 'csv-highlight)
(add-hook 'csv-mode-hook 'csv-align-mode)
(add-hook 'csv-mode-hook '(lambda () (interactive) (toggle-truncate-lines nil)))

(setq langtool-language-tool-server-jar (joindirs user-emacs-directory "jars" "LanguageTool-6.4" "languagetool-server.jar"))
(require 'langtool)

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

;; define function to shutdown emacs server instance
(defun server-shutdown ()
  "Save buffers, Quit, and Shutdown (kill) server"
  (interactive)
  (save-some-buffers)
  (kill-emacs)
  )

(require 'setup-dired)

(use-package simple-httpd
  :ensure t)

(add-hook 'write-file-hooks 'delete-trailing-whitespace nil t)
  (defun nuke_trailing ()
  (add-hook 'before-save-hook #'delete-trailing-whitespace nil t))
(add-hook 'prog-mode-hook #'nuke_trailing)

;;  value=155
(setq value 155)
