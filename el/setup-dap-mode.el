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
;; ;; sessions locals breakpoints expression controls tooltip

;;; Commentary:

;; dap mode
;; Emacs from scratch video https://www.youtube.com/watch?v=0bilcQVSlbM
;; documentation:https://emacs-lsp.github.io/dap-mode/page/configuration/
;; configuration files for the video
;; https://github.com/daviwil/emacs-from-scratch/blob/master/show-notes/Emacs-IDE-01.org
;; https://github.com/daviwil/dotfiles/blob/master/Emacs.org
;; Video uses straight for package management
;;   :straight t
;; https://github.com/daviwil/dotfiles/blob/master/Emacs.org#straightel
;;
;; Launch Debugger:
;; M-x dap-debug
;; Toggle breakpoint
;; dap-breakpoint-toggle
;; Run last configuratuib
;; sudo lsof -i :3001
;; sudo kill -9 27036q
;; sudo lsof -i :3000 | grep ^node | awk -F " " '{print $2}' | xargs kill -9
;; better: dap-disconnct -> stop debugger
;; dap-debug-recent
;;
;; In the buffer list: complete "node" then there are "Node::run-out" buffers
;; go to dap-ui-sessions, then Shift-D should delete a session
;;
;; dap debug templates
;; dap-debug-edit-template
;; das ist das Standardtemplate:
;; (dap-register-debug-template
;;   "Node::Run"   -> Template Name
;;   (list :type "node" -> this is for the node js debugger
;;         :cwd nil
;;         :request "launch"
;;         :program nil  -> what program to run
;;         :name "Node::Run"))
;;
;; How to create a configuration yourself:
;; C-x e is not the best way to go
;; betters: Create a file debug.el in the directory
;;
;; This is the template in the video:
;; https://github.com/daviwil/emacs-from-scratch/blob/master/show-notes/Emacs-IDE-01.org
;; the variables here have to be read from vs code!
;; e.g. in the case here: https://code.visualstudio.com/docs/nodejs/nodejs-debugging
;; (dap-register-debug-template
;;   "Debug Server"
;;   (list :type "node"
;;         :request "launch"
;;         :program "${workspaceFolder}/src/server/index.ts"
;;         :outFiles ["${workspaceFolder}/public/src/server/**/*.js"]
;;         :name "Debug Server"))
;;
;; npm run build
;; = tsc -p .
;; dap-breakpoint-log-message - ohne breakpoint: Dann Expression angeben
;; dap-breakpoint-condition I === 5
;; dap-breakpoint-hit-condition -> integer eingeben, bei 5 stoppt er beim 5.Mal
;; kann sein dass das nicht immer geht!
;;
;; Hydra:
;; dap-hydra
;; dap-ui-expressions -> watch expressions
;;
;; repl
;;
;; dap-ui-repl
;;
;; tooltips
;;
;; dap-tooltip-at-point
;;
;; Configure panels by default
;; dap-auto.configure-fatures -> '(sessions locals tooltip)
;; sessions locals breakpoints expression controls tooltip
;;
;; In  case  you get
;; "Debug session process exited with status: exited abnormally with code 1"
;; find   the stderr in  the  list of  open  buffers and check
;; https://github.com/emacs-lsp/dap-mode/issues/110
;;


;; stopping to debug
;;
;; https://github.com/emacs-lsp/dap-mode/issues/281


;;; Code:

(message "Setting up Dap Mode!")

(use-package dap-mode
  ;; :tags '("IDE" "PROGRAMMING" "LSP")
  :ensure t
  :custom
  ;; (dap-auto-configure-features '(sessions locals tooltip breakpoints expression controls)) ;; -> alternativ
  ;; (lsp-enable-dap-auto-configure nil)  ->  do not start any of locals breakpoints expression controls tooltip by default
  ;; Reduce the features to the repl and the local variable information
  (setq dap-auto-configure-features '(locals repl))
  :commands dap-debug
  :config
  (require 'dap-node)
  (dap-ui-mode 1)
  (dap-tooltip-mode 1)
  (dap-node-setup) ;; Automatically installs Node debug adapter if needed
  (require 'dap-hydra)
    ;; Redefine the height of the repl buffer
  (setq dap-ui-buffer-configurations
        `((,dap-ui--locals-buffer . ((side . right) (slot . 1) (window-width . 0.30)))
          (,dap-ui--expressions-buffer . ((side . right) (slot . 2) (window-width . 0.20)))
          (,dap-ui--sessions-buffer . ((side . right) (slot . 3) (window-width . 0.23)))
          (,dap-ui--breakpoints-buffer . ((side . left) (slot . 2) (window-width . ,treemacs-width)))
          (,dap-ui--debug-window-buffer . ((side . bottom) (slot . 3) (window-width . 0.20)))
          (,dap-ui--repl-buffer . ((side . bottom) (slot . 1) (window-height . 0.20)))))
  ;; (require 'dap-gdb-lldb)  -> makes it break!
  ;; (dap-gdb-lldb-setup)
  ;; Bind `C-c l d` to `dap-hydra` for easy access
  ;; (general-define-key
  ;;  :keymaps 'lsp-mode-map
  ;;  :prefix lsp-keymap-prefix
  ;;  "d" '(dap-hydra t :wk "debugger"))
  )




;; dap-node-setup setups the debug adapter

(provide 'setup-dap-mode)
;;; setup-dap-mode.el ends here
