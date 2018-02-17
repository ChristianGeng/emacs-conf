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

(require 'python)
;; (require 'cl-lib)
(require 'cl-lib)

(require 'setup-elpy)


;; (require 'epy-setup)
;; (require 'epy-python)
;; (require 'epy-completion)
;; (require 'epy-editing)
;; (require 'epy-nose)
;; (require 'epy-bindings)



(provide 'setup-python)
