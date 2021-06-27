;;; setup-supercollider.el --- summary -*- lexical-binding: t -*-

;; Author: CGeng
;; Maintainer: CGeng
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

;; Das Packge gibt es nicht in melpa,
;; darum muss es hier heruntergeladen werden
;; https://github.com/supercollider/scel
;; ausserdem: cd scel; cmake .

;; commentary

;;; Code:

(message "Add SuperCollider")
;;; setup-supercollider.el ends here

(add-to-list 'load-path "~/.emacs.d/el/scel/el/")
(require 'sclang)

;; (setenv "PATH" (concat (getenv "PATH") ":/Applications/SuperCollider:/Applications/SuperCollider/SuperCollider.app/Contents/MacOS"))
;; (setq exec-path (append exec-path '("/Applications/SuperCollider"  "/Applications/SuperCollider/SuperCollider.app/Contents/MacOS" )))

(provide 'setup-supercollider)
;;; setup-groovy ends here
