

;;  Elementary functions
;;  seven (The Magnificent Seven, 

;; 1- car


;; 2. atom
;; (atom "foo")
;; (atom 1)


;;     compileSdkVersion 23
;;     buildToolsVersion "25.0.0"


;;     compile 'com.android.support:appcompat-v7:23.2.0
;;     compile 'com.android.support.constraint:constraint-layout:1.0.2'
;;     compile 'com.android.support:design:23.2.0'


(defvar curwd (shell-command-to-string "pwd"))
(message curwd)


;; abelson
(defun square (x) (* x x))
(square 2)

(+ (square 6) (square 10))


(defun sum-of-squares (x y)
(+ (square x) (square y)))

(sum-of-squares 3 4)

(defun f (a)
(sum-of-squares (+ a 1) (* a 2)))
(f 5) ;; 136


(defun abs (x)
(cond ((> x 0) x)
((= x 0) 0)
((< x 0) (- x))))

;; cond
(defun abs (x)
(cond ((< x 0) (- x))
(x)))

(defun inrange (x lower upper)
(and (> x lower) (< x upper)))

(inrange 11 4 10) ;; false / nil
(inrange 11 4 10) ;; false


;; Square Root Newthon
(defun sqrt (x)
(defun good-enough? (guess x)
(< (abs (- (square guess) x)) 0.001))
(defun improve (guess x) (average guess (/ x guess)))
(defun sqrt-iter (guess x)
(if (good-enough? guess x)
guess
(sqrt-iter (improve guess x) x)))
(sqrt-iter 1.0 x))

;; mit lexical scoping.27
(defun sqrt (x)
(defun good-enough? (guess)
(< (abs (- (square guess) x)) 0.001))
(defun improve (guess)
(average guess (/ x guess)))
(defun sqrt-iter (guess)
(if (good-enough? guess)
guess
(sqrt-iter (improve guess))))
(sqrt-iter 1.0))

(sqrt 2)


(message (float 3)(
(float 4)
;; (message (sqrt 4))
;; http://ergoemacs.org/emacs/elisp_examples.html


(defun wrap-markup-region (start end)
  "Insert a markup <b></b> around a region."
  (interactive "r")
  (save-excursion
    (goto-char end) (insert "</b>")
    (goto-char start) (insert "<b>")))

;; (dolist )
;; (info "(elisp) Iteration")


;; http://ergoemacs.org/emacs/elisp_printing.html
(print "something" xbuff)
(switch-to-buffer xbuff )
(load-path)
(add-to-list 'load-path "~/.emacs.d/lisp-code-experiments/abelson-sussman")

(setq x 0)

(while (< x 4)
  (print (format "number is %d" x))
  (setq x (1+ x)))


(defun reverse (list)
  (let (value)
    (dolist (elt list value)
      (setq value (cons elt value)))))

(reverse '(1 2 3))


;; create a vector of length 5, value 0 for all elements
(make-vector 5 0) ;; [0 0 0 0 0]

;; create a vector and set to var v
(setq v (vector 3 4 5))

(message v)



;; C-x C-e
(message "hallo2")
