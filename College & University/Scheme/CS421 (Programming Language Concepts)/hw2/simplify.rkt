#lang racket

;;;  Author:         Kong Jimmy Vang
;;;  File:           simplify.rkt
;;;  Project:        hw2 (Scheme Coding and Grammars - Expression Simplification)
;;;  Class:          CS 421
;;;  Date Created:   2/19/2021
;;;  Date Modified   2/28/2021

;;; Returns #t if X is an atom. Otherwise return #f.
(define (atom? X)
  (and (not (null? X)) (not (pair? X))))

;;; Returns #t if X is an 'error symbol. Otherwise return #f.
(define (error? X)
  (equal? X 'error))

;;; Returns #t if X is a variable. Otherwise return #f.
;;; Variables are denoted as symbols, except for the 'error symbol.
(define (variable? X)
  (and (symbol? X) (not (error? X))))

;;; Returns #t if variable X and Y are sorted in ascending order. Otherwise return #f.
(define (variable<? X Y)
  (symbol<? X Y))

;;; Returns #t if the expression E contains the product operator.
;;; Otherwise return #f.
;;; The product operator is denoted as the '* symbol. 
(define (product? E)
  (cond ((not (atom? E)) (eq? (car E) '*))
        (else #f)))

;;; Returns #t if the expression E contains the sum operator.
;;; Otherwise return #f.
;;; The sum operator is denoted as the '+ symbol. 
(define (sum? E)
  (cond ((not (atom? E)) (eq? (car E) '+))
        (else #f)))

;;; Returns #t if the expression E contains the difference operator.
;;; Otherwise return #f.
;;; The difference operator is denoted as the '- symbol. 
(define (diff? E)
  (cond ((not (atom? E)) (eq? (car E) '-))
        (else #f)))

;;; Returns #t if the expression E contains the quotient operator.
;;; Otherwise return #f.
;;; The quotient operator is denoted as the '/ symbol. 
(define (quotient? E)
  (cond ((not (atom? E)) (eq? (car E) '/))
        (else #f)))

;;; Returns #t if the expression E contains the PICK operator.
;;; Otherwise return #f.
;;; The PICK operator is denoted as the 'pick symbol. 
(define (pick? E)
  (cond ((not (atom? E)) (eq? (car E) 'pick))
        (else #f)))

;;; Returns #t if E1 precedes E2 according to the rules below. Otherwise return #f.
;;;   1. For any simplified scheme expression involving either multiplication or addition:
;;;       a. If the operands are both variables, they are ordered alphabetically.
;;;       b. If the operands include a variable and a value, the variable precedes the value.
;;;       c. If one operand is a sub-expression and the other is either a variable or value,
;;;           the variable or value precedes the sub-expression.
;;;       d. If the operands are both sub-expressions, the ordering of the sub-expressions
;;;           follows the ordering of their operand as given in: *, +, -, /, pick.
;;;   2. A fully simplified expression will have no sub-expression that can be simplified by
;;;       application of one or more of the above rules.
(define (expression<? E1 E2)
  (cond ((and (variable? E1) (variable? E2) (variable<? E1 E2)) #t) ;; FOR CASE 1.a.
        ((and (variable? E1) (number? E2)) #t)                      ;; FOR CASE 1.b.
        ((and (or (number? E1) (variable? E1)) (list? E2)) #t)      ;; FOR CASE 1.c.
        ((and (list? E1) (list? E2)) (symbol<? (car E1) (car E2)))  ;; FOR CASE 1.d.
        (else #f)))

;;; Constructs a list and orders it using the rules documented in the function "expression<?".
(define (make-list OP E1 E2)
  (cond ((or (error? E1) (error? E2)) 'error)    ;; Return ERROR if E1 or E2 are ERROR symbols.
        ((or (quotient? (list OP))
             (diff? (list OP))) (list OP E1 E2)) ;; Do not allow swap for quotient and diff expressions.
        ((expression<? E2 E1) (list OP E2 E1))   ;; Swap order if expression<? returns true.
        (else (list OP E1 E2))))

;;; Simplify the product of E1 and E2. Return the simplified expression.
(define (make-product E1 E2)
  (cond ((or (error? E1) (error? E2)) 'error)             ;; 12. (○ X Y) → ERROR if either X or Y is an ERROR
        ((and (number? E1) (number? E2)) (* E1 E2))       ;; 11. (○ X Y) → Z if X and Y are numbers and Z is the result
        ((number? E2) (cond ((= E2 0) 0)                  ;; 3.  (* X 0) → 0 for any X
                            ((= E2 1) E1)                 ;; 5.  (* X 1) → X for any X
                            (else (make-list '* E1 E2))))
        ((number? E1) (cond ((= E1 0) 0)                  ;; 4.  (* 0 X) → 0 for any X
                            ((= E1 1) E2)                 ;; 6.  (* 1 X) → X for any X
                            (else (make-list '* E1 E2))))
        (else (make-list '* E1 E2))))                     ;; ELSE return unsimplified.

;;; Simplify the sum of E1 and E2. Return the simplified expression.
(define (make-sum E1 E2)
  (cond ((or (error? E1) (error? E2)) 'error)                ;; 12. (○ X Y) → ERROR if either X or Y is an ERROR
        ((and (number? E1) (number? E2)) (+ E1 E2))          ;; 11. (○ X Y) → Z if X and Y are numbers and Z is the result
        ((number? E2) (if (= E2 0) E1 (make-list '+ E1 E2))) ;; 1.  (+ X 0) → X for any X
        ((number? E1) (if (= E1 0) E2 (make-list '+ E1 E2))) ;; 2.  (+ 0 X) → X for any X
        (else (make-list '+ E1 E2))))                        ;; ELSE return unsimplified.

;;; Simplify the difference of E1 and E2. Return the simplified expression.
(define (make-diff E1 E2)
  (cond ((or (error? E1) (error? E2)) 'error)                ;; 12. (○ X Y) → ERROR if either X or Y is an ERROR
        ((and (number? E1) (number? E2)) (- E1 E2))          ;; 11. (○ X Y) → Z if X and Y are numbers and Z is the result
        ((equal? E1 E2) 0)                                   ;; 13. (- X X) → 0 for any X other than ERROR
        ((number? E2) (if (= E2 0) E1 (make-list '- E1 E2))) ;; 7.  (- X 0) → X for any X
        (else (make-list '- E1 E2))))                        ;; ELSE return unsimplified.

;;; Simplify the quotient of E1 and E2. Return the simplified expression.
(define (make-quotient E1 E2)
  (cond ((or (error? E1) (error? E2)) 'error) ;; 12. (○ X Y) → ERROR if either X or Y is an ERROR
        ((and (equal? E1 E2)
              (not (equal? E1 0))
              (not (equal? E1 1))) 1)         ;; 10. (/ X X) → 1 for any X other than ERROR and 0 and 1
        ((and (number? E1)
              (number? E2)
              (not (= E2 0))) (/ E1 E2))      ;; 11. (○ X Y) → Z if X and Y are numbers and Z is the result
        ((number? E2)
         (cond ((= E2 1) E1)                  ;; 8.  (/ X 1) → X for any X
               ((= E2 0) 'error)              ;; 9.  (/ X 0) → ERROR for any X
               (else (make-list '/ E1 E2))))
        ((number? E1)
         (cond ((and (= E1 0)
                     (not (equal? E2 0))
                     (not (equal? E2 1))) 0)  ;; 14. (/ 0 X) → 0 for any number X other than 0 and 1
               (else (make-list '/ E1 E2)))) 
        (else (make-list '/ E1 E2))))         ;; ELSE return unsimplified.

;;; Simplify the 'pick expression for E1, E2, and E3. Return the simplified expression.
(define (make-pick E1 E2 E3)
  (cond ((error? E1) 'error)              ;; 16.  (pick ERROR E2 E3) → ERROR
        ((number? E1) (cond ((= E1 0) E2) ;; 15.  (pick 0 E2 E3) → E2
                            (else E3)))   ;; 17.  (pick X E2 E3) → E3 for any non-zero number X
        (else (list 'pick E1 E2 E3))))    ;; ELSE return unsimplified.

;;; Accepts a scheme expression E and returns a simplified scheme expression of E.
;;; The simplification rules are denoted in each "make-" function.
(define (simplify E)
  (cond ((null? E ) 'error)
        ((number? E) E)
        ((variable? E) E)
        ((sum? E) (make-sum (simplify (cadr E)) (simplify (caddr E))))
        ((diff? E) (make-diff (simplify (cadr E)) (simplify (caddr E))))
        ((product? E) (make-product (simplify (cadr E)) (simplify (caddr E))))
        ((quotient? E) (make-quotient (simplify (cadr E)) (simplify (caddr E))))
        ((pick? E) (make-pick (simplify (cadr E)) (simplify (caddr E)) (simplify (cadddr E))))
        (else E)))

(provide simplify)