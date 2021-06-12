;;; name.el --- Package Setup -*- lexical-binding: t -*-

;; Author: CGeng
;; Maintainer: CGeng
;; Version: 1.0.0
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

;; Setup Package Melpa and other repos

;;; Code:


;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   (cons 'rainbow-delimiters marmalade)
;;    (cons 'exec-path-from-shell melpa)

   ;; (cons 'magit melpa)
   ;; (cons 'magit-svn melpa)
   ;; (cons 'paredit melpa)
   ;; (cons 'flymake-cursor melpa)
   ;; (cons 'stylus-mode melpa)
   ;; (cons 'auto-complete marmalade)
   ;; (cons 'highlight-indentation marmalade)
   ;; (cons 'find-file-in-project marmalade)
   ;; (cons 'idomenu marmalade)
   ;; (cons 'nose marmalade)
   ;; (cons 'iedit marmalade)



;;    (cons 'elpy marmalade)
;;    (cons 'move-text melpa)
;;    (cons 'gist melpa)
;;    (cons 'htmlize melpa)
;;    (cons 'elisp-slime-nav melpa)
;;    ;(cons 'elnode marmalade)
;;    (cons 'slime-js marmalade)
;;    (cons 'git-commit-mode melpa)
;;    (cons 'gitconfig-mode melpa)
;;    (cons 'gitignore-mode melpa)
;;    (cons 'clojure-mode melpa)
;;    (cons 'nrepl melpa)
))



;; alternatives: frosted melpa mirror:
;; see https://github.com/d12frosted/elpa-mirror
;; these can be used when the defaults are down.
(defvar gnu '("gnu" . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/gnu/"))
(defvar melpa '("melpa" . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/melpa/"))
(defvar org '("org" . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/org/"))


(defvar marmalade '("marmalade" . "https://marmalade-repo.org/packages/"))
(defvar gnu '("gnu" . "https://elpa.gnu.org/packages/"))
;; Milkbox ist nicht mehr erreichbar  - 2020-09-02
;;(defvar melpa '("melpa" . "http://melpa.milkbox.net/packages/"))
;;(defvar melpa '("melpa" . "http://stable.melpa.org/packages/"))
(defvar melpa '("melpa" . "http://unstable.melpa.org/packages/"))
(defvar org '("org" . "https://orgmode.org/elpa/"))

;;(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(setq-default package-user-dir (concat user-emacs-directory "elpa"))

;; Add marmalade to package repos
;; (add-to-list 'package-archives marmalade)
(add-to-list 'package-archives melpa t)
(add-to-list 'package-archives org t)

;; Add packages defined elsewhere as builtin packages, so they will
;; not be pulled in a second time
(eval-after-load 'finder-inf
  '(setq package--builtins
	 (nconc '(
		  (yasnippet . [(0 8) nil "yasnippet"])
               ;; (pkgname . [(maj-ver min-ver) nil "description"])
		  ) package--builtins)))

(package-initialize)

(unless (and (file-exists-p (concat package-user-dir "/archives/marmalade"))
             (file-exists-p  (concat package-user-dir "/archives/gnu"))
             (file-exists-p (concat package-user-dir "/archives/melpa")))
  (package-refresh-contents))

;; (defun packages-install (&rest packages)
;;   (mapc (lambda (package)
;;           (let ((name (car package))
;;                 (repo (cdr package)))
;;             (when (not (package-installed-p name))
;;               (let ((package-archives (list repo)))
;;                 (package-initialize)
;;                 (package-install name)))))
;;         packages)
;;   (package-initialize)
;;   (delete-other-windows))

;;; setup-package.el ends here

(provide 'setup-package)
;;; setup-package.el ends here
