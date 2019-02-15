;;;;;;;; ;;;;;;;; ;;;;;;;; ;;;;;;;;
;;;;;;;;;;;;;; Load - Path  ;;;;;;;;
;;;;;;;; ;;;;;;;; ;;;;;;;; ;;;;;;;;
;; (add-to-list 'load-path "~/.emacs.d/el/desktopaid-1.0.5/")

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; (prefer-coding-system 'utf-8)
;; (setq coding-system-for-read 'utf-8)
;; (setq coding-system-for-write 'utf-8)


(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-language-environment 'utf-8)
(set-selection-coding-system 'utf-8)



(package-initialize)
;; Setup packages

;; Switch between windows with Shift+{left,up,down,right}

(add-to-list 'load-path "~/.emacs.d/el")
(message "before yasnippet settup el!")

(use-package yasnippet
  :if (not noninteractive)
  :diminish yas-minor-mode
  :commands (yas-global-mode yas-minor-mode)
  :config
  (progn
    (setq yas-indent-line nil)
    (setq yas-snippet-dirs
      '("~/.emacs.d/snippets"
        ))
  )
)



;; (setq yas-snippet-dirs
;;       '("~/.emacs.d/snippets"                 ;; personal snippets
;;         "/path/to/some/collection/"           ;; foo-mode and bar-mode snippet collection
;;         "/path/to/yasnippet/yasmate/snippets" ;; the yasmate collection
;;         ))

;;(require 'setup-yasnippet)
(message "AFTER yasnippet settup el!")

;; (require 'setup-daimler-proxy)

;; ;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Ease debugging, as it allows to test with   --- habe ich jetzt statisch gesetzt
;; emacs -q -l ~/path/to/other/.emacs.d/init.el
;; (setq user-emacs-directory
;;      (file-name-directory (or load-file-name (buffer-file-name))))
(setq user-emacs-directory "~/.emacs.d/")
(message user-emacs-directory)



;;(add-to-list 'load-path user-emacs-directory)

;; Set path to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

;; Settings for currently logged in user
(setq user-settings-dir
      (concat user-emacs-directory "users/" user-login-name))
(add-to-list 'load-path user-settings-dir)




;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name "backups" user-emacs-directory))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))
;; Setup environment variables from the user's shell.
(when is-mac (exec-path-from-shell-initialize))

;; Setup elnode before packages to stop it from starting a server
;;(require 'setup-elnode)
;; Setup packages
(require 'setup-package)



;; Set up load path
(add-to-list 'load-path site-lisp-dir)

;; Add external projects to load path
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Lets start with a smattering of sanity
(require 'sane-defaults)
(setq  realgud-safe-mode nil)
(require 'realgud)



;; Setup extensions
 (require 'setup-themes)
;; (eval-after-load 'ido '(require 'setup-ido)) ;; interactive break M-x
(eval-after-load 'dired '(require 'setup-python))

(require 'setup-dired)
(require 'setup-python)





(eval-after-load 'whitespace '(require 'setup-whitespace))
(eval-after-load 'tramp '(require 'setup-tramp))
;; (require 'setup-perspective)
;; (require 'setup-ffip)
;; (require 'setup-paredit)

;; Language specific setup files
(eval-after-load 'js2-mode '(require 'setup-js2-mode))

(require 'setup-speedbar)

(eval-after-load 'sgml-mode '(require 'setup-html-mode))
(eval-after-load 'lisp-mode '(require 'setup-lisp))
(require 'setup-org) ;; organizer todo notes etc
(require 'setup-latex)

(require 'setup-calendar)
(require 'setup-bash)
(require 'setup-octave)
;; (require 'mc)

;;(require 'setup-web-mode)
(require 'setup-jabber) 
(require 'setup-chat-tracking)
;; (eval-after-load 'ruby-mode '(require 'setup-ruby-mode))
 (eval-after-load 'clojure-mode '(require 'setup-clojure-mode))
;; (eval-after-load 'markdown-mode '(require 'setup-markdown-mode))
;;(require 'setup-pandoc) 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-command "latex -synctex=1")
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(markdown-command "pandoc")
 '(org-agenda-files (quote ("~/.emacs.d/agenda.org")))
 '(package-selected-packages
   (quote
    (wgrep-helm color-theme-github cider-eval-sexp-fu gited ob-async ob-sql-mode ob-ipython ecb-snapshot swoop mvn mvn-help projectile-extras maven-test-mode jdee visual-regexp projectile-speedbar ac-octave magit-gh-pulls magit-find-file magit yaml-mode cdlatex apt-sources-list wgrep py-isort jedi-core jedi elpygen common-lisp-snippets yasnippet-classic-snippets markdown-mode markdown-preview-eww markdown-toc ample-theme afternoon-theme auctex dired-atool openwith dired-fdclone dired-explorer yasnippet-snippets virtualenv use-package undo-tree tagedit sr-speedbar spacemacs-theme smooth-scrolling smex realgud python-x python-mode python-django pyenv-mode-auto py-autopep8 pungi pony-mode pippel pip-requirements paredit markdown-preview-mode markdown-mode+ magit-svn jump-to-line isend-mode image-dired+ helm-swoop flymd fill-column-indicator fancy-battery elpy ein egg django-theme django-snippets django-mode django-manage dired-sidebar dired-rsync dired-quick-sort dired-narrow dired-k dired-du dired-details dired-collapse diminish cyberpunk-theme browse-kill-ring bash-completion all-the-icons-dired abyss-theme))))

;; Load slime-js when asked for
;; (autoload 'slime-js-jack-in-browser "setup-slime-js" nil t)
;; (autoload 'slime-js-jack-in-node "setup-slime-js" nil t)

;; Map files to modes
(require 'mode-mappings)

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "^[^.#].*el$"))
  (when (file-regular-p file)
    (load (file-name-sans-extension file))))
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



;; Fill column indicator
;; (require 'fill-column-indicator)
;; (setq fci-rule-color "#111122")

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


;;(require 'setup-java)

;; Misc
;; (require 'appearance)
;; (require 'my-misc)
;; (when is-mac (require 'mac))

;; Diminish modeline clutter
(require 'diminish)
(diminish 'yas-minor-mode)
;; (diminish 'eldoc-mode)
;; (diminish 'paredit-mode)

;; Elisp go-to-definition with M-. and back again with M-,
;; (autoload 'elisp-slime-nav-mode "elisp-slime-nav")
;; (add-hook 'emacs-lisp-mode-hook (lambda () (elisp-slime-nav-mode t) (eldoc-mode 1)))
;; (eval-after-load 'elisp-slime-nav '(diminish 'elisp-slime-nav-mode))

;; Email, baby
;; (require 'setup-mule)

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

;; Run at full power please
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; electric-pair-mode
;; geht nur in emacs 24 turn on automatic bracket insertion by pairs. New in emacs 24
;; see http://ergoemacs.org/emacs/emacs_insert_brackets_by_pair.html
;; (electric-pair-mode 1)

;; company mode autocompletion
;;(add-hook 'after-init-hook 'global-company-mode)

;; Keep emacs Custom-settings in separate file
;;(setq custom-file (expand-file-name "custom.el" user-settings-dir))
;;(load custom-file 'noerror)

;;(message user-settings-dir)

;; Conclude init by setting up specifics for the current user
;;(when (file-exists-p user-settings-dir)
  ;; (if (file-exists-p (concat user-settings-dir "/init.el"))
  ;;     (load (concat user-settings-dir "/init"))
  ;;   (mapc 'load (directory-files user-settings-dir nil "^[^.#].*el$"))))

(when (fboundp 'cycle-themes)
  (cycle-themes))

(put 'scroll-left 'disabled nil)


  (setq abbrev-file-name             ;; tell emacs where to read abbrev
        "~/.emacs.d/abbrev_defs")    ;; definitions from...

(load-library "cglispfuncs")

;;(add-to-list 'load-path "/path/to/downloaded/openwith.el")
;;./elpa/openwith-20120531.1436/openwith.el:1
;; (require 'openwith)
;; (setq openwith-associations '(("\\.pdf\\'" "okular" (file))))

(package-initialize)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


