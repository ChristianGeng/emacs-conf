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

;; Links:
;; http://en.enisozgen.com/editing-ansible-files-in-emacs/
;; https://blog.chmouel.com/2016/09/07/dealing-with-yaml-in-emacs/
;; https://www.emacswiki.org/emacs/YamlMode
;; Alternativ: use lsp https://justin.abrah.ms/dotfiles/emacs.html
;; Tab Indenting as command:
;; https://emacs.stackexchange.com/questions/9465/how-to-shift-a-selected-area-of-text-in-emacs-by-a-certain-number-of-spaces

;; Notes on Binding:

;; C-c ? - get help

;;; Code:

(require 'ansible)
(require 'ansible-doc)
(require 'highlight-indentation)
(require 'highlight-indent-guides)
(use-package yasnippet :straight t)
(require 'poly-ansible)

(autoload 'yaml-mode "yaml-mode")

(add-hook 'yaml-mode-hook #'flycheck-mode)
(add-hook 'yaml-mode-hook '(lambda () (ansible 1))) ;; If you install it from package-manager
(add-hook 'yaml-mode-hook #'ansible-doc-mode)
;;; too fancy
;;; (add-hook 'yaml-mode-hook 'highlight-indentation-mode)
(add-hook 'yaml-mode-hook 'highlight-indent-guides-mode)
(add-hook 'yaml-mode-hook #'yas-minor-mode)

;;; package obsolete:
(add-to-list 'company-backends 'company-ansible)
;;; package obsolete:

(yaml-imenu-enable)


(defun search-in-role ()
  "Seach in role folder."
  (interactive)
  (helm-do-ag (expand-file-name ".." projectile-project-root)))


(add-hook 'yaml-mode-hook
          (lambda ()
            (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

(use-package flycheck-yamllint
  :ensure t
  :defer t
  :init
  (progn
    (eval-after-load 'flycheck
      '(add-hook 'flycheck-mode-hook 'flycheck-yamllint-setup))))

(provide 'setup-yaml-mode)
;;; setup-yaml-mode ends here
