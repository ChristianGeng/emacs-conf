;;; name.el --- summary -*- lexical-binding: t -*-

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

;; commentary

;;; Code:

(provide 'setup-typescript)

;; TypeScript
;;
;; This is a basic configuration for the TypeScript language so that .ts files activate
;; typescript-mode when opened. We’re also adding a hook to typescript-mode-hook to call
;; lsp-deferred so that we activate lsp-mode to get LSP features every time we edit
;; TypeScript code.
;; Important note! For lsp-mode to work with TypeScript (and JavaScript) you will need to
;; install a language server on your machine. If you have Node.js installed, the easiest way
;; to do that is by running the following command:
;;
;; >> npm install -g typescript-language-server typescript
;;
;; This will install the typescript-language-server and the TypeScript compiler package.


(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 2)
  )


(provide 'setup-typescript)
;;; setup-typescript ends here
