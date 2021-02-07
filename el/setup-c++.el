;;
;; https://martinsosic.com/development/emacs/2017/12/09/emacs-cpp-ide.html
;; https://github.com/atilaneves/cmake-ide

;; https://cmake.org/cmake/help/git-stage/command/target_link_directories.html

(require 'rtags) ;; optional, must have rtags installed
(cmake-ide-setup)

(require 'req-package)

(req-package company
  :config
  (progn
    (add-hook 'after-init-hook 'global-company-mode)
    (global-set-key (kbd "M-/") 'company-complete-common-or-cycle)
    (setq company-idle-delay 0)))


;; (use-package elpy :ensure t
;;   :defer t
;;   :init
;;   (advice-add 'python-mode :before 'elpy-enable))

(provide 'setup-c++)
