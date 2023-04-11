#lang racket

#|
    Author:         Kong Jimmy Vang
    Project:        hw1 (Scheme Functions)
    Class:          CS 421
    Date Created:   1/30/2021
    Date Modified   2/12/2021
|#

(define (partition L N)
  (cond
    ((null? L) '())
    ((empty? L) L)
    ((< N 0) (partition L 1))
    ((< (length L) N) (list L))
    (else (cons
            (let head ((L2 L) (N2 N))
              (cond
                ((null? L2) '())
                ((<= N2 0) '())
                (else (cons (car L2) (head (cdr L2) (- N2 1))))))
            (partition (let tail ((L2 L) (N2 N))
                         (cond
                           ((null? L2) '())
                           ((<= N2 0) L2)
                           (else (tail (cdr L2) (- N2 1)))))
                       N )))))

(define (interleave L1 L2)
  (cond
    ((and (null? L1) (null? L2)) '())
    ((null? L1) (cons (car L2) (cdr L2)))
    ((null? L2) (cons (car L1) (cdr L1)))
    (else (cons (car L1) (cons (car L2) (interleave (cdr L1) (cdr L2)))))))

(define (list-replace ALIST SYM VAL) 
  (cond
    ((null? ALIST) '()) 
    ((equal? SYM (car ALIST)) (cons VAL (list-replace (cdr ALIST) SYM VAL)))
    ((symbol? (car ALIST)) (cons (car ALIST ) (list-replace (cdr ALIST) SYM VAL)))
    (else (cons (list-replace (car ALIST) SYM VAL) (list-replace (cdr ALIST) SYM VAL)))))

(define (remove-all ALIST VAL)
  (cond
    ((not (list? ALIST)) '())
    (else (filter (lambda (ALIST) (not (equal? (car (list ALIST)) VAL))) ALIST))))

(define (rle L)
   (foldr (lambda (X L2) (cons X L2))
          '()
          (foldr (lambda (X L2)
                   (cond
                     ((or (null? L2) (not (equal? (caar L2) X))) (cons (list X 1) L2))
                     (else (cons (list X (+ (cadar L2) 1)) (cdr L2)))))
                 '()
                 L)))

(define (rld-helper L)
  (cond
    ((null? L) '())
    (else (let rld-counter-helper ((X (car L)) (N (cadr L)))
            (cond
              ((<= N 1) (list X))
              (else (append (list X) (rld-counter-helper X (- N 1) ))))))))

(define (rld L)
  (cond
    ((null? L) '())
    (else (apply append (map rld-helper L)))))

(define (nth XS N)
  (cond
    ((null? XS) '())
    ((<= N 0) (car XS))
    (else (nth (cdr XS) (- N 1)))))

(define (every-nth XS START N)
  (cond
    ((null? XS) '())
    ((>= START (length XS)) '())
    (else (cons (nth XS START) (every-nth XS (+ START N) N) ))))

(define (running-sum-helper L SUM)
  (cond
    ((null? L) (list SUM))
    (else (cons SUM (running-sum-helper (cdr L) (+ (car L) SUM))))))

(define (running-sum L)
  (cond
    ((null? L) '())
    (else (running-sum-helper (cdr L) (car L)))))

(define (counts-helper XS SYM)
  (cond
    ((null? XS) 0)
    ((equal? (car XS) SYM) (+ 1 (counts-helper (cdr XS) SYM)))
    (else (counts-helper (cdr XS) SYM))))

(define (counts XS)
  (cond
    ((null? XS) '())
    (else (cons (list (car XS) (counts-helper XS (car XS)))
                (counts (filter (lambda (x) (not (equal? (car XS) x))) XS))))))

(define (get-vertexs-with-edges g L)
   (cond
      (( null? L ) '())
      (else (cons (list (car L) (get-edges (car L) g))
                  (get-vertexs-with-edges g (filter (lambda (x) (not (equal? (car L) x))) L))))))

(define (get-edges VERTEX g)
   (cond
      (( null? g ) '())
      (( equal? (caar g) VERTEX) (cons (cadr (car g)) (get-edges VERTEX (cdr g))))
      (else (get-edges VERTEX (cdr g)))))

(define (decompose-graph g)
   (cond
      ((null?  g) '())
      (else (cons (caar g) (cons (cadr (car g)) (decompose-graph (cdr g)))))))

(define (el-graph->x-graph g)
  (get-vertexs-with-edges g (decompose-graph g)))

(define (x-graph->el-graph g)
  (cond
     ((null? g ) '())
     (else (append (map (lambda (X) (list (caar g) X)) (cadr (car g))) (x-graph->el-graph (cdr g))))))

(provide partition interleave list-replace remove-all
         rle rld every-nth running-sum counts
         el-graph->x-graph x-graph->el-graph)
