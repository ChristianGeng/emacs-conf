(use-package js2-mode
  :ensure t
  :mode
  ("\\.js\\'")
  :config

  ;; Better imenu
  (add-hook 'js2-mode-hook #'js2-imenu-extras-mode))

(use-package js2-refactor
  :straight t
  :after (js2-mode hydra)
  :hook
  (js2-mode . js2-refactor-mode)
  :config
  (js2r-add-keybindings-with-prefix "C-c C-r")
  (define-key js2-mode-map (kbd "C-k") #'js2r-kill)
  ;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
  ;; unbind it.
  (define-key js-mode-map (kbd "M-.") nil)
  ;; Hydra / js2
  (defhydra js2-refactor-hydra (:color blue :hint nil)
    "
      Javascript

  ^Functions^                    ^Variables^               ^Buffer^                      ^sexp^               ^Debugging^
  ------------------------------------------------------------------------------------------------------------------------------
  _lp_: Localize Parameter      _ev_: Extract variable   _wi_: Wrap buffer in IIFE    _k_:  js2 kill      _lt_: log this
  _ef_: Extract function        _iv_: Inline variable    _ig_: Inject global in IIFE  _ss_: split string  _dt_: debug this
  _ip_: Introduce parameter     _rv_: Rename variable    _ee_: Expand node at point   _sl_: forward slurp
  _em_: Extract method          _vt_: Var to this        _cc_: Contract node at point _ba_: forward barf
  _ao_: Arguments to object     _sv_: Split var decl.    _uw_: unwrap
  _tf_: Toggle fun exp and decl _ag_: Add var to globals
  _ta_: Toggle fun expr and =>  _ti_: Ternary to if
"
    ("ee" js2r-expand-node-at-point)
    ("cc" js2r-contract-node-at-point)
    ("ef" js2r-extract-function)
    ("em" js2r-extract-method)
    ("tf" js2r-toggle-function-expression-and-declaration)
    ("ta" js2r-toggle-arrow-function-and-expression)
    ("ip" js2r-introduce-parameter)
    ("lp" js2r-localize-parameter)
    ("wi" js2r-wrap-buffer-in-iife)
    ("ig" js2r-inject-global-in-iife)
    ("ag" js2r-add-to-globals-annotation)
    ("ev" js2r-extract-var)
    ("iv" js2r-inline-var)
    ("rv" js2r-rename-var)
    ("vt" js2r-var-to-this)
    ("ao" js2r-arguments-to-object)
    ("ti" js2r-ternary-to-if)
    ("sv" js2r-split-var-declaration)
    ("ss" js2r-split-string)
    ("uw" js2r-unwrap)
    ("lt" js2r-log-this)
    ("dt" js2r-debug-this)
    ("sl" js2r-forward-slurp)
    ("ba" js2r-forward-barf)
    ("k" js2r-kill)
    ("q" nil))
  )

(use-package xref-js2
  :ensure t
  :after js2-mode
  :config

  (add-hook 'js2-mode-hook
            (lambda ()
              (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t))))

(use-package indium
  :straight t
  :diminish indium-interaction-mode
  :init
  (setq indium-update-script-on-save t))
;; (setq indium-workspace-file (no-littering-expand-var-file-name "indium-workspaces.el"))))


(use-package gulp-task-runner
  :commands (gulp))

(use-package js-auto-beautify
  :ensure t)

(use-package js-import
  :ensure t)

;; (use-package company-tern
;;   :ensure t
;;   :after (company tern xref-js2)
;;   :hook
;;   (js2-mode . tern-mode)
;;   (js2-mode . company-mode)

;;   :config
;;   ;; (add-to-list 'company-backends 'company-tern)

;;   ;; Disable completion keybindings, as we use xref-js2 instead
;;   (define-key tern-mode-keymap (kbd "M-.") nil)
;;   (define-key tern-mode-keymap (kbd "M-,") nil)

;;   (setq company-tern-property-marker " <p>"
;;         company-tern-property-marker nil
;;         company-tern-meta-as-single-line t
;;         company-tooltip-align-annotations t))


;; ;; https://emacs.cafe/emacs/javascript/setup/2017/04/23/emacs-setup-javascript.html
;; ;; M-. Jump to definition
;; ;; M-? Jump to references
;; ;; M-, Pop back to where M-. was last invoked.
;; ;;  C-k kills up to the end of the line, but always keeping the AST valid.

;; ;; (require 'js2-mode)
;; (require 'company)
;; (require 'company-tern)

;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; ;; Better imenu
;; (add-hook 'js2-mode-hook #'js2-imenu-extras-mode)


;; (require 'js2-refactor)
;; (require 'xref-js2)

;; (add-hook 'js2-mode-hook #'js2-refactor-mode)
;; (js2r-add-keybindings-with-prefix "C-c C-r")

;; ;; One minor tweak that I really couldn’t live without is binding js2r-kill
;; ;; to C-k in JS buffers:
;; ;; This command is very similar to killing in paredit: It kills up to the end of the line, but always keeping the AST valid.
;; (define-key js2-mode-map (kbd "C-k") #'js2r-kill)


;; ;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; ;; unbind it.
;; (define-key js-mode-map (kbd "M-.") nil)


;; (add-hook 'js2-mode-hook (lambda ()
;;   (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))




;; (add-to-list 'company-backends 'company-tern)
;; (add-hook 'js2-mode-hook (lambda ()
;;                            (tern-mode)
;;                            (company-mode)))

;; ;; Disable completion keybindings, as we use xref-js2 instead
;; (define-key tern-mode-keymap (kbd "M-.") nil)
;; (define-key tern-mode-keymap (kbd "M-,") nil)

;; (add-hook 'js2-mode-hook (lambda ()
;;   (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

;; ;; Use lambda for anonymous functions
;; (font-lock-add-keywords
;;  'js2-mode `(("\\(function\\) *("
;;               (0 (progn (compose-region (match-beginning 1)
;;                                         (match-end 1) "\u0192")
;;                         nil)))))

;; ;; Use right arrow for return in one-line functions
;; (font-lock-add-keywords
;;  'js2-mode `(("function *([^)]*) *{ *\\(return\\) "
;;               (0 (progn (compose-region (match-beginning 1)
;;                                         (match-end 1) "\u2190")
;;                         nil)))))

(provide 'setup-js2-mode)
