;;; Package --- Plant UML setup and org integration
;;; Commentary:
;;;
;; plant_uml support
;; https://plantuml.com/de/emacs
;;; Code:
(setq plantuml-jar-path "/home/audeering.local/cgeng/bin/plantuml.jar")
(setq org-plantuml-jar-path (expand-file-name "~/.emacs.d/plant_uml/plantuml.jar"))
(add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
(setq plantuml-default-exec-mode 'jar)


(provide 'setup-plantuml)
;;; setup-plantuml.el ends here
