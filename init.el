;;; XEmacs backwards compatibility file
;;; separate inits for gnu and x flavors: 
  (let ((emacs-config-dir (file-name-directory (or load-file-name buffer-file-name))))
    (if (string-match "XEmacs" emacs-version)
        (setq user-init-file (expand-file-name "init-x.el" emacs-config-dir))
      (setq user-init-file (expand-file-name "init-g.el" emacs-config-dir))
      ))

;  (if (string-match "XEmacs" emacs-version)
;        (setq thesub "~/.xemacs/init-x.el")
;      (setq thesub "~/.xemacs/init-g.el"))

;    (setq user-init-file
;          (expand-file-name "init.el"
;                            (expand-file-name thesub "~")))
;;    (setq custom-file
;;          (expand-file-name "custom.el"
;;	    		    (expand-file-name thesub "~")))

 (load-file user-init-file)
;;    (load-file custom-file)
;;    (my-color-theme)
