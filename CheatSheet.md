# My Emacs Bag of Memos (things I tend to forget)

## Basic Navigation

C-p Previous line,
C-n next line,

C-b Backward
C-f  Forward

C-v	Move forward one screenful
M-v	Move backward one screenful

M-< , beginning of file
M-> , end of file


C-l C-l put current pos to top of file

C-j Insert New line

## [moving by defun (emacs manual)](https://www.gnu.org/software/emacs/manual/html_node/emacs/Moving-by-Defuns.html)

* C-M-a     Move to beginning of current or preceding defun (beginning-of-defun).
* C-M-e     Move to end of current or following defun (end-of-defun).
* C-M-h     Put region around whole current or following defun (mark-defun).

## Navigation between Windows , switching
* C-x 0 - delete current "split"
* S-{right,left,up,down} - move windows  windmove-right|left ....

Another option: https://github.com/abo-abo/avy

## Getting help
C-h ? what kinds of help

C-h r emacs book
C-h f	Describe a function
C-h v	Describe variable
C-h d debugging
C-h b (or M-x describe-bindings) will sh
C-h k (M-x describe-key) to show what command is bound to a
C-x C-h show keybindings

## Org-Mode


### Clocking

* C-c C-x C-d display: Aufsummieren
* C-c C-x C-i clock in
* C-c C-x C-o clock out
* C-c C-x C-j go to clocking task
* C-c C-x C-q forget current clock info
* C-c C-x C-x Restart latest clock
* C-u C-c C-x C-x Clock in on task to select
* M-S-Up and M-S-Down : Einstellen der Uhrzeit


### Capturing

Das ist praktisch um sich beispielsweise Code-Stellen zu merken.

* org-capture C-c c


### Misc

* M-x org-insert-structure-table: Code Cells einfügen etc. [[https://emacs.stackexchange.com/questions/40571/how-to-set-a-short-cut-for-begin-src-end-src][see here]]





##  Auto-Fill-Mode
M-x auto-fill-mode
M-x set-fill-column

## [realgud]("https://github.com/realgud/realgud")

* [ipdb-Notes](https://github.com/realgud/realgud/wiki/ipdb-notes)
* M-x load-library realgud
* M-x realgud:pdb test.py

# Functions:
* show-file-name (cglispfunctions.el)
* flush-lines with regex `^\s-*$` - remove all blank lines
# dired

## Rename many:
* wdired-change-to-wdired-mode
* wdired-finish-edit

# Edit multiple files / Refactoring
https://emacs.stackexchange.com/questions/7595/how-do-i-refactor-across-a-project-in-emacs-change-method-name-everywhere

* The approach using [helm-ag](https://github.com/syohex/emacs-helm-ag) requires the silver searcher. helm-swoop will also come in handy
 In case any of the others don't work use the wgrep approach.

*  wgrep way - parallells wdired
   1. Run M-x rgrep.
   2. *M-x wgrep-change-to-wgrep-mode*. This buffer is now editable. Any changes you make here will be reflected in the files themselves.
   3. Run a replace-regexp or a query-replace-regexp in this buffer, to do the refactoring.
   4. Finish your edits with M-x wgrep-save-all-buffers and M-x wgrep-finish-edit.

# [Recording and Persisting macros](https://emacs.stackexchange.com/questions/70/how-to-save-a-keyboard-macro-as-a-lisp-function)
1. M-x start-kbd-macro
2. do definitions like e.g. M-x flush-lines ^\s-*$
3. M-x kmacro-end-macro
4. M-x kmacro-name-last-macro
5. M-x insert-kbd-macro

Resulting Ouput (still with a typo):
```
(fset 'removeemptylines
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([134217848 102 108 117 115 104 45 108 105 110 101 115 return 94 94 backspace 92 115 45 42 36 return 134217848 107 109 97 99 114 111 45 101 110 100 45 109 97 114 backspace 99 114 111 105 backspace] 0 "%d")) arg)))
```

# Use newline or tab in replacement with `replace-string` or `replace-regexp` in emacs

In order to use a literal tab or newline in the replacement string of a replace function in emacs use

C-q tab   # insert tab
C-q C-j   # insert newline

# Emails skizzieren:

* cg-remove-newlines-in-region
*  visual-line-mode
* https://www.emacswiki.org/emacs/FillParagraph
