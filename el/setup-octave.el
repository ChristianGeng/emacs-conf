
;; autolad octave mode for *.m-files
;; (autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))


;; if you have the win32 version of octave
;; (add-hook 'inferior-octave-mode-hook
;;           '(lambda ()
;;              (setq inferior-octave-program
;;                    "~/bin/octave")))

(setq inferior-octave-program
      "~/bin/octave")


(provide 'setup-octave)

