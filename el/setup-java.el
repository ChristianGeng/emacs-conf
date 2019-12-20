 ;; Try to execute
 ;; mvn -U clean
;; https://github.com/jdee-emacs/jdee-server
;; quicktour
;; http://jdee.sourceforge.net/quicktour.html
;; https://www.emacswiki.org/emacs/JavaDevelopmentEnvironment#toc1
;; lsp key commands:
;; https://github.com/emacs-lsp/lsp-java
;; (setq inhibit-startup-message t)
;; (setq jdee-server-dir "/home/christian/jars/jdee-server/target/jdee-bundle-1.1-SNAPSHOT.jar")
;;(setq jdee-server-dir "/home/christian/jars/jdee-server/target/")
;;(setq jdee-server-dir "/home/christian/jars/jdee-server/target/")
(setq jdee-server-dir (concat  (getenv "HOME")  "/jars/"))

(require 'cc-mode)

(condition-case nil
    (require 'use-package)
  (file-error
   (require 'package)
   (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
   (package-initialize)
   (package-refresh-contents)
   (package-install 'use-package)
   (require 'use-package)))

(use-package projectile :ensure t)
(use-package treemacs :ensure t)
(use-package yasnippet :ensure t)
(use-package lsp-mode :ensure t)
(use-package hydra :ensure t)
(use-package company-lsp :ensure t)
(use-package lsp-ui :ensure t)
(use-package lsp-java :ensure t :after lsp
  :config (add-hook 'java-mode-hook 'lsp))

(use-package dap-mode
  :ensure t :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

(use-package dap-java :after (lsp-java))
;; (use-package lsp-java-treemacs :after (treemacs))


(provide 'setup-java)
