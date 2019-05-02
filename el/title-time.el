;;; title-time.el --- like display-time but in the title-bar

;; Copyright (C) 2001, 2002  Free Software Foundation, Inc.

;; Author: Kahlil (Kal) HODGSON <dorge@tpg.com.au>
;; Keywords: convenience

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; Just like display-time except that time, date, mail and appointment
;; notification are presented in the title-bar rather than the
;; mode-line.  This is useful if your mode-line gets a bit crowded.
;; Implemented by simply moving the string generated by `display-time'
;; from the model-line to the title-bar.

;;; Installation:

;; Place this file somewhere in your load-path and

;; (require 'title-time)

;; somewhere in you .emacs file.  You may also want to set the
;; following variables

;; (setq display-time-day-and-date t)
;; (setq display-time-interval 30)
;; (setq display-time-24hr-format nil)
;; (setq display-time-string-forms
;;       (quote
;;        ((if (and (not display-time-format)
;;		 display-time-day-and-date)
;;	    (format-time-string "%a %b %e   " now) "  ")
;;	(format-time-string
;;	 (or display-time-format
;;	     (if display-time-24hr-format "%H:%M" "%-I:%M%p")) now)
;;	"    Load" load "    " (if mail " Mail" "")))
;;       )
;;
;;; Code:

(require 'time)

(defvar title-time-mode t
  "This is set to t iff we are displaying the current time in the title bar.")

(defun title-time-set ()
  "Set `frame-title-format' to the local system name followed by date,
time, and load information (as per `display-time-string-forms') and perhaps
followed by an appointment notification."
  (setq frame-title-format
	(concat  "Emacs"
		 "    "
		 (car (split-string (upcase (user-login-name)) "\\."))
		 "    "
		 display-time-string
		 )))

;; Hier sollte man noch das Datum dazupacken: 
;; ;; (setq display-time-mode t)
;;      (setq frame-title-format
;;            '(buffer-file-name "%f"
;;                               (dired-directory dired-directory "%b")
;;                               ))

(defun title-time-update ()
  "Update the time display in the title-bar.
Skips inferior frames, that is, those without a minibuffer (eg. speedbar). "
  (interactive)

  ;; remove time display from the mode line
  (delq 'display-time-string global-mode-string)
  (delq 'appt-mode-string global-mode-string)

  (let ((start-frame (selected-frame)))
    (save-excursion
      (save-window-excursion
	(let ((my-frame-list (frame-list))
	      (my-frame nil))
	  (while (setq my-frame (car my-frame-list))
	    (when (frame-parameter my-frame 'minibuffer)
	      (make-variable-frame-local 'frame-title-format)
	      (select-frame my-frame)
	      (title-time-set))
	    (setq my-frame-list (cdr my-frame-list))))))
	(select-frame start-frame)))

(add-hook 'display-time-hook #'title-time-update)

(display-time-mode 1)

(provide 'title-time)
;;; title-time.el ends here
