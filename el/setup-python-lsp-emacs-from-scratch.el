;;; setup-python-lsp.el --- summary -*- lexical-binding: t -*-

;; Author: christian
;; Maintainer: christian
;; Version: version
;; Package-Requires: (dependencies)
;; Homepage: homepage
;; Keywords: keywords


;; This file is not part of GNU Emacs

;; Which language server should I use?
;; Alternatives according to https://emacs-lsp.github.io/lsp-mode/page/languages/
;; - Python (Jedi Language Server)
;; - Python (Palantir)
;; - Python (Pyright)
;; - Python (Microsoft)
;; Ausserdem: pip install python-lsp-server - soll der Nachfolger von Palantir werden
;;
;; see https://www.reddit.com/r/emacs/comments/ih3q5x/lsp_for_python_sure_but_which_lsp_server/
;; One clear Statement:
;;
;; pyright > mspyls > pyls.
;;
;;
;; This link https://github.com/emacs-lsp/lsp-mode/issues/1863 states that  "Pylance is built on top of Pyright"
;; This is the announcement for pylance (in diese Richtung will MSoft, nicht OpenSource):
;; https://devblogs.microsoft.com/python/announcing-pylance-fast-feature-rich-language-support-for-python-in-visual-studio-code/
;; Same link as above:
;; Pylance = Pyright + IntelliCode AI models (not open-source)

;;; emacs from scratch video transcript:
;;; https://github.com/daviwil/emacs-from-scratch/blob/dd9320769f3041ac1edca139496f14abe147d010/Emacs.org#python
;;; Commentary:

;; M-x run-python
;; M-x python-shell-send-region
;; M-x python-shell-send-buffer
;; M-x python-shell-send-file
;; M-x python-shell-send-defun

;; pip install --user "python-language-server[all]"
;; pip install debugpy
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

;; vscode extensions installed by emacs functions end up in
;; ~/.emacs.d/.extension/vscode/

;; https://emacs-lsp.github.io/lsp-mode/
;;

;;; Code:

(message "setup python lsp using palantir - following emacs from scratch")

;;; emacs-from-scratch:
;;; pip install --user "python-language-server[all]"
;;; whenever python file is opened, activate lsp-mode


;;; pyright
;;; https://github.com/emacs-lsp/lsp-mode/issues/1863:
;; entweder über vs code installieren oder selbst bauen
;; (use-package python-mode
;;   :ensure t
;;   :hook (python-mode . (lambda ()
;;                          (require 'lsp-pyright)
;;                          (lsp-deferred)
;;                          )
;;                      )
;;   :custom
;;   ;; NOTE: Set these if Python 3 is called "python3" on your system!
;;   ;; (python-shell-interpreter "python3")
;;   ;; (dap-python-executable "python3")
;;   (dap-python-debugger 'debugpy)
;;   :config
;;   (require 'dap-python))


;;
;; (use-package lsp-pyright
;;   :if (executable-find "pyright")
;;   :hook (python-mode . (lambda ()
;;                          (require 'lsp-pyright)
;;                          (lsp))))



;; pyls / PALANTIR
;; https://www.mattduck.com/lsp-python-getting-started.html
;; Default for vscode  linting:
;; https://code.visualstudio.com/docs/python/linting
(use-package python-mode
  :ensure t
  :hook (python-mode . lsp-deferred)
  :custom
  ;; NOTE: Set these if Python 3 is called "python3" on your system!
  ;; (python-shell-interpreter "python3")
  ;; (dap-python-executable "python3")
  (dap-python-debugger 'debugpy)
  :config
  (require 'dap-python)
  (lsp-register-custom-settings
   '(("pyls.plugins.pyls_mypy.enabled" t t)
     ("pyls.plugins.pyls_mypy.live_mode" nil t)
     ("pyls.plugins.pyls_black.enabled" t t)
     ("pyls.plugins.pyls_isort.enabled" t t)
     ;; Disable these as they're duplicated by flake8
     ("pyls.plugins.pycodestyle.enabled" nil t)
     ("pyls.plugins.mccabe.enabled" nil t)
     ("pyls.plugins.pyflakes.enabled" nil t)))
  )


;; das  wird  der palantir nachfolger.
;; soll  wohl  noch nicht benutzt werden
;; pip install 'python-lsp-server[all]'
;;  ;; Warning (emacs): The palantir python-language-server (pyls) is unmaintained; a maintained fork is the python-lsp-server (pylsp) project; you can install it with pip via: pip install python-lsp-server
;; pip install 'python-lsp-server[all]'
;; https://pypi.org/project/python-lsp-server/
;; (use-package python-mode
;;   :ensure t
;;   :hook (python-mode . lsp-deferred)
;;   :custom
;;   ;; NOTE: Set these if Python 3 is called "python3" on your system!
;;   ;; (python-shell-interpreter "python3")
;;   ;; (dap-python-executable "python3")
;;   (dap-python-debugger 'debugpy)
;;   :config
;;   (require 'dap-python)
;;   (setq lsp-pyls-server-command "pylsp")
;;   )



;; (python-shell-interpreter "python3")#


;; MICROSOFT lsp-python-ms
;; for formatting: https://github.com/emacs-lsp/lsp-python-ms/issues/131
;;; lsp-python-ms
;; Use ‘M-x customize-variable RET flycheck-checker-error-threshold’ to
;; change the threshold or ‘C-u C-c ! x’ to re-enable the checker.
;; M-x install-package lsp-python-ms
;; (use-package python-mode
;;   :ensure t

;;

;; -*- mode: compilation; default-directory: "~/.emacs.d/el/" -*-
;; Comint started at Sat May 22 17:27:35
;; Comint finished at Sat May 22 17:27:38
;;   :hook (python-mode . (lambda ()
;;                          (require 'lsp-python-ms)
;;                          (lsp-deferred)
;;                          )
;;                      )
;;   :config (setq lsp-python-ms-auto-install-server t)
;;   (lsp-register-custom-settings
;;    '(
;;      ("python.autoComplete.addBrackets" lsp-python-ms-completion-add-brackets t)
;;      ("python.analysis.cachingLevel" lsp-python-ms-cache)
;;      ("python.analysis.errors" lsp-python-ms-errors)
;;      ("python.analysis.warnings" lsp-python-ms-warnings)
;;      ("python.analysis.information" lsp-python-ms-information)
;;      ("python.analysis.disabled" lsp-python-ms-disabled)
;;      ("python.analysis.autoSearchPaths" (lambda () (<= (length lsp-python-ms-extra-paths) 0)) t)
;;      ("python.autoComplete.extraPaths" lsp-python-ms-extra-paths)
;;      ))
;; )


;; shows how to customoize:
;;
;; (use-package lsp-mode
;;   :config

;;   :hook
;;   ((python-mode . lsp)))



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

;; This could be the content of .dir-locals.el
;; ((python-mode . ((pyvenv-workon . "feldm")
;;                  (subdirs . nil))))



(provide 'setup-python-lsp-emacs-from-scratch)

;;; setup-python-lsp.el ends here
