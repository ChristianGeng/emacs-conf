
;;; name.el --- summary -*- lexical-binding: t -*-

;; Author: christian
;; Maintainer: christian
;; Version: version
;; Package-Requires: (dependencies)
;; Homepage: homepage
;; Keywords: keywords


;; This file is not part of GNU Emacs

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.


;;; Commentary:

;; commentary

;; Refs
;; https://emacs.stackexchange.com/questions/15093/how-to-add-an-item-to-the-menu-bar

;;; Code:

(provide 'setup-user-menu)

(require 'easymenu)

(defvar menuitem1
  ["Set mark!" (set-mark-command nil)]) ; Boring alias for C-SPC

(defvar menuitem2
  ["Show fireworks!" (lambda () (interactive) (message-box "Fun!"))]) ; Making function interactive

;;Menu with submenus.
(defvar menuitem3
  '("Submenu" ; Note that list must be quoted, otherwise it would be treated as function.
    ("SubSubmenu"
     ["This will do wonders" (lambda () (interactive) (beep)) [:help "Welcome to the banana"]]
     ["And this will do nothing" (lambda () (interactive))])
    ("SubSubmenu2"
     ["Boring alias" (replace-string " " " banana ")])))


;; Gdrive Entry Menu
;; TODO: Get rid of this
(defun extract-name (x)
  """Extract name from entry in file"""
    (nth 0 (split-string (nth 1 (split-string x ":")) "@"))
    )

;; first version with hardcoding gdrive locations
(defvar menuitem-static
  '("gdrive-submenu"
     ["gdrive-jedhoo-dired2" (dired "/gdrive:irgendwas@gmail.com:/")]
     ["gdrive-jedhoo-dired2" (dired "/gdrive:auchirgendwas@gmail.com:/")]
    )
  )

(defvar gdrive-dired-locations
  (cons
   "gdrive dired"
    (mapcar  (lambda (x)
           (vector
            (concat "Gdrive " (extract-name x))
            `(dired, (concat x))
            )
           )
         (read-lines "~/Dropbox/org/gdrivelocations.txt" ))
    )
  )

;; (mapcar 'print  (read-lines "~/Dropbox/org/gdrivelocations.txt" ))
;; (mapcar 'extract-name   (read-lines "~/Dropbox/org/gdrivelocations.txt" ))
;; This is a dynamic menu :
;;  https://kitchingroup.cheme.cmu.edu/blog/2014/08/20/Creating-a-dynamic-menu-for-Emacs/

;; (easy-menu-define jrk-menu global-map "MyMenu"
;;   '("My Files"))

(defun get-menu ()
  (easy-menu-create-menu
   "all-files"
   (mapcar (lambda (x)
             (vector (file-name-nondirectory x)
                     `(lambda () (interactive) (find-file ,x) t)
                     ))
           (f-glob "*"))))

;; do not add it; TOOD: Subsume to my menu
;; (easy-menu-add-item jrk-menu '() (get-menu))


(easy-menu-define test-menu nil "Menu used as an example."
  `((concat user-login-name "-menu")
    ,gdrive-dired-locations
    ["gnome-control-center" (lambda () (interactive) (shell-command "env XDG_CURRENT_DESKTOP=GNOME gnome-control-center &"))]

;;    ,menuitem1
;;    ,menuitem2
;;    ,menuitem3
;;    ["Items can also be defined here" (lambda () (interactive) (message-box "It's simple!"))]
    ))

;;; Insert menu after options menu, in global menu bar.
(define-key-after (lookup-key global-map [menu-bar])
  [mymenu] ; shortcut for our menu
  (cons (concat user-login-name "-menu") test-menu) 'options) ; Our menu's name in cons.
(provide 'setup-groovy)



;; env XDG_CURRENT_DESKTOP=GNOME gnome-control-center



;;; setup-user-menu ends here
