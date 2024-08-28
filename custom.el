(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-command "latex -synctex=1")
 '(connection-local-criteria-alist
   '(((:application tramp :protocol "flatpak")
      tramp-flatpak-connection-local-default-profile)
     ((:application tramp :protocol "kubernetes")
      tramp-kubernetes-connection-local-default-profile)
     ((:application eshell) eshell-connection-default-profile)
     ((:application tramp)
      tramp-connection-local-default-system-profile
      tramp-connection-local-default-shell-profile)))
 '(connection-local-profile-alist
   '((tramp-flatpak-connection-local-default-profile
      (tramp-remote-path "/app/bin" tramp-default-remote-path "/bin"
                         "/usr/bin" "/sbin" "/usr/sbin"
                         "/usr/local/bin" "/usr/local/sbin"
                         "/local/bin" "/local/freeware/bin"
                         "/local/gnu/bin" "/usr/freeware/bin"
                         "/usr/pkg/bin" "/usr/contrib/bin" "/opt/bin"
                         "/opt/sbin" "/opt/local/bin"))
     (tramp-kubernetes-connection-local-default-profile
      (tramp-config-check . tramp-kubernetes--current-context-data)
      (tramp-extra-expand-args 97
                               (tramp-kubernetes--container
                                (car tramp-current-connection))
                               104
                               (tramp-kubernetes--pod
                                (car tramp-current-connection))
                               120
                               (tramp-kubernetes--context-namespace
                                (car tramp-current-connection))))
     (eshell-connection-default-profile (eshell-path-env-list))
     (tramp-connection-local-darwin-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o"
                                        "pid,uid,user,gid,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                        "-o" "state=abcde" "-o"
                                        "ppid,pgid,sess,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etime,pcpu,pmem,args")
      (tramp-process-attributes-ps-format (pid . number)
                                          (euid . number)
                                          (user . string)
                                          (egid . number) (comm . 52)
                                          (state . 5) (ppid . number)
                                          (pgrp . number)
                                          (sess . number)
                                          (ttname . string)
                                          (tpgid . number)
                                          (minflt . number)
                                          (majflt . number)
                                          (time . tramp-ps-time)
                                          (pri . number)
                                          (nice . number)
                                          (vsize . number)
                                          (rss . number)
                                          (etime . tramp-ps-time)
                                          (pcpu . number)
                                          (pmem . number) (args)))
     (tramp-connection-local-busybox-ps-profile
      (tramp-process-attributes-ps-args "-o"
                                        "pid,user,group,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                        "-o" "stat=abcde" "-o"
                                        "ppid,pgid,tty,time,nice,etime,args")
      (tramp-process-attributes-ps-format (pid . number)
                                          (user . string)
                                          (group . string) (comm . 52)
                                          (state . 5) (ppid . number)
                                          (pgrp . number)
                                          (ttname . string)
                                          (time . tramp-ps-time)
                                          (nice . number)
                                          (etime . tramp-ps-time)
                                          (args)))
     (tramp-connection-local-bsd-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o"
                                        "pid,euid,user,egid,egroup,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                        "-o"
                                        "state,ppid,pgid,sid,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etimes,pcpu,pmem,args")
      (tramp-process-attributes-ps-format (pid . number)
                                          (euid . number)
                                          (user . string)
                                          (egid . number)
                                          (group . string) (comm . 52)
                                          (state . string)
                                          (ppid . number)
                                          (pgrp . number)
                                          (sess . number)
                                          (ttname . string)
                                          (tpgid . number)
                                          (minflt . number)
                                          (majflt . number)
                                          (time . tramp-ps-time)
                                          (pri . number)
                                          (nice . number)
                                          (vsize . number)
                                          (rss . number)
                                          (etime . number)
                                          (pcpu . number)
                                          (pmem . number) (args)))
     (tramp-connection-local-default-shell-profile
      (shell-file-name . "/bin/sh") (shell-command-switch . "-c"))
     (tramp-connection-local-default-system-profile
      (path-separator . ":") (null-device . "/dev/null"))))
 '(custom-safe-themes
   '("aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8"
     "c335adbb7d7cb79bc34de77a16e12d28e6b927115b992bccc109fb752a365c72"
     "6f96a9ece5fdd0d3e04daea6aa63e13be26b48717820aa7b5889c602764cf23a"
     "013728cb445c73763d13e39c0e3fd52c06eefe3fbd173a766bfd29c6d040f100"
     "34cf3305b35e3a8132a0b1bdf2c67623bc2cb05b125f8d7d26bd51fd16d547ec"
     "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184"
     "9d29a302302cce971d988eb51bd17c1d2be6cd68305710446f658958c0640f68"
     "c5878086e65614424a84ad5c758b07e9edcf4c513e08a1c5b1533f313d1b17f1"
     "7c28419e963b04bf7ad14f3d8f6655c078de75e4944843ef9522dbecfcd8717d"
     "e546dc8090d2cd801fdba60b14795faeeb05a4f458fc65e7f83303756931b48a"
     "f64189544da6f16bab285747d04a92bd57c7e7813d8c24c30f382f087d460a33"
     "93011fe35859772a6766df8a4be817add8bfe105246173206478a0706f88b33d"
     "6f1f6a1a3cff62cc860ad6e787151b9b8599f4471d40ed746ea2819fcd184e1a"
     "d6b934330450d9de1112cbb7617eaf929244d192c4ffb1b9e6b63ad574784aad"
     "56044c5a9cc45b6ec45c0eb28df100d3f0a576f18eef33ff8ff5d32bac2d9700"
     "b9761a2e568bee658e0ff723dd620d844172943eb5ec4053e2b199c59e0bcc22"
     "eab123a5ed21463c780e17fc44f9ffc3e501655b966729a2d5a2072832abd3ac"
     "7fd8b914e340283c189980cd1883dbdef67080ad1a3a9cc3df864ca53bdc89cf"
     "2035a16494e06636134de6d572ec47c30e26c3447eafeb6d3a9e8aee73732396"
     "8a379e7ac3a57e64de672dd744d4730b3bdb88ae328e8106f95cd81cbd44e0b6"
     "dccf4a8f1aaf5f24d2ab63af1aa75fd9d535c83377f8e26380162e888be0c6a9"
     "573182354a59c672f89b8a7ea98ef020a54ff3fc93cf67bbfae4aa5bd41fdd5d"
     "e4a702e262c3e3501dfe25091621fe12cd63c7845221687e36a79e17cf3a67e0"
     "dd4582661a1c6b865a33b89312c97a13a3885dc95992e2e5fc57456b4c545176"
     "88f7ee5594021c60a4a6a1c275614103de8c1435d6d08cc58882f920e0cec65e"
     "e9d47d6d41e42a8313c81995a60b2af6588e9f01a1cf19ca42669a7ffd5c2fde"
     "7a424478cb77a96af2c0f50cfb4e2a88647b3ccca225f8c650ed45b7f50d9525"
     "c2aeb1bd4aa80f1e4f95746bda040aafb78b1808de07d340007ba898efa484f5"
     "fe2539ccf78f28c519541e37dc77115c6c7c2efcec18b970b16e4a4d2cd9891d"
     "234dbb732ef054b109a9e5ee5b499632c63cc24f7c2383a849815dacc1727cb6"
     "7a7b1d475b42c1a0b61f3b1d1225dd249ffa1abb1b7f726aec59ac7ca3bf4dae"
     "da186cce19b5aed3f6a2316845583dbee76aea9255ea0da857d1c058ff003546"
     "1704976a1797342a1b4ea7a75bdbb3be1569f4619134341bd5a4c1cfb16abad4"
     "5185a285365a768a30ac274bdbc4437e7fd2fbe3107a1b0f2b60e900181905e0"
     "79586dc4eb374231af28bbc36ba0880ed8e270249b07f814b0e6555bdcb71fab"
     "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a"
     "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088"
     "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476"
     "333958c446e920f5c350c4b4016908c130c3b46d590af91e1e7e2a0611f1e8c5"
     "f7fed1aadf1967523c120c4c82ea48442a51ac65074ba544a5aefc5af490893b"
     "8426618fcc55f670f45b04f146933ae23caa1faad603a380e7a348660fd225ab"
     "171d1ae90e46978eb9c342be6658d937a83aaa45997b1d7af7657546cae5985b"
     "0feb7052df6cfc1733c1087d3876c26c66410e5f1337b039be44cb406b6187c6"
     "27a1dd6378f3782a593cc83e108a35c2b93e5ecc3bd9057313e1d88462701fcd"
     "ae4aa4bf7418af9a2a8a0e9d172895a2f25fe725790fed3f259bba53159a8264"
     "25f81851315ee76bd43cb551767861d24d2450d07e8e3ca412d09adbe28f5f98"
     "6b234feec8db588ad5ec2a9d9d7b935f7a155104b25ccfb94d921c45a2ff7d22"
     "9b01a258b57067426cc3c8155330b0381ae0d8dd41d5345b5eddac69f40d409b"
     "e074be1c799b509f52870ee596a5977b519f6d269455b84ed998666cf6fc802a"
     "3e3a1caddeee4a73789ff10ba90b8394f4cd3f3788892577d7ded188e05d78f4"
     "7f791f743870983b9bb90c8285e1e0ba1bf1ea6e9c9a02c60335899ba20f3c94"
     "229c5cf9c9bd4012be621d271320036c69a14758f70e60385e87880b46d60780"
     "4daff0f7fb02c7a4d5766a6a3e0931474e7c4fd7da58687899485837d6943b78"
     "6bacece4cf10ea7dd5eae5bfc1019888f0cb62059ff905f37b33eec145a6a430"
     "2f5034120826e047160aca97575c21e692e7ec7ec23c53d9832006fbeb7a91d8"
     "bc836bf29eab22d7e5b4c142d201bcce351806b7c1f94955ccafab8ce5b20208"
     "615123f602c56139c8170c153208406bf467804785007cdc11ba73d18c3a248b"
     "51956e440cec75ba7e4cff6c79f4f8c884a50b220e78e5e05145386f5b381f7b"
     "fa3bdd59ea708164e7821574822ab82a3c51e262d419df941f26d64d015c90ee"
     "2cdc13ef8c76a22daa0f46370011f54e79bae00d5736340a5ddfe656a767fddf"
     "d261bb8f66be37752791a67f03dd24361592ce141b32d83bcbe63ec1c738b087"
     "66aea5b7326cf4117d63c6694822deeca10a03b98135aaaddb40af99430ea237"
     "6bc387a588201caf31151205e4e468f382ecc0b888bac98b2b525006f7cb3307"
     "669e02142a56f63861288cc585bee81643ded48a19e36bfdf02b66d745bcc626"
     "32fd809c28baa5813b6ca639e736946579159098d7768af6c68d78ffa32063f4"
     "3fa65d60abd566321f93d1354f91dedae8ab795bb688a421c69e2e0f7fa3c9bc"
     "1897b97f63e91a792e8540c06402f29d5edcbfb0aafd64b1b14270663d6868ee"
     "a63355b90843b228925ce8b96f88c587087c3ee4f428838716505fd01cf741c8"
     "420689cc31d01fe04b8e3adef87b8838ff52faa169e69ca4e863143ae9f3a9f9"
     "bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163"
     "e7666261f46e2f4f42fd1f9aa1875bdb81d17cc7a121533cad3e0d724f12faf2"
     "2d392972cbe692ee4ac61dc79907af65051450caf690a8c4d36eb40c1857ba7d"
     "66d53738cc824d0bc5b703276975581b8de2b903d6ce366cd62207b5dd6d3d13"
     "018c8326bced5102b4c1b84e1739ba3c7602019c645875459f5e6dfc6b9d9437"
     "cd736a63aa586be066d5a1f0e51179239fe70e16a9f18991f6f5d99732cabb32"
     "6d589ac0e52375d311afaa745205abb6ccb3b21f6ba037104d71111e7e76a3fc"
     "a8c210aa94c4eae642a34aaf1c5c0552855dfca2153fa6dd23f3031ce19453d4"
     "fd944f09d4d0c4d4a3c82bd7b3360f17e3ada8adf29f28199d09308ba01cc092"
     "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024"
     "43c808b039893c885bdeec885b4f7572141bd9392da7f0bd8d8346e02b2ec8da"
     "49ec957b508c7d64708b40b0273697a84d3fee4f15dd9fc4a9588016adee3dad"
     "d61f6c49e5db58533d4543e33203fd1c41a316eddb0b18a44e0ce428da86ef98"
     "d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9"
     "10461a3c8ca61c52dfbbdedd974319b7f7fd720b091996481c8fb1dded6c6116"
     "fe666e5ac37c2dfcf80074e88b9252c71a22b6f5d2f566df9a7aa4f9bea55ef8"
     "b59d7adea7873d58160d368d42828e7ac670340f11f36f67fa8071dbf957236a"
     "64ca5a1381fa96cb86fd6c6b4d75b66dc9c4e0fc1288ee7d914ab8d2638e23a9"
     "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26"
     "2642a1b7f53b9bb34c7f1e032d2098c852811ec2881eec2dc8cc07be004e45a0"
     "251348dcb797a6ea63bbfe3be4951728e085ac08eee83def071e4d2e3211acc3"
     "946e871c780b159c4bb9f580537e5d2f7dba1411143194447604ecbaf01bd90c"
     "2540689fd0bc5d74c4682764ff6c94057ba8061a98be5dd21116bf7bf301acfb"
     "d8dc153c58354d612b2576fea87fe676a3a5d43bcc71170c62ddde4a1ad9e1fb"
     default))
 '(ensime-sem-high-faces
   '((var :foreground "#000000" :underline (:style wave :color "yellow"))
     (val :foreground "#000000")
     (varField :foreground "#600e7a" :slant italic)
     (valField :foreground "#600e7a" :slant italic)
     (functionCall :foreground "#000000" :slant italic)
     (implicitConversion :underline (:color "#c0c0c0"))
     (implicitParams :underline (:color "#c0c0c0"))
     (operator :foreground "#000080") (param :foreground "#000000")
     (class :foreground "#20999d")
     (trait :foreground "#20999d" :slant italic)
     (object :foreground "#5974ab" :slant italic)
     (package :foreground "#000000")
     (deprecated :strike-through "#000000")))
 '(helm-completion-style 'emacs)
 '(helm-minibuffer-history-key "M-p")
 '(hl-sexp-background-color "#efebe9")
 '(ignored-local-variable-values
   '((eval progn (make-local-variable 'process-environment)
           (setq process-environment
                 (copy-sequence process-environment)))))
 '(markdown-command "pandoc")
 '(openwith-mode t)
 '(org-agenda-files (list org-directory))
 '(org-default-notes-file (joindirs org-directory "agenda.org"))
 '(org-directory "~/Dropbox/org")
 '(package-selected-packages
   '(abyss-theme ac-octave ace-window adaptive-wrap adoc-mode
                 afternoon-theme ag aio airline-themes all-the-icons
                 all-the-icons-dired alsamixer ample-theme anaphora
                 angular-snippets annalist ansible ansible-doc
                 ansible-vault anti-zenburn-theme apiwrap
                 apt-sources-list async atom-dark-theme
                 atom-one-dark-theme atomic-chrome auctex
                 auto-complete avy bash-completion bind-key blacken
                 blamer browse-kill-ring bui buster-snippets butler
                 c-mode calfw calfw-gcal calfw-ical calfw-org
                 calibredb cdlatex cfrs cider-eval-sexp-fu cmake-ide
                 cmake-mode color-theme-github
                 color-theme-sanityinc-tomorrow color-theme-solarized
                 common-lisp-snippets company company-ansible
                 company-box company-emacs-eclim company-lsp
                 company-shell company-tern company-terraform
                 company-web compat concurrent conda crontab-mode csv
                 csv-mode ctable cyberpunk-theme dap-mode
                 darcula-theme darkroom dash dash-docs dash-functional
                 deferred diff-hl diminish dired-atool dired-collapse
                 dired-details dired-du dired-explorer dired-fdclone
                 dired-hacks-utils dired-imenu dired-k dired-narrow
                 dired-quick-sort dired-rsync dired-sidebar
                 dired-single dired-subtree django-manage
                 django-snippets django-theme djangonaut docker
                 docker-api docker-cli docker-compose-mode
                 dockerfile-mode doom doom-modeline doom-themes
                 dumb-jump ecb ecb-snapshot eclim edit-indirect
                 editorconfig egg ein ein-mumamo el-get elpy elpygen
                 emacsql emacsql-sqlite emmet-mode epc epl ess
                 eval-sexp-fu evil evil-collection evil-mc
                 evil-nerd-commenter ewal ewal-doom-themes
                 exec-path-from-shell expand-region eyebrowse f
                 fancy-battery fantom-theme fill-column-indicator flx
                 flx-ido flycheck flycheck-plantuml flycheck-yamllint
                 flymake-eslint flymake-ruff flymake-shellcheck
                 flymake-yamllint flymd folding frame-local gh gh-md
                 ghub ghub+ git-commit git-wip-timemachine gited
                 gnu-elpa-keyring-update goto-chg gradle-mode
                 grip-mode groovy-imports groovy-mode haskell-mode
                 hcl-mode helm helm-ack helm-ag helm-core
                 helm-dictionary helm-directory helm-lsp helm-make
                 helm-projectile helm-swoop highlight-indent-guides
                 highlight-indentation ht hydra ibuffer-projectile
                 idea-darkula-theme image-dired+ imenu-list indium
                 inf-groovy intellij-theme isend-mode isortify ivy
                 java-snippets jdee jedi jedi-core jenkins
                 jenkins-watch jetbrains-darcula-theme jinja2-mode
                 jquery-doc js-auto-beautify js-comint js-import
                 js2-mode js2-refactor json-mode json-process-client
                 json-snatcher jump-to-line jupyter k8s-mode kv
                 langtool levenshtein log4e logito lsp-imenu lsp-ivy
                 lsp-java lsp-metals lsp-mode lsp-pyright lsp-treemacs
                 lsp-ui lv magit-find-file magit-gh-pulls magit-popup
                 magit-svn magit-todos makefile-executor markdown-mode
                 markdown-mode+ markdown-preview-eww
                 markdown-preview-mode markdown-toc markup-faces
                 marshal material-theme maven-test-mode memoize
                 mermaid-mode metalheart-theme mic-paren mkdown
                 mmm-mode modus-themes moe-theme move-text multi-term
                 multi-web-mode multiple-cursors mvn mvn-help neotree
                 nerd-icons nerd-icons-dired nerd-icons-ibuffer
                 ng2-mode nginx-mode ob-async ob-chatgpt-shell
                 ob-ipython ob-mermaid ob-mongo ob-sql-mode openwith
                 org org-chef org-contrib org-ml org-roam
                 org-special-block-extras org-sql org-tree-slide
                 ox-asciidoc ox-gfm ox-rst paredit pcache pcre2el
                 pdf-tools persp-projectile pfuture pip-requirements
                 pippel pkg-info plantuml-mode poly-ansible polymode
                 pony-mode popup popup-imenu posframe powerline
                 pretty-speedbar projectile projectile-extras
                 projectile-speedbar protobuf-mode pungi py-autopep8
                 py-isort py-yapf pycoverage pyenv-mode-auto pyimport
                 pylint pymacs python-django python-environment
                 python-mode python-pytest python-x pyvenv queue
                 rainbow-delimiters realgud realgud-jdb realgud-pry
                 realgud-rdb2 reformatter req-package request rtags
                 ruff-format rust-mode s scala-mode sclang-extensions
                 sclang-snippets seq shrink-path shut-up simple-httpd
                 smex smex smooth-scrolling spacemacs-theme sphinx-doc
                 sphinx-mode spinner sqlformat sr-speedbar ssass-mode
                 subatomic-theme swiper swoop system-packages tagedit
                 terraform-mode tidal tj3-mode toml toml-mode treemacs
                 treemacs-all-the-icons treemacs-evil
                 treemacs-icons-dired treemacs-magit
                 treemacs-projectile treepy typescript-mode undo-tree
                 use-package use-package-ensure-system-package
                 virtualenv visual-fill-column visual-regexp vmd-mode
                 vue-html-mode vue-mode w3m web-beautify
                 web-completion-data web-mode web-mode-edit-element
                 web-server wfnames wgrep wgrep-ack wgrep-ag
                 wgrep-helm which-key with-editor with-simulated-input
                 wttrin xref-js2 xterm-color yafolding yaml yaml-imenu
                 yaml-mode yapfify yasnippet
                 yasnippet-classic-snippets yasnippet-snippets zmq
                 zzz-to-char))
 '(safe-local-variable-values
   '((vc-prepare-patches-separately)
     (diff-add-log-use-relative-names . t)
     (vc-git-annotate-switches . "-w")
     (eval progn (make-local-variable 'process-environment)
           (setq process-environment
                 (copy-sequence process-environment)))
     (setq projectile-switch-project-action
           'venv-projectile-auto-workon)))
 '(warning-suppress-log-types '((comp) (use-package) (use-package) (use-package)))
 '(warning-suppress-types '((use-package) (use-package) (use-package)))
 '(yas-prompt-functions
   '(yas-completing-prompt yas-dropdown-prompt yas-maybe-ido-prompt
                           yas-no-prompt)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
