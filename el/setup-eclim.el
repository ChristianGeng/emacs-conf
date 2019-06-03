
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
;; /opt/eclim_2.8.0/
;;  0,1,5,6

;; If you plan on using eclim along with the eclipse gui, then simply start eclipse and open the eclimd view:
;; Window ‣ Show View ‣ Other ‣ Eclim ‣ eclimd


;; build it:
;; /opt/eclipse-jee-photon/eclipse -initialize
;; git clone git://github.com/ervandew/eclim.git
;; build:
;; ant \
;;    -Declipse.home=/opt/eclipse \
;;    -Declipse.local=$HOME/.eclipse/org.eclipse.platform_<version>
;; ant \
;;   -Declipse.home=/opt/eclipse-jee-photon/ \
;;   -Declipse.local=$HOME/.eclipse/org.eclipse.platform_4.11.0_816259024_linux_gtk_x86_64


;; das klappt auf meinem Arbeitsrechner: 
;; ant -Declipse.home=/opt/eclipse-2019-3/ \
;; -Declipse.local=$HOME/.eclipse/org.eclipse.platform_4.11.0_1033723747_linux_gtk_x86_64/



;; /home/christian/.eclipse/org.eclipse.platform_4.11.0_816259024_linux_gtk_x86_64/eclimd
;;  ~/.eclipse/org.eclipse.platform_4.11.0_816259024_linux_gtk_x86_64/

(require 'eclim)
(setq eclimd-autostart t)
(global-eclim-mode)


;; (custom-set-variables
;;   '(eclim-eclipse-dirs '("/opt/eclipse-jee-photon/eclipse"))
;;   '(eclim-executable "/home/christian/.eclipse/org.eclipse.platform_4.11.0_816259024_linux_gtk_x86_64/eclimd"))
;; 
;; (custom-set-variables
;; '(eclim-executable "~/.vim/bundle/eclim/"))


;; (custom-set-variables
;; '(eclim-executable "/home/christian/.eclipse/org.eclipse.platform_4.11.0_816259024_linux_gtk_x86_64/eclimd"))

 (custom-set-variables
   '(eclim-eclipse-dirs '("/opt/eclipse-jee-photon/"))
   '(eclim-executable "/opt/eclipse-jee-photon/plugins/org.eclim_2.8.0/bin/eclim"))


 (custom-set-variables
   '(eclim-eclipse-dirs '("/opt/eclipse-2019-3/"))
   '(eclim-executable "/home/cgn/.eclipse/org.eclipse.platform_4.11.0_1033723747_linux_gtk_x86_64/plugins/org.eclim_2.8.0/bin/eclim")
   '(eclimd-executable "/home/cgn/.eclipse/org.eclipse.platform_4.11.0_1033723747_linux_gtk_x86_64/eclimd"))




(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)


(require 'company)
(require 'company-emacs-eclim)
(company-emacs-eclim-setup)
(global-company-mode t)


(provide 'setup-eclim)
