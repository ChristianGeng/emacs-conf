;;; XEmacs backwards compatibility file
;;; separate inits for gnu and x flavors: 
  (if (string-match "XEmacs" emacs-version)
      (setq user-init-file "~/.emacs.d/init-x.el")
      (setq user-init-file   "~/.emacs.d/init-g.el")
      )

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
