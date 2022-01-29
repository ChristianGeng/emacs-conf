;;; setup-supercollider.el --- summary -*- lexical-binding: t -*-

;; Author: CGeng
;; Maintainer: CGeng
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

;; Das Packge gibt es nicht in melpa,
;; darum muss es hier heruntergeladen werden
;; https://github.com/supercollider/scel
;; ausserdem: cd scel; cmake .

;; commentary

;;; Code:

(message "Add SuperCollider")

;; Doc has improved a lot and can be found her:
;; https://github.com/supercollider/scel
;; Innstall package via Quarks:
;; This I did from the IDE
;; Quarks.install("https://github.com/supercollider/scel");
;; Also from he IDE:
;; Quarks.folder.postln;
;; /home/christian/.local/share/SuperCollider/downloaded-quarks
;;
;; This needs to be added to the load path like this:
(add-to-list 'load-path "/home/christian/.local/share/SuperCollider/downloaded-quarks")
(require 'sclang)

;; Basic Interaction:
;; In a buffer with a .scd extension
;; sclang-start
;;
;; Evaluation:
;;C-c for line
;; and more importantly:
;; C-d for region
;; and function:
;; C-M x
;; Hello World:
;; Get going:
;; s = Server.local;
;; s.boot;
;; SynthDef("mysynth", { Out.ar(0, PinkNoise.ar(0.25)) }).play(s);
;;
;; Leavig:
;;
;; s.freeAll;
;; finally:
;; s.stop;
;; s.quit;
;; sclang-stop


;; Quark Packages:
;; https://github.com/supercollider-quarks/quarks
;; https://github.com/supercollider-quarks/quarks/blob/master/directory.txt


;;; setup-supercollider.el ends here

;; this needs to be cloned to the el directory using git clone git@github.com:supercollider/scel.git
;; in addition you need to run cmake . in the scel directory
;; (add-to-list 'load-path "~/.emacs.d/el/scel/el/")
;; (require 'sclang)
(require 'w3m)
;; (sclang-start)
;;(sclang-server-boot)

;; (setenv "PATH" (concat (getenv "PATH") ":/Applications/SuperCollider:/Applications/SuperCollider/SuperCollider.app/Contents/MacOS"))
;; (setq exec-path (append exec-path '("/Applications/SuperCollider"  "/Applications/SuperCollider/SuperCollider.app/Contents/MacOS" )))

;; /usr/share/SuperCollider/SCClassLibrary/

(provide 'setup-supercollider)
;;; setup-supercollider ends here
