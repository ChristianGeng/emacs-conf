(require 'package)



;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   (cons 'rainbow-delimiters marmalade)
;;    (cons 'exec-path-from-shell melpa)

   ;; (cons 'magit melpa)
   ;; (cons 'magit-svn melpa)
   ;; (cons 'paredit melpa)
   ;; (cons 'flymake-cursor melpa)
   ;; (cons 'stylus-mode melpa)
   ;; (cons 'auto-complete marmalade)
   ;; (cons 'highlight-indentation marmalade)
   ;; (cons 'find-file-in-project marmalade)
   ;; (cons 'idomenu marmalade)
   ;; (cons 'nose marmalade)
   ;; (cons 'iedit marmalade)



;;    (cons 'elpy marmalade)
;;    (cons 'move-text melpa)
;;    (cons 'gist melpa)
;;    (cons 'htmlize melpa)
;;    (cons 'elisp-slime-nav melpa)
;;    ;(cons 'elnode marmalade)
;;    (cons 'slime-js marmalade)
;;    (cons 'git-commit-mode melpa)
;;    (cons 'gitconfig-mode melpa)
;;    (cons 'gitignore-mode melpa)
;;    (cons 'clojure-mode melpa)
;;    (cons 'nrepl melpa)
))



(defvar marmalade '("marmalade" . "http://marmalade-repo.org/packages/"))
(defvar gnu '("gnu" . "http://elpa.gnu.org/packages/"))
(defvar melpa '("melpa" . "http://melpa.milkbox.net/packages/"))
(defvar org '("org" . "https://orgmode.org/elpa/"))


;;(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(setq-default package-user-dir (concat user-emacs-directory "elpa"))

;; Add marmalade to package repos
(add-to-list 'package-archives marmalade)
(add-to-list 'package-archives melpa t)
(add-to-list 'package-archives org t)

;; Add packages defined elsewhere as builtin packages, so they will
;; not be pulled in a second time
(eval-after-load 'finder-inf
  '(setq package--builtins
	 (nconc '(
		  (yasnippet . [(0 8) nil "yasnippet"])
               ;; (pkgname . [(maj-ver min-ver) nil "description"])
		  ) package--builtins)))

(package-initialize)

(unless (and (file-exists-p (concat package-user-dir "/archives/marmalade"))
             (file-exists-p  (concat package-user-dir "/archives/gnu"))
             (file-exists-p (concat package-user-dir "/archives/melpa")))
  (package-refresh-contents))

;; (defun packages-install (&rest packages)
;;   (mapc (lambda (package)
;;           (let ((name (car package))
;;                 (repo (cdr package)))
;;             (when (not (package-installed-p name))
;;               (let ((package-archives (list repo)))
;;                 (package-initialize)
;;                 (package-install name)))))
;;         packages)
;;   (package-initialize)
;;   (delete-other-windows))

(provide 'setup-package)
