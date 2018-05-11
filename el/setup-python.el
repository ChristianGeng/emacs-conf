;; 
;; elpy documentation online
;; http://elpy.readthedocs.io/en/latest/ide.html
;; help on configuration
;; https://github.com/jorgenschaefer/elpy/wiki/Configuration
;;
;; python hilfe:
;; https://www.emacswiki.org/emacs/?action=browse;oldid=PythonMode;id=PythonProgrammingInEmacs#toc16
;; 
;; DEBUGGING:
;; (a) emacs aus virtualenv aufrufen: workon py3; emacs-24 xxxx
;; (b) M-x py-pdb
;; (c) aufruf korrigieren: python -m pdb /home/christian/.emacs.d/el/formants.py
;;
;; Keybindings:
;; C-c | -> send selection 
;; see http://www.jesshamrick.com/2012/09/18/emacs-as-a-python-ide/
;;
;; Weitere Links
;; https://realpython.com/blog/python/emacs-the-best-python-editor/
;; https://github.com/chaoflow/.emacs.d/blob/master/python-mode-doc.org
;; http://wikemacs.org/wiki/Python
;; Commands
;; M-x rgrep - rekursive suche
;; C-c C-t
;; M-TAB (elpy-company-backend)
;; C-c C-e (elpy-multiedit-python-symbol-at-point) for multirename
;;
;; pymacs - http://www.yilmazhuseyin.com/blog/dev/emacs-setup-python-development/
;; https://stackoverflow.com/questions/13622687/rope-auto-import-did-not-work
;; Erwähnung von rope_py3k https://github.com/jorgenschaefer/elpy/wiki/Installation

;;(global-set-key (kbd "C-<return>") (lambda () (interactive) (python-shell-send-line) (next-line)))

;; M-x pyvenv-activate


(require 'python)
;; (require 'cl-lib)
(require 'cl-lib)
(require 'elpy)

;;;; PYTHON NEW 
;;(eval-after-load 'python '(require 'setup-python))
(elpy-enable)
;;(setq elpy-rpc-backend "jedi")
(pyvenv-mode)
(setenv "WORKON_HOME" "/home/christian/.virtualenvs/")
(pyvenv-activate "/home/christian/.virtualenvs/py3")

;; Using ELPA (When installed from `list-packages'):
(require 'pungi)
(add-hook #'python-mode-hook
          '(lambda ()
             (pungi:setup-jedi)))

;;(setenv "WORKON_HOME" "/cygdrive/c/Anaconda3/envs/")
;;(setenv "WORKON_HOME" "/home/christian/.virtualenvs/")

;(pyvenv-activate "py3")
;(pyvenv-mode 1)

;; From the console:
;; echo $WORKON_HOME
;; /home/CHRGENG/venvs
;; virtualenv -p c:/Anaconda3/python.exe ~/.emacs.d/.python-environments/default
;; /home/CHRGENG/venvs/py3_virtualenv/Scripts/activate.bat
;; dort legt conda per default die venvs hin:
;;  C:\Anaconda3\envs\py3_Conda
;; conda info -e
;; source activate
;; source  activate  py3_Conda
(add-hook 'python-mode-hook 'jedi:setup)
;;(setq jedi:setup-keys t)                      ; optional
;;(setq jedi:complete-on-dot t)                 ; optional
;; (pyenv-activate "/data/venvs/tttPyChristian")

;;(setq jedi:server-command '("/home/CHRGENG/.emacs.d/elpa/jedi-core-20170121.610/jediepcserver.py"))
;; (setq exec-path (append exec-path '("C:/Users/CHRGENG/home/CHRGENG/.emacs.d/elpa/jedi-core-20170121.610/jediepcserver.py")))

;; condarc at startup
;; envs_dirs:
;;  - /Users/nolan/newpath

;; automatically sort imports
;; https://github.com/proofit404/isortify/blob/master/isortify.el
(add-hook 'python-mode-hook 'isort-mode)

(require 'py-autopep8)
(setq py-autopep8-options '("--max-line-length=120"))
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

;; enforce removal of  trailing whitespace ehen saving for pep 8:
 (add-hook 'python-mode-hook
                (lambda () (add-to-list 'write-file-functions 'delete-trailing-whitespace)))

;; (setq python-shell-interpreter "jupyter"
;;       python-shell-interpreter-args "console --simple-prompt"
;;       python-shell-prompt-detect-failure-warning nil)
;; (add-to-list 'python-shell-completion-native-disabled-interpreters
;;              "jupyter")

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")


;; ;; damit bekommt man wenigstens import errors:

 (require 'epc)
 (require 'jedi)
;; ;;(add-hook 'python-mode-hook 'jedi:setup)

;; (if (eq system-type 'windows-nt)
;;     (progn (setq msys-bin "c:\\cygwin\\bin")
;; 	   (setq exec-path (cons msys-bin exec-path))
;; 	   (setenv "PATH" (concat msys-bin ";" (getenv "PATH")))))


 (autoload 'jedi:setup "jedi" nil t)
 (setq jedi:setup-keys t)                      ; optional
 (setq jedi:complete-on-dot t)                 ; optional


;; Used by virtualenvwrapper.el
;;(setq venv-location (expand-file-name "/C/Anaconds/envs")) 
;;(setq python-shell-virtualenv-path "/C/Anaconda3/envs/")
;;(setq python-environment-directory venv-location)
;; (setq python-environment-default-root-name . "py3_Conda")

;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:server-command (list "python3" jedi:server-script))
;; (jedi-mode 1)

;; (when (memq window-system '(mac ns))
;;   (exec-path-from-shell-initialize))

;; (defvar jedi:install-server--command
;;   `("pip" "install" "--upgrade" ,(convert-standard-filename jedi:source-dir)))

;(setq jedi:server-command '("C:\\cygwin\\home\\CHRGENG\\.emacs.d\\elpa\\jedi-core-20170121.610\\jediepcserver.py c"))

(require 'elpy)


;; (require 'epy-setup)
;; (require 'epy-python)
;; (require 'epy-completion)
;; (require 'epy-editing)
;; (require 'epy-nose)
;; (require 'epy-bindings)



(provide 'setup-python)
