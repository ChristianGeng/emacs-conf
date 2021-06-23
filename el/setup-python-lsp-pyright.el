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
;; This also statest that pyright settings can also be specified in a [tool.pyright] section of a "pyproject.toml" file.
;; some of these settings are also
;; https://blog.pilosus.org/posts/2019/12/26/python-third-party-tools-configuration/
;;
;; https://github.com/emacs-lsp/lsp-pyright
;; Who to devise local adaptions to PYTHONPATH under Emacs lsp pyright?
;; there is a custom variable:
;; python.analysis.extraPaths via lsp-pyright-extra-paths
;;
;; PYTHONPATH
;; Setting py-pythonpath as a .dir-local seems not to work
;; https://github.com/porterjamesj/virtualenvwrapper.el/issues/56
;; What works though is the customization of lsp-pyright-extra-paths
;; All variables that are accessible through Emacs as defcustom are here:
;; https://github.com/emacs-lsp/lsp-pyright

;; Projectile tests
;; Tests : /home/audeering.local/cgeng/.venvs/py37/bin/pytest --ds=app.settings --color=no app/  --ignore app/tests/  --cov=app/study --cov=app/report  --cov=app/core

;; https://github.com/microsoft/pyright/issues/1359
;; Django Stubs: https://pypi.org/project/django-stubs/

;; flycheck
;; using pyright in emacs lsp as well as in vscode gives identical errors except
;; false errors in emacs that are flagged as "lsp-flycheck-info-unnecessary"
;; https://github.com/emacs-lsp/lsp-mode/issues/2255

;; Formatting providers in vscode
;; https://dev.to/adamlombard/how-to-use-the-black-python-code-formatter-in-vscode-3lo0
;; https://dev.to/adamlombard/how-to-use-the-black-python-code-formatter-in-vscode-3lo0
;; file->preferences->type "python formatting provider"
;; This gets put into ~/cgeng/.config/Code/User/settings.json
;; "python.formatting.provider": "black"
;; file->preferences->type "format on save"

;; configure black
;; https://dev.to/adamlombard/vscode-setting-line-lengths-in-the-black-python-code-formatter-1g62
;; file->preferences->type "python formatting black args"
;; --line-length 119
;; 119 characters

;; what is pylint: .pylintrc

;; Overview about formatting, organizing imports and style checkers
;; https://zhauniarovich.com/post/2020/2020-04-starting-new-python-project/
;; https://www.reddit.com/r/Python/comments/8oqy03/blog_a_comparison_of_autopep8_black_and_yapf_code/

;; Checkers:
;; pyright
;; python-flake8
;; python-pylint
;; python-pycompile
;; python-pyright
;; python-mypy
;;

;; https://flake8.pycqa.org/en/latest/

;; pip install  --upgrade pylint
;; pip install  --upgrade flake8

;; Vergleich der standard-Autoformatters:
;; https://www.kevinpeters.net/auto-formatters-for-python

;; Emacs LSP-Ansatz:
;; jede Sprache macht es selbst, also kein allgemeines setup für lsp und dap:
;; https://alpha2phi.medium.com/emacs-lsp-and-dap-7c1786282324

;; Format Imports Isort -
;; formatting using black and isort
;; https://cereblanco.medium.com/setup-black-and-isort-in-vscode-514804590bf9

;; autoflake will also remove unused imports using pyflakes (which is what flake8 uses to check for extra imports
;;  flycheck-pyflakes  20170330.2311 available  melpa      Support pyflakes in flyc
;; pip install autoflake
;; importmagic
;;
;; yapf stanza example for setup.cfg
;;
;;
;; [yapf]
;; based_on_style = pep8
;; spaces_before_comment = 4
;; split_before_logical_operator = true
;; line-length = 119

;; lisp function to auto-remove unused imports:
;; https://gist.github.com/kracekumar/77d29c7410199fd2cda4

;; linting
;; https://code.visualstudio.com/docs/python/linting
;; https://github.com/emacs-lsp/lsp-mode/issues/1327

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


  (setq lsp-enable-file-watchers nil)
  (setq lsp-file-watch-threshold 2000)

  (setq lsp-pyright-auto-import-completions t)
  (setq lsp-pyright-auto-search-paths t)

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

;;; setup-python-lsp-pyright ends here
