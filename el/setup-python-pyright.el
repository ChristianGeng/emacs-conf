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

;;; Installation:
;;; https://stackoverflow.com/questions/55320815/how-do-i-install-and-run-pyright-from-the-cli-instead-of-using-vs-code
;;; npm install --global pyright
;;;

;; commentary

;;; Code:

(message "Setup lsp pyright version")

(use-package lsp-pyright
  :if (executable-find "pyright")
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp))))


(provide 'setup-python-pyright)

;;; name.el ends here
