#lang racket

;;;  Author:         Kong Jimmy Vang
;;;  File:           heap.rkt
;;;  Project:        hw2 (Scheme Coding and Grammars - The Heap "Class" in Scheme)
;;;  Class:          CS 421
;;;  Date Created:   2/19/2021
;;;  Date Modified   3/1/2021

;;; Returns the left child when given a heap as the parameter.
(define heap-left cadr)

;;; Returns the right child when given a heap as the parameter.
(define heap-right caddr)

;;; Returns a new empty heap.
(define (heap-create) '())

;;; Returns #t if the given heap, h, is empty. Otherwise return #f.
(define (heap-is-empty? h)
  (null? h))

;;; Returns the size of heap h. Return 0 if heap h is empty.
(define (heap-size h)
  (cond ((heap-is-empty? h) 0)
        (else (+ (+ (heap-size (heap-left h)) (heap-size (heap-right h))) 1))))

;;; Removes the MSB (Most Significant Bit) from the given binary list.
;;; Returns a list without the MSB. If the binary list is empty, return the empty list.
(define (remove-msb binary-list)
  (cond ((null? binary-list) (list))
        ((null? (cdr binary-list)) (list))
        (else (cdr binary-list))))

;;; Creates a binary number in list form with the MSB (Most Significant Bit) on the
;;;     LEFT-MOST side of the list.
;;; Returns the created list.
;;; The integer x must be a positive non-zero integer.
(define (integer->binary-list x)
  (cond ((null? x) (list 0))
        ((<= x 0)  '())
        (else (foldr cons
                     (cons (remainder x 2) '())
                     (integer->binary-list (quotient x 2))))))

;;; Helper function for "heap-insert".
;;; The path is a list that denotes binary digits which lead to the insertion point.
;;; This path is computed in "heap-insert".
(define (heap-insert-helper h f x path)
  (cond
    ((empty? path)        ;; BASE CASE: Handles case when reaching the position of element SIZE+1.
      (list x (heap-create) (heap-create)))
    ((= (car path) 0)     ;; CASE 1: Handles case where the bit of (car path) is equal to 0 (Go left).
      (let ((hx (car h)))
        (if (f x hx)
            (list x (heap-insert-helper (heap-left h) f hx (remove-msb path)) (heap-right h))
            (list hx (heap-insert-helper (heap-left h) f x (remove-msb path)) (heap-right h)))))
    (else                 ;; CASE 2: Handles case where the bit of (car path) is equal to 1 (Go right).
      (let ((hx (car h)))
        (if (f x hx)
            (list x (heap-left h) (heap-insert-helper (heap-right h) f hx (remove-msb path)))
            (list hx (heap-left h) (heap-insert-helper (heap-right h) f x (remove-msb path))))))))

;;; Returns the heap resulting from inserting x into heap h.
;;; Function f is a predicate that accepts two elements of
;;;     the type contained in the heap and returns #t if the left operand is less than the right.
(define (heap-insert h f x)
  (cond ((heap-is-empty? h) (list x (heap-create) (heap-create)))
        (else (heap-insert-helper h f x (remove-msb (integer->binary-list (+ (heap-size h) 1)))))))

;;; Returns the highest-priority (smallest according to heap-insert predicate f) value in heap h.
;;; If the heap h is empty, return Null, where Null is defined as the empty list '().
(define (heap-peek h)
  (cond ((heap-is-empty? h) '())
        (else (car h))))

;;; Returns #t if heap h contains element x as defined by the eq predicate and #f otherwise.
;;; Function eq is a predicate that accepts two elements of the type contained in the heap
;;;     and returns #t if the two elements are equal and #f otherwise.
(define (heap-contains h eq x)
  (cond ((heap-is-empty? h) #f)
        ((eq x (car h)) #t)
        (else (or (heap-contains (heap-left h) eq x)
                  (heap-contains (heap-right h) eq x)))))

;;; Helper function for "list->heap".
;;; Returns the constructed heap created from list xs.
(define (list->heap-helper h xs f)
  (cond ((null? xs) h)
        (else (list->heap-helper (heap-insert h f (car xs)) (cdr xs) f))))

;;; Returns the heap that results from adding each element in list xs to an empty heap in
;;;     the order they occur in xs using f as the heap-insert predicate.
(define (list->heap xs f)
  (cond ((null? xs) (heap-create))
        (else (list->heap-helper (heap-create) xs f))))

(provide heap-create heap-is-empty? heap-size heap-insert heap-peek heap-contains list->heap)