;;; doom-modeline.el --- Setup Doom Modeline  -*- lexical-binding: t; -*-
;;; Commentary:
;;
;; Setup the doom modeline
;; For having glyphs available you should also fonts
;; (all-the-icons-install-fonts)
;; (nerd-icons-install-fonts)
;;
;; You then probably will need to update the font-cache:
;;
;; fc-cache -f -v
;;
;; see: https://www.reddit.com/r/emacs/comments/v5adgc/help_with_fontsicons_in_doommodeline/
;;
;;; Code:


(use-package doom-modeline
      :ensure t
      :hook (after-init . doom-modeline-mode))

;; How tall the mode-line should be (only respected in GUI Emacs).
(setq doom-modeline-height 1)

;; How wide the mode-line bar should be (only respected in GUI Emacs).
(setq doom-modeline-bar-width 3)

;; Determines the style used by `doom-modeline-buffer-file-name'.
;;
;; Given ~/Projects/FOSS/emacs/lisp/comint.el
;;   truncate-upto-project => ~/P/F/emacs/lisp/comint.el
;;   truncate-from-project => ~/Projects/FOSS/emacs/l/comint.el
;;   truncate-with-project => emacs/l/comint.el
;;   truncate-except-project => ~/P/F/emacs/l/comint.el
;;   truncate-upto-root => ~/P/F/e/lisp/comint.el
;;   truncate-all => ~/P/F/e/l/comint.el
;;   relative-from-project => emacs/lisp/comint.el
;;   relative-to-project => lisp/comint.el
;;   file-name => comint.el
;;   buffer-name => comint.el<2> (uniquify buffer name)
;;
;; If you are expereicing the laggy issue, especially while editing remote files
;; with tramp, please try `file-name' style.
;; Please refer to https://github.com/bbatsov/projectile/issues/657.
;; (setq doom-modeline-buffer-file-name-style 'truncate-upto-project)
;; (setq doom-modeline-buffer-file-name-style 'relative-from-project)
(setq doom-modeline-buffer-file-name-style 'truncate-all)


;; Whether display icons in mode-line or not.
(setq doom-modeline-icon t)

;; Whether display the icon for major mode. It respects `doom-modeline-icon'.
(setq doom-modeline-major-mode-icon t)

;; Whether display color icons for `major-mode'. It respects
;; `doom-modeline-icon' and `all-the-icons-color-icons'.
(setq doom-modeline-major-mode-color-icon t)

;; Whether display icons for buffer states. It respects `doom-modeline-icon'.
(setq doom-modeline-buffer-state-icon t)

;; Whether display buffer modification icon. It respects `doom-modeline-icon'
;; and `doom-modeline-buffer-state-icon'.
(setq doom-modeline-buffer-modification-icon t)

;; Whether display minor modes in mode-line or not.
(setq doom-modeline-minor-modes nil)

;; If non-nil, a word count will be added to the selection-info modeline segment.
(setq doom-modeline-enable-word-count nil)

;; If non-nil, only display one number for checker information if applicable.
(setq doom-modeline-check-simple-format t)

;; The maximum displayed length of the branch name of version control.
(setq doom-modeline-vcs-max-length 12)

;; Whether display perspective name or not. Non-nil to display in mode-line.
(setq doom-modeline-persp-name t)

;; Whether display `lsp' state or not. Non-nil to display in mode-line.
(setq doom-modeline-lsp t)

;; Whether display github notifications or not. Requires `ghub` package.
(setq doom-modeline-github nil)

;; The interval of checking github.
(setq doom-modeline-github-interval (* 30 60))

;; Whether display environment version or not
(setq doom-modeline-env-version t)
;; Or for individual languages
(setq doom-modeline-env-enable-python t)
(setq doom-modeline-env-enable-ruby t)
(setq doom-modeline-env-enable-perl t)
(setq doom-modeline-env-enable-go t)
(setq doom-modeline-env-enable-elixir t)
(setq doom-modeline-env-enable-rust t)

;; Change the executables to use for the language version string
(setq doom-modeline-env-python-executable "python")
(setq doom-modeline-env-ruby-executable "ruby")
(setq doom-modeline-env-perl-executable "perl")
(setq doom-modeline-env-go-executable "go")
(setq doom-modeline-env-elixir-executable "iex")
(setq doom-modeline-env-rust-executable "rustc")

;; Whether display mu4e notifications or not. Requires `mu4e-alert' package.
(setq doom-modeline-mu4e t)

;; Whether display irc notifications or not. Requires `circe' package.
(setq doom-modeline-irc t)

;; Function to stylize the irc buffer names.
(setq doom-modeline-irc-stylize 'identity)

;; (setq doom-modeline-evil-state-icon nil)
(setq doom-modeline-unicode-fallback nil)


;; Evil Specific Stuff

;; disables all icons, not what I want
;; (setq doom-modeline-icon t)
;; seem to only affect evil
;; (setq doom-modeline-modal-icon t)
(setq doom-modeline-modal-icon nil)
;; would be good to get better faces!
;; this does not exist
;; (setq doom-modeline-evil-state-icon nil)
;; Links
;; https://github.com/seagle0128/doom-modeline/issues/348
;; https://github.com/seagle0128/doom-modeline/issues/8
;; does not work for me:
;; https://github.com/seagle0128/doom-modeline/issues/254

(provide 'setup-doom-modeline)
;;; setup-doom-modeline.el ends here
