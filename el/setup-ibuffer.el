;; nearly all of this is the default layout
(setq ibuffer-formats 
      '((mark modified read-only " "
              (name 40 40 :left :elide) ; change: 30s were originally 18s
              " "
              (size 9 -1 :right)
              " "
              (mode 16 16 :left :elide)
              " " filename-and-process)
        (mark " "
              (name 16 -1)
              " " filename)))
              
 (provide 'setup-ibuffer)
