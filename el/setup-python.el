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
(require 'cl-lib)
(require 'elpy)


;;  Mode specific fill column: 
;; https://stackoverflow.com/questions/8080495/how-do-i-set-the-emacs-fill-column-for-a-specific-mode

(defconst python-linewidth 120)

(add-hook 'python-mode-hook 'auto-fill-mode)
(add-hook 'python-mode-hook
          (lambda ()
            (set-fill-column python-linewidth)))

(require 'fill-column-indicator)
(setq fci-rule-column python-linewidth)
(add-hook 'python-mode-hook 'fci-mode)

;;(add-to-list 'load-path "/D/myfiles/2018/isortify")
;; (load-library "isortify")
;; (setq isortify-line-width python-linewidth)


;; (setq ein:jupyter-default-server-command "/home/christian/.virtualenvs/py3/bin/jupyter")
;;(setq ein:jupyter-default-notebook-directory "/D/myfiles/2018/coursera_DeepLearning_Ng/")
;; (setq ein:jupyter-default-notebook-directory "/D/myfiles/2018/coursera_DeepLearning_Ng/4-ConvNets/W4/")



;;;; PYTHON NEW
;;(eval-after-load 'python '(require 'setup-python))

(elpy-enable)
;;(setq elpy-rpc-backend "jedi")
(pyvenv-mode 1)


;; (setenv "WORKON_HOME" "/home/cgn/virtualenvs/")
;; (pyvenv-activate "/home/cgn/.virtualenvs/py3")

;;(pyvenv-activate (getenv "WORKON_HOME"))
(pyvenv-workon "dasense-sdk-py2_02")

;; Using ELPA (When installed from `list-packages'):
;; (require 'pungi)
;; (add-hook #'python-mode-hook
;;           '(lambda ()
;;              (pungi:setup-jedi)))

(add-hook 'python-mode-hook
          (lambda() (which-function-mode 1)))

;; automatically sort imports
;; https://github.com/proofit404/isortify/blob/master/isortify.el
;; (add-hook 'python-mode-hook 'isortify-mode)
;;(add-hook 'python-mode-hook 'linum-mode)
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'jedi:ac-setup)

;;(setq jedi:setup-keys t)                      ; OBSOLETE
;;(setq jedi:complete-on-dot t)                 ; automatically start completing when entering dot

;;(setq jedi:server-command '("/home/CHRGENG/.emacs.d/elpa/jedi-core-20170121.610/jediepcserver.py"))
;; (setq exec-path (append exec-path '("C:/Users/CHRGENG/home/CHRGENG/.emacs.d/elpa/jedi-core-20170121.610/jediepcserver.py")))

;; condarc at startup
;; envs_dirs:
;;  - /Users/nolan/newpath


;; https://github.com/jorgenschaefer/elpy/issues/733
(setq python-shell-prompt-detect-failure-warning nil)


;;(require 'py-autopep8)

;; http://pep8.readthedocs.io/en/1.4.1/_sources/intro.txt


;; enable autopep8 formatting on save
;; ignoring:
;; - E501 - Try to make lines fit within --max-line-length characters.
;; - W293 - Remove trailing whitespace on blank line.
;; - W391 - Remove trailing blank lines.
;; - W690 - Fix various deprecated code (via lib2to3).
;;(require 'py-autopep8)
;; (setq py-autopep8-options '("--ignore=E501,W293,W391,W690,--max-line-length=120"))

;;(setq py-autopep8-options '("--max-line-length=120"))
;;(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

;; enforce removal of  trailing whitespace ehen saving for pep 8:
;; (add-hook 'python-mode-hook
;;                (lambda () (add-to-list 'write-file-functions 'delete-trailing-whitespace)))


;;(setq py-autopep8-options '("--max-line-length=120"))
;;(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)


;; cat ~/xflow/.style.yapf
;; [style]
;; based_on_style = pep8
;; split_before_first_argument = false


;; (setq python-shell-interpreter "jupyter"
;;       python-shell-interpreter-args "console --simple-prompt"
;;       python-shell-prompt-detect-failure-warning nil)

(setq python-shell-interpreter "ipython"
       python-shell-interpreter-args "-i --simple-prompt")


(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")






;; ;; damit bekommt man wenigstens import errors:

 (require 'epc)
 (require 'jedi)
;; ;;(add-hook 'python-mode-hook 'jedi:setup)

;; (if (eq system-type 'windows-nt)
;;     (progn (setq msys-bin "c:\\cygwin\\bin")
;; 	   (setq exec-path (cons msys-bin exec-path))
;; 	   (setenv "PATH" (concat msys-bin ";" (getenv "PATH")))))


 (autoload 'jedi:setup "jedi" nil t)
 (setq jedi:complete-on-dot t)                 ; optional

(jedi:setup)
(jedi:ac-setup)

(require 'elpy)

;; company ausschalten in python
 (add-hook 'python-mode-hook (lambda ()
                               (company-mode -1)))

;; (push 'company-jedi company-backends)


(add-hook 'python-mode-hook 'projectile-mode)


;; (add-hook 'elpy-mode-hook                                                  
;;           (λ () (local-set-key (kbd "C-o") 'elpy-goto-definition)))        
                                                                           
;; (add-hook 'elpy-mode-hook                                                  
;;           (λ () (local-set-key (kbd "C-i") 'ac-complete-jedi-direct)))  


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



(provide 'setup-python)
