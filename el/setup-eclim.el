
;; -----------------------------------------
;; The eclim install completed successfully.
;; You can now start the eclimd server by executing the script:
;;   /home/christian/.eclipse/org.eclipse.platform_4.11.0_816259024_linux_gtk_x86_64/eclimd

;; For more information please see the eclimd server documentation:
;;   http://eclim.org/eclimd.html
;; For information on using eclim, please visit the getting started guide:
;;   http://eclim.org/gettingstarted.html
;;  temp  


;; ./eclim_2.8.0.bin
;; /opt/eclipse-jee-photon/
;; ~/.vim/bundle/eclim
;;  0,1,5,6

;; If you plan on using eclim along with the eclipse gui, then simply start eclipse and open the eclimd view:
;; Window ‣ Show View ‣ Other ‣ Eclim ‣ eclimd


(require 'eclim)
(setq eclimd-autostart t)
(global-eclim-mode)


(custom-set-variables
  '(eclim-eclipse-dirs '("/opt/eclipse-jee-photon/eclipse"))
  '(eclim-executable "~/.vim/bundle/eclim/eclim"))

(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)


(require 'company)
(require 'company-emacs-eclim)
(company-emacs-eclim-setup)
(global-company-mode t)


(provide 'setup-eclim)
