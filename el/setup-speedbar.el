(require 'sr-speedbar)

;; autorefresh it                                                                                                                                                                                                                                                                                                                                                          
(setq sr-speedbar-auto-refresh t)

;; and/or turn it on and off later with the function sr-speedbar-refresh-toggle.                                                                                                                                                                                                                                                                                           
;; The defaults it (and speedbar) comes with are a bit odd though - it also doesn't show files that it doesn't recognize, uses images for buttons, and is set on the right side - so you can set these if you'd like -                                                                                                                                                     

(setq speedbar-show-unknown-files nil) ; show all files                                                                                                                                                                                                                                                                                                                    
(setq speedbar-use-images nil) ; use text for buttons                                                                                                                                                                                                                                                                                                                      

(setq sr-speedbar-right-side t) ; put on right side                                                                                                                                                                                                                                                                                                                        
;; (set-face-font 'speedbar-face "Courier-10")

(setq sr-speedbar-width-console 55)
(setq sr-speedbar-width-x 55)

;; improve speedbars behavior                                                                                                                                                                                                                                                                                                                                              
;; see https://stackoverflow.com/questions/20265938/emacs-speedbar-does-not-show-all-classs-methods                                                                                                                                                                                                                                                                        
                 
;; print font family with (print (font-family-list))
;; (set-face-font 'speedbar-face "Courier-10")

(global-ede-mode 1)
(require 'semantic/sb)
(semantic-mode 1)

(provide 'setup-speedbar)

