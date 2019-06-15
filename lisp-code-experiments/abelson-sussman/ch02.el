;;; ch02.el --- Chapter 2 from Abelson, Sussman and Sussman
;; Elisp Equivalente zu scheme functions
;; https://www.cs.utexas.edu/~novak/schemevscl.html
;; Scheme: 	Common Lisp:
;; (define (fn args ...) code) 	(defun fn (args ...) code)
;; begin	progn
;; set!	setq
;; eq?	eq
;; eqv?	eql
;; equal?	equal
;; number?	numberp
;; zero?	zerop
;; pair?	consp
;; null?	null
;; display	princ
;; write	prin1
;; newline	terpri
;; (list-tail lst n)	(nthcdr n lst)
;; (list-ref lst n)	(nth n lst)
;; subset?	subsetp
;; map	mapcar
;; for-each	mapc
;; vector-ref	aref
;; vector-set!	(setf (aref ...) val)
;; substring	subseq
;; #t	t
;; #f	nil
;; '()	'() or nil
;;
;;  The following table lists standard Common Lisp functions that are provided in the file initdr.scm.
;; dotimes
;; dolist
;; intersection
;; union
;; set-difference
;; copy-list
;; subset
;; every
;; some
;; copy-tree
;; subst
;; sublis
;; nconc
;; nreverse

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


;;; Commentary:
;; 

;;; Code:

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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,,
;; 2.2.2  Hierarchical Structures
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,,

;; 2.2.1  Representing Sequences



;; 2.2.1  Representing Sequences
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,,

(define one-through-four (list 1 2 3 4))

(cons 1
      (cons 2
            (cons 3
                  (cons 4 nil))))

(cons (list 1 2) (list 3 4))

(defvar one-through-four (list 1 2 3 4))

;; meine Funktion
(printlist one-through-four)


(car one-through-four)
;; 1

(cdr one-through-four)
;; (2 3 4)

(car (cdr one-through-four))
;; 2

(cons 10 one-through-four)
;;(10 1 2 3 4)

(cons 5 one-through-four)
;; (5 1 2 3 4)




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



;; Mapping over lists
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,,

;; cond
(defun abs (x)
(cond ((> x 0) x)
((= x 0) 0)
((< x 0) (- x))))


(defun scale-list (items factor)
  (if (null items)
      nil
      (cons (* (car items) factor)
            (scale-list (cdr items) factor))))

(scale-list (list 1 2 3 4 5) 10)
;;(10 20 30 40 50)


;; das tut noch nicht, stattdessen kann man das mapcar nehmen
(defun map (proc items)
  (if (null items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

;; use elisps mapcar
(mapcar (lambda (x) (* x x))
     (list 1 2 3 4))

(map 'abs
     (list 1 2 3 4))

(defun scale-list-map (items factor)
  (mapcar (lambda (x) (* x factor))
       items))

(scale-list-map (list 1 2 3 4 5) 10)

(mapcar 'abs (list -10 2.5 -11.6 17))

(mapcar (lambda (x) (abs x))
     (list 1 -2 3 4))


;; 2.2.2  Hierarchical Structuresa

(cons (list 1 2) (list 3 4))

;; die laenge von oben:
(defun length (items)
  (if  (null items)
      0
      (+ 1 (length (cdr items)))))

(defvar x (cons (list 1 2) (list 3 4)))

(length x)
;; 3

;; To implement count-leaves, recall the recursive plan for computing length:
;;    Length of a list x is 1 plus length of the cdr of x.
;;    Length of the empty list is 0. 
;; Count-leaves is similar. The value for the empty list is the same:
;;    Count-leaves of the empty list is 0. 
;; But in the reduction step, where we strip off the car of the list,
;; we must take into account that the car may itself be a tree whose leaves
;; we need to count. Thus, the appropriate reduction step is

;; Count-leaves of a tree x is count-leaves of the car of x
;; plus count-leaves of the cdr of x. 
;; Finally, by taking cars we reach actual leaves, so we need another base case:
;; Count-leaves of a leaf is 1. 

;; To aid in writing recursive procedures on trees, Scheme provides the primitive
;; predicate pair?, which tests whether its argument is a pair. Here is the complete procedure:13


(defun count-leaves (x)
  (cond ((null x) 0)  
        ((not (consp x)) 1)
        ((+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

(defvar y (cons (list 1 2) (list 3 4)))
(count-leaves x)

(list x x)
;;(((1 2) 3 4) ((1 2) 3 4))
(length (list x x))
;; 2
(count-leaves (list x x))
;;8


;; Mapping over trees
;; scale-tree procedure,
;; analogous to scale-list of section 2.2.1,
;; takes as arguments a numeric factor and a tree whose leaves are numbers.
;; It returns a tree of the same shape, where each number is multiplied by the factor.
;; The recursive plan for scale-tree is similar to the one for count-leaves:

(defun scale-tree (tree factor)
  (cond ((null tree) nil)
        ((not (consp tree)) (* tree factor))
        ((cons (scale-tree (car tree) factor)
                    (scale-tree (cdr tree) factor)))))

(scale-tree (list 1 (list 2 (list 3 4) 5) (list 6 7))
            10)
;; (10 (20 (30 40) 50) (60 70))


;; Another way to implement scale-tree is to regard the tree as a sequence of
;; sub-trees and use map.
;; We map over the sequence, scaling each sub-tree in turn, and return the list of results.
;; In the base case, where the tree is a leaf, we simply multiply by the factor:

(defun scale-tree2 (tree factor)
  (mapcar (lambda (sub-tree)
         (if (consp sub-tree)
             (scale-tree2 sub-tree factor)
             (* sub-tree factor)))
       tree))

(scale-tree2 (list 1 (list 2 (list 3 4) 5) (list 6 7))
            10)

;; 2.2.3  Sequences as Conventional Interfaces

;;  Consider, for example, the following procedure, analogous to the count-leaves procedure
;; of section 2.2.2,which takes a tree as argument and computes the sum of
;; the squares of the leaves that are odd: 

;; elisp odd:
(cl-oddp 11)
(defun square (x) (* x x))

(defun sum-odd-squares (tree)
  (cond ((null tree) 0)  
        ((not (consp tree))
         (if (cl-oddp tree) (square tree) 0))
        ((+ (sum-odd-squares (car tree))
                 (sum-odd-squares (cdr tree))))))



(sum-odd-squares (cons (list 1 2) (list 3 4)))
;; 10
(sum-odd-squares (cons (list 1 2) (list 5 4)))
;; 26

;; fibonacci(0) =  0
;; fibonacci(1) =  0
;; fibonacci(2) = 1+0 = 1
;; fibonacci(3) = 1+1 = 2
;; fibonacci(4) = 2+1 = 3
;; fibonacci(5) = 3+2 = 5
(defun fib (x)
  (cond ((< x 2) x)
        ((+ (fib (- x 1)) (fib (- x 2 )))))
  )

(defun even-fibs (n)
  (defun next (k)
    (if (> k n)
        nil
        (let ((f (fib k)))
          (if (cl-evenp f)
              (cons f (next (+ k 1)))
              (next (+ k 1))))))
(next 0))
(even-fibs 2)


(defun square (x) (* x x))

(mapcar 'square (list 1 2 3 4 5))
;;(1 4 9 16 25)

(defun filter (prd sequence)
  (cond ((null sequence) nil)
        ((prd (car sequence))
         (cons (car sequence)
               (filter prd (cdr sequence))))
        (else (filter prd (cdr sequence)))))


(filter 'cl-oddp (list 1 2 3 4 5))

;; (predicate)

(provide 'ch02)

;;; ch02.el ends here
