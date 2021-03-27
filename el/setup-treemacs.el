;;; name.el --- summary -*- lexical-binding: t -*-

;; Author: CGeng
;; Maintainer: CGeng
;; Version: version
;; Package-Requires: (dependencies)
;; Homepage: homepage
;; Keywords: keywords


;; This file is not part of GNU Emacs

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; For a full copy of the GNU General Public License
;; see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; commentary

;;; https://raw.githubusercontent.com/torbenwilkening/dotfiles/master/emacs.d/init.el


;; (setq treemacs-git-mode nil)

;; (treemacs-git-mode 'simple)
;; Meine config ist stark von hier beeinflusst:
;; https://github.com/cedarbaum/.emacs.d
;; diese ist aber auch gut:
;; https://huadeyu.tech/tools/emacs-setup-notes.html#orga1adbf9
;; 
;;; Code:

;;; (setq all-the-icons-scale-factor 1.0))
(setq doom-variable-pitch-font (font-spec :family "Noto Sans" :size 10))


(use-package treemacs
  :demand t
  :config
  (treemacs-git-mode 'deferred)
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  (treemacs-fringe-indicator-mode t)
  :bind
  (:map global-map
        ("C-c t" . treemacs)
        ("C-x t 0"   . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)
        )
  )

(use-package treemacs-evil
  :after (treemacs evil))

(use-package treemacs-projectile
  :after (treemacs projectile))

(use-package treemacs-icons-dired
  :after (treemacs dired)
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after (treemacs magit))

(use-package treemacs-all-the-icons
  :after (treemacs all-the-icons))


;;(treemacs-git-mode 'deferred)

(provide 'setup-treemacs)
;;; setup-treemacs.el ends here
