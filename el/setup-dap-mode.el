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

;; commentary

;;; Code:

(message "Setting up Dap Mode!")

(use-package dap-mode
  :custom
  ;; (dap-auto-configure-features '(sessions locals tooltip)) -> alternativ
  (lsp-enable-dap-auto-configure nil)
  :commands dap-debug
  :config
  (dap-ui-mode 1)
  (dap-tooltip-mode 1)
  (require 'dap-node)
  (dap-node-setup)
  (require 'dap-hydra)
  ;; (require 'dap-gdb-lldb)  -> makes it break!
  ;; (dap-gdb-lldb-setup)
  )  ;; dap-node-setup setups the debug adapter



(provide 'setup-dap-mode)
;;; setup-dap-mode.el ends here

