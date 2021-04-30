;;; setup-python-lsp.el --- summary -*- lexical-binding: t -*-

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



;;; emacs from scratch video transcript:
;;; https://github.com/daviwil/emacs-from-scratch/blob/dd9320769f3041ac1edca139496f14abe147d010/Emacs.org#python
;;; Commentary:

;; M-x run-python
;; M-x python-shell-send-region
;; M-x python-shell-send-buffer
;; M-x python-shell-send-file
;; M-x python-shell-send-defun

;; pip install --user "python-language-server[all]"
;; pyls command line must be there

;; https://emacs-lsp.github.io/lsp-mode/page/languages/

;; lsp find definition c-c c l g
;; lsp find references

;; lsp rename
;; lsp-format-buffer - code format

;; treemacs symbols : lsp treemacs symbols

;; running tests:
;; evil-mode has g r to refresh test resulst
;; projectile recompile can also be used!

;;; debugging:
;;; there was pbdsp or so
;;; now debugpy is used! -> install with pip
;;; set python debugger:
;;; (dap-python-debugger 'debugpy)
;;; command tostart  deugging : dap-debug
;;; breakpoint: dap-toogle-breakpoint
;;;
;;; Debugging Template

;;; dap-debug-edit-template. Then: What for do you want to add teplate
;;; e.g. pytest for buffer
;;; Es gibt ein template directory
;;; conditional breakpoint: dap breakpoint condition
;;; dap-condition: Edit condition

;;; dap-debug-last: letzte debug conf audrufen

;;; dap-repl: repl when under breakpoint 

;; M-x flyckeck-list-errors

;; Problem:
;; lsp Exception has occured OSError No such device or address /dev/tty

;;; Code:

(message "setup python lsp this time!")

;;; emacs-from-scratch:
;;; pip install --user "python-language-server[all]"
;;; whenever python file is opened, activate lsp-mode
(use-package python-mode
  :ensure t
  :hook (python-mode . lsp-deferred)
  :custom
  ;; NOTE: Set these if Python 3 is called "python3" on your system!
  ;; (python-shell-interpreter "python3")
  ;; (dap-python-executable "python3")
  (dap-python-debugger 'debugpy)
  :config
  (require 'dap-python))

(require 'dap-python)


(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind (:map company-active-map
         ("<tab>" . company-complete-selection))
        (:map lsp-mode-map
         ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(use-package company-box
  :hook (company-mode . company-box-mode))


(use-package pyvenv
  :config
  (pyvenv-mode 1))

(provide 'setup-python-lsp-emacs-from-scratch)

;;; setup-python-lsp.el ends here



