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

;; Transcript of Video Emacs From Scratch #8 - Build Your Own IDE with lsp-mode
;; which key integration
;;
;; global command log mode has sth. t do with C-x e
;;
;; lsp am besten mit hooks aktivieren
;; Für weniger bekannte Sprachen muss man packages installieren
;; Das Video nimmt typescript
;;
;; lsp-deferred: lsp wird erst geladen wenn ein file mit der entsprechenden extension geöffnet wird
;;
;;
;; config for the video:
;; https://github.com/daviwil/emacs-from-scratch/blob/6d078217a41134cc667f969430d150c50d03f448/Emacs.org
;;
;; ts project used in the tutorial:
;; https://github.com/daviwil/hack-panel
;;
;; The type script language server needs to be installed
;; theia-ide is the one https://emacs-lsp.github.io/lsp-mode/page/lsp-typescript/
;; npm i -g typescript-language-server; npm i -g typescript
;; M-x completion at point is not working as it should!
;;
;; lsp-find-references
;;
;; ich muss leider  rm  ~/.emacs.d/.lsp-session-v1
;; M-x lsp-describe-session
;;
;; diagnostics
;; already via the flymake buffer C-c ! l
;;
;; Light Bulb: Code Actions
;; c-c l T A
;;
;; lsp-format-buffer würde den buffer formattieren
;;
;; lsp-ui
;; lsp-ui-imenu
;;
;; lsp-ui-doc-focus-frame - in den doc popup gehen
;;
;; lsp-ui-doc-peek-find-references - preview von Codestellen, shows references inline
;;
;; lsp-display-line-numbers-mode -> scheint schneller zu sein
;;
;; M-x helm-lsp-workspace-symbol
;;
;; evil-nerd commenter might be worth to have a look
;;
;; Reference(s)
;; C-Example: https://www.reddit.com/r/spacemacs/comments/e7swwd/debugging_with_debug_layer/
;;


;;; Code:

(message "Entering LSP Setup!")


;; npm install -g pyright
;; For Golang, let’s install gopls.
;; GO111MODULE=on go get golang.org/x/tools/gopls@latest
;;
;; Rust
;; For Rust, let’s use rust_analyzer. The easiest way to install is to download the binary, copy to a folder, and add the folder to environment PATH.
;; npm install -g typescript-language-server
;; npm install -g typescript



;; setup hook: top line breadcrumbs
(defun efs/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode)
;;  (python-mode . lsp-deferred)
  )

;; lsp-keymap-prefix prefix does not work in current setup
;; removed
;; # Mod4 l : Exec systemctl suspend
;; (setq lsp-keymap-prefix "C-c l")
;; so back to default WindowsKey-l
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook (
         (lsp-mode . efs/lsp-mode-setup)
         (python-mode . lsp-deferred)
         (go-mode . lsp-deferred)
         (rust-mode . lsp-deferred)
         (typescript-mode . lsp-deferred)
         )
  :init
  ;; (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
  :config
  ;; (lsp-enable-which-key-integration t)
  ;; (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
  )

(use-package helm-lsp)
;; (use-package lsp-ivy :commands lsp-ivy-workspace-symbol)


(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  ;; :bind (:map company-active-map
  ;;        ("<tab>" . company-complete-selection))
  ;;       (:map lsp-mode-map
  ;;        ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(use-package company-box
 :hook (company-mode . company-box-mode))


;; lsp-ui is a set of UI enhancements built on top of lsp-mode which make Emacs feel even more like an IDE.
;; Check out the screenshots on the lsp-ui homepage (linked at the beginning of this paragraph) to see examples of what it can do.
;; lsp-ui-sideline-mode macht das ganze sideline zeugs aus
(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))


;; sideline gar nicht erst anmachen
;; (setq lsp-ui-sideline-enable nil)
;; show messages on sideline or not
;; (setq lsp-ui-sideline-show-hover)


;; lsp-treemacs
;; lsp-treemacs gibt zusätzlich Symbole in die Sideline

;; (setq lsp-ui-doc-enable t
;;       lsp-ui-peek-enable t
;;       lsp-ui-sideline-enable t
;;       lsp-ui-imenu-enable t
;;       lsp-ui-flycheck-enable t)


;;    lsp-treemacs-symbols - Show a tree view of the symbols in the current file
;;    lsp-treemacs-references - Show a tree view for the references of the symbol under the cursor
;;    lsp-treemacs-error-list - Show a tree view for the diagnostic messages in the project


(use-package lsp-treemacs)
  ;; :commands
  ;;   (lsp-treemacs-symbols)
  ;; (lsp-treemacs-errors-list)
  ;; :after lsp)

;; This fixes a bug:
;; Error running timer ‘lsp--on-idle’: (error "The connected server(s) does not support method textDocument/documentLink
(setq lsp-enable-links nil)


;;; setup-lsp.el ends here
(provide 'setup-lsp)
