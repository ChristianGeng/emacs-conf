;;; Package --- Plant UML setup and org integration
;;; Commentary:
;;;
;; plant_uml support
;; https://plantuml.com/de/emacs
;; java -jar ~/.emacs.d/plant_uml/plantuml.jar
;; Run a file, will create a png:
;; java -jar ~/.emacs.d/plant_uml/plantuml.jar test.plantuml
;;; Code:
(setq plantuml-jar-path "~/.emacs.d/plant_uml/plantuml.jar")
(setq org-plantuml-jar-path (expand-file-name "~/.emacs.d/plant_uml/plantuml.jar"))
(add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
(setq plantuml-default-exec-mode 'jar)


(provide 'setup-plantuml)
;;; setup-plantuml.el ends here
