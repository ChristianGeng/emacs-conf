;;; name.el --- summary -*- lexical-binding: t -*-

;; Author: christian
;; Maintainer: christian
;; Version: version
;; Package-Requires: (dependencies)
;; Homepage: homepage
;; Keywords: keywords


;; This file is not part of GNU Emacs

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.


;;; Commentary:


;; relies on pyenv which looks good
;; This should have run in your shell
;; # https://www.liquidweb.com/kb/how-to-install-pyenv-on-ubuntu-18-04/
;; export PYENV_ROOT="$HOME/.pyenv"
;; export PATH="$PYENV_ROOT/bin:$PATH"
;; if command -v pyenv 1>/dev/null 2>&1; then
;;  eval "$(pyenv init -)"
;; fi


;;; Code:

;;; https://github.com/pyenv/pyenv#installation

(message "Hello World!")



(use-package blacken
  :delight
  :hook (python-mode . blacken-mode)
  :custom (blacken-line-length 79))

(use-package lsp-pyright
  :if (executable-find "pyright")
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp)))
  :custom
  (lsp-pyright-venv-path "~/.cache/pypoetry/virtualenvs/"))

(use-package python
  :delight "π "
  :bind (("M-[" . python-nav-backward-block)
         ("M-]" . python-nav-forward-block))
  :preface
  (defun python-remove-unused-imports()
    "Removes unused imports and unused variables with autoflake."
    (interactive)
    (if (executable-find "autoflake")
        (progn
          (shell-command (format "autoflake --remove-all-unused-imports -i %s"
                                 (shell-quote-argument (buffer-file-name))))
          (revert-buffer t t t))
      (warn "python-mode: Cannot find autoflake executable."))))

(use-package py-isort
  :after python
  :hook ((python-mode . pyvenv-mode)
         (before-save . py-isort-before-save)))

(use-package pyenv-mode
  :after python
  :hook ((python-mode . pyenv-mode)
         (projectile-switch-project . projectile-pyenv-mode-set))
  :custom (pyenv-mode-set "3.8.5")
  :preface
  (defun projectile-pyenv-mode-set ()
    "Set pyenv version matching project name."
    (let ((project (projectile-project-name)))
      (if (member project (pyenv-mode-versions))
          (pyenv-mode-set project)
        (pyenv-mode-unset)))))

(use-package pyvenv
  :after python
  :hook ((python-mode . pyvenv-mode)
         (python-mode . (lambda ()
                          (if-let ((pyvenv-directory (find-pyvenv-directory (buffer-file-name))))
                              (pyvenv-activate pyvenv-directory))
                          (lsp))))
  :custom
  (pyvenv-default-virtual-env-name "env")
  (pyvenv-mode-line-indicator '(pyvenv-virtual-env-name ("[venv:"
                                                         pyvenv-virtual-env-name "]")))
  :preface
  (defun find-pyvenv-directory (path)
    "Checks if a pyvenv directory exists."
    (cond
     ((not path) nil)
     ((file-regular-p path) (find-pyvenv-directory (file-name-directory path)))
     ((file-directory-p path)
      (or
       (seq-find
        (lambda (path) (file-regular-p (expand-file-name "pyvenv.cfg" path)))
        (directory-files path t))
       (let ((parent (file-name-directory (directory-file-name path))))
         (unless (equal parent path) (find-pyvenv-directory parent))))))))


(provide 'setup-python-lsp-remember-you)

;;; name.el ends here




