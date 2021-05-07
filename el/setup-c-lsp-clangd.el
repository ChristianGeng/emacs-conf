;;; setup-c-lsp-clangd.el --- summary -*- lexical-binding: t -*-

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

;; 
;; https://emacs-lsp.github.io/lsp-mode/tutorials/CPP-guide/
;; sudo apt-get install clangd-10
;; https://clangd.llvm.org/installation.html
;; sudo apt-get install bear
;;
;; C++  in  spacemacs probably   also  helpful:
;; https://skebanga.github.io/cpp-dev-in-spacemacs/
;;
;; setup tools for dap-cpp:
;; dap-cpptools-setup /home/audeering.local/cgeng/.emacs.d/.extension/vscode/cpptools
;; dap-gdb-lldb-setup -> /home/audeering.local/cgeng/.emacs.d/.extension/vscode/webfreak.debug
;;
;; 


;; commentary

;;; Code:

(message "Setting up clang lsp")

;; (add-hook 'c-mode-hook 'lsp)
;; (add-hook 'c++-mode-hook 'lsp)


(add-hook 'c-mode-hook 'lsp-deferred)
(add-hook 'c++-mode-hook 'lsp-deferred)

(require 'dap-gdb-lldb)

;; (use-package c-mode
;;   :ensure t
;;   :hook (c-mode . lsp-deferred))
  ;;:custom
  ;; NOTE: Set these if Python 3 is called "python3" on your system!
  ;; (python-shell-interpreter "python3")
  ;; (dap-python-executable "python3")
  ;; (dap-python-debugger 'debugpy)
  ;; :config
  ;; (require 'dap-python))


(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1)  ;; clangd is fast

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  (yas-global-mode))

(provide 'setup-c-lsp-clangd)

;;; setup-c-lsp-clangd.el ends here
