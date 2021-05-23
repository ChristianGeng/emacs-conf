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

;;; pyright
;;; https://github.com/emacs-lsp/lsp-mode/issues/1863:
;; entweder über vs code installieren oder selbst bauen
;;
;;
;; git clone https://github.com/microsoft/pyright
;; cd pyright
;; npm i
;; npm run build:serverProd
;; das sorgt dafür dass pyright bei mir im Pfad ist
;; which pyright
;; momentan befindet sich das hier: /home/audeering.local/cgeng/.nvm/versions/node/v12.22.1/bin/pyright
;; Nutzung der VSCode Version:
;; (setq lsp-pyright-server-cmd `("node" "~/.vscode/extensions/ms-python.vscode-pylance-2021.5.3/dist/pyright.bundle.js" "--stdio"))
;; (setq lsp-pyright-server-cmd `("node" "~/pyright/client/server/server.bundle.js" "--stdio"))

;; Activating venvs:
;; After changing the virtual env, the lsp workspace has to be restarted:
;; lsp-restart-workspace
;; see https://github.com/emacs-lsp/lsp-pyright/issues/7
;;

;; pyrightconfig
;; Pyright LS uses a file called pyrightconfig.json to include settings
;; This is documented at https://github.com/microsoft/pyright/blob/main/docs/configuration.md
;; https://blog.pilosus.org/posts/2019/12/26/python-third-party-tools-configuration/

;; PYTHONPATH
;; Setting py-pythonpath as a .dir-local seems not to work
;; https://github.com/porterjamesj/virtualenvwrapper.el/issues/56


;; Projectile tests
;; Tests : /home/audeering.local/cgeng/.venvs/py37/bin/pytest --ds=app.settings --color=no app/  --ignore app/tests/  --cov=app/study --cov=app/report  --cov=app/core

;; https://github.com/microsoft/pyright/issues/1359
;; Django Stubs: https://pypi.org/project/django-stubs/

;;; Code:

(message "Lsp for Python: pyright version")

;; (defun lsp-python-ms-format-buffer ()
;;   (interactive)
;;   (when (and (executable-find "yapf") buffer-file-name)
;;     (call-process "yapf" nil nil nil "-i" buffer-file-name)))

;; (add-hook 'python-mode-hook
;;           (lambda ()
;;             (add-hook 'after-save-hook #'lsp-python-ms-format-buffer t t)))


(use-package python-mode
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp-deferred)
                         (yapf-mode)
                         (lsp-treemacs)
                         )
                     )
  :custom
  ;; NOTE: Set these if Python 3 is called "python3" on your system!
  ;; (python-shell-interpreter "python3")
  ;; (dap-python-executable "python3")
  ;; should be .dir-local:
  ;; (lsp-pyright-venv-path "~/.venvs/py37")
  (dap-python-debugger 'debugpy)
  :config
  (require 'dap-python)
  ;; (setq lsp-pyright-server-cmd `("node" "~/.vscode/extensions/ms-python.vscode-pylance-2021.5.3/dist/pyright.bundle.js" "--stdio"))
)


(require 'dap-python)

;; (lsp-client-settings)

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
  (pyvenv-mode 1)
  ;; (setq pyvenv-workon "py37")  ; Default venv
  (pyvenv-tracking-mode 1)
  )  ; Automatically use pyvenv-workon via dir-locals

(provide 'setup-python-lsp-pyright)

;;; setup-python-lsp-pyright.el ends here
