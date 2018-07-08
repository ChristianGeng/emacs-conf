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

(setq  realgud-safe-mode nil)


(package-initialize)
;; Setup packages

;; Switch between windows with Shift+{left,up,down,right}
(windmove-default-keybindings)
(setq windmove-wrap-around t)


(add-to-list 'load-path "~/.emacs.d/el")

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
(require 'realgud)

;; Setup extensions
(require 'setup-themes)
;; (eval-after-load 'ido '(require 'setup-ido)) ;; interactive break M-x
;; (eval-after-load 'dired '(require 'setup-dired))
(eval-after-load 'magit '(require 'setup-magit)) ;; version control
(eval-after-load 'grep '(require 'setup-rgrep))
(require 'setup-yasnippet) 
(eval-after-load 'python '(require 'setup-python))


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
(require 'setup-bash)

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
 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "256a381a0471ad344e1ed33470e4c28b35fb4489a67eb821181e35f080083c36" "dfe0523e20114df987a41afb6ac5698307e65e0fcb9bff12dc94621e18d44c3d" "721bb3cb432bb6be7c58be27d583814e9c56806c06b4077797074b009f322509" "946e871c780b159c4bb9f580537e5d2f7dba1411143194447604ecbaf01bd90c" "3fa07dd06f4aff80df2d820084db9ecbc007541ce7f15474f1d956c846a3238f" "cf284fac2a56d242ace50b6d2c438fcc6b4090137f1631e32bedf19495124600" "c616e584f7268aa3b63d08045a912b50863a34e7ea83e35fcab8537b75741956" "0cd56f8cd78d12fc6ead32915e1c4963ba2039890700458c13e12038ec40f6f5" "b563a87aa29096e0b2e38889f7a5e3babde9982262181b65de9ce8b78e9324d5" "d21135150e22e58f8c656ec04530872831baebf5a1c3688030d119c114233c24" "59d1dc166e648573cd7d2fedca89cb5af3309e1a06f230a9c34e02189eb33ab7" "7393c1db792adec2f7ce4e6bdd162d5b1f2621c16dfd2450955b684786b48add" default)))
 '(markdown-command "pandoc")
 '(package-selected-packages
   (quote
    (dired-atool openwith dired-fdclone dired-explorer yasnippet-snippets virtualenv use-package undo-tree tagedit sr-speedbar spacemacs-theme smooth-scrolling smex realgud python-x python-mode python-django pyenv-mode-auto py-autopep8 pungi pony-mode pippel pip-requirements paredit markdown-preview-mode markdown-mode+ magit-svn jump-to-line isend-mode image-dired+ helm-swoop flymd fill-column-indicator fancy-battery elpy ein egg django-theme django-snippets django-mode django-manage dired-sidebar dired-rsync dired-quick-sort dired-narrow dired-k dired-du dired-details dired-collapse diminish cyberpunk-theme browse-kill-ring bash-completion all-the-icons-dired abyss-theme))))

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

;; Misc
;; (require 'appearance)
;; (require 'my-misc)
;; (when is-mac (require 'mac))

;; Diminish modeline clutter
(require 'diminish)
;; (diminish 'yas-minor-mode)
;; (diminish 'eldoc-mode)
;; (diminish 'paredit-mode)

;; Elisp go-to-definition with M-. and back again with M-,
;; (autoload 'elisp-slime-nav-mode "elisp-slime-nav")
;; (add-hook 'emacs-lisp-mode-hook (lambda () (elisp-slime-nav-mode t) (eldoc-mode 1)))
;; (eval-after-load 'elisp-slime-nav '(diminish 'elisp-slime-nav-mode))

;; ;; Email, baby
;; (require 'setup-mu4e)

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
(electric-pair-mode 1)

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
(require 'openwith)
(setq openwith-associations '(("\\.pdf\\'" "okular" (file))))
(openwith-mode t)






(package-initialize)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


