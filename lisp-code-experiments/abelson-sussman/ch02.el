
;; http://ergoemacs.org/emacs/elisp_editing_basics.htmly
;; https://masteringemacs.org/article/evaluating-elisp-emacs
;; http://cl-cookbook.sourceforge.net/emacs-ide.html
;; https://nullprogram.com/blog/2018/05/31/

;; This evaluates the contents of buffer evaluate-me and prints the value of each toplevel form to the buffer output:
;; (eval-buffer "ch02.el" (get-buffer-create "output"))

;; Another useful feature is the concept of a working buffer -
;; a buffer through which your changes are evaluated.
;; If you type C-c C-b you can change ielm’s working
;; buffer to one of your choosing and then all the code you evaluate thereafter will be
;; treated as if you executed it in the con



;; https://masteringemacs.org/article/evaluating-elisp-emacs
;;  C-M-x for your everyday editing and quick debugging; 

;; (with-current-buffer (get-buffer-create "output")
;;   (insert "\nsome text" "asd"))

(defvar curwd (shell-command-to-string "pwd"))


(message "Her age is: %d" 16)
(message "Herasdas")

;; http://ergoemacs.org/emacs/elisp_printing.html
;; (setq xbuff (generate-new-buffer "*my output*"))
;; (print "something" xbuff)
;; (switch-to-buffer xbuff )


(add-to-list 'load-path "~/.emacs.d/lisp-code-experiments/abelson-sussman")


;; 2.1 Data Abstraction

;; 2.1.1 Rational Numbers


(defun add-rat (x y)
 (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))


(defun sub-rat (x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(defun mul-rat (x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(defun div-rat (x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(defun equal-rat? (x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))


;; ein pair wird über cons gebaut
(defun x (cons 1 2))

(car x)
(defvar y (cons 1 2))
(defvar z (cons x y))


(defun make-rat (n d) (cons n d))

(defvar x (make-rat 1 31))
(print x)

(defun numer (x) (car x))
(defun denom (x) (cdr x))

(denom x)
(numer x)


(defun print-rat (x)
  (newline)
  (princ (numer x))
  (princ "/")
  (princ (denom x)))

(defvar one-half (make-rat 1 2))
(print-rat one-half)

(defvar one-third (make-rat 1 3))

(print-rat (add-rat one-half one-third))

(print-rat (mul-rat one-half one-third))



(print-rat (add-rat one-third one-third))



;; alternative funktion make.rat mit Kürzem bei der Initialisierung der rational number
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(defun make-rat (n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))

(defvar one-half (make-rat 1 2))
(defvar one-third (make-rat 1 3))

(print-rat (add-rat one-third one-third)) ;; jetzt 2/3 


;; 2.2  Hierarchical Data and the Closure Property


;; 2.2.1  Representing Sequences


(cons 1
      (cons 2
            (cons 3
                  (cons 4 nil))))
(list 1 2 3 4)


(defvar one-through-four (list 1 2 3 4))

(car one-through-four)

(cdr one-through-four)

(car (cdr one-through-four))

(cons 10 one-through-four)

(cons 5 one-through-four)




;; List operations

;; list-ref:
;; takes as arguments a list and a number n and returns the nth item of the list.
;; Method: manipulating lists by successively ``cdring down'' the lists. 
;; 
;;    For n = 0, list-ref should return the car of the list.
;;    Otherwise, list-ref should return the (n - 1)st item of the cdr of the list. 

(defun list-ref (items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(defvar squares (list 1 4 9 16 25))

(list-ref squares 3)
;; 16

;; cdr down the whole list =>  length of list:
;; To aid in this, Scheme includes a primitive predicate null?, which tests whether its argument is the empty list. The procedure length,
;; which returns the number of items in a list, illustrates this typical pattern of use:

;; The length procedure implements a simple recursive plan. The reduction step is:
;;    The length of any list is 1 plus the length of the cdr of the list. 
;; This is applied successively until we reach the base case:
;;    The length of the empty list is 0. 

(cdr (list 1 3 5 7))
;; (3 5 7)

(defun length (items)
  (if  (null items)
      0
      (+ 1 (length (cdr items)))))

(defvar odds (list 1 3 5 7))

(length odds)

(defun lengthiter (items)
  (defun length-iter (a count)
    (if (null a)
        count
        (length-iter (cdr a) (+ 1 count))))
  (length-iter items 0))

(lengthiter odds)




;;  Append is also implemented using a recursive plan. To append lists list1 and list2, do the following:
;;    If list1 is the empty list, then the result is just list2.
;;    Otherwise, append the cdr of list1 and list2, and cons the car of list1 onto the result: 

(defun append (list1 list2)
  (if (null list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(append odds squares)
;; (1 3 5 7 1 4 9 16 25)

(append squares odds)
;;(1 4 9 16 25 1 3 5 7)



;; Mapping over list

(defun scale-list (items factor)
  (if (null items)
      nil
      (cons (* (car items) factor)
            (scale-list (cdr items) factor))))

(scale-list (list 1 2 3 4 5) 10)
;; (10 20 30 40 50)


;; verallgemeinerung - higher order procedures



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,,
;; 2.2.2  Hierarchical Structures
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,,

(cons (list 1 2) (list 3 4))


