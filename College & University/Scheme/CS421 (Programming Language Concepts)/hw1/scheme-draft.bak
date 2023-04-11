#lang racket

;(define (take2 L N)
;  (cond
;    ((null? L) '())
;    ((<= N 0) '())
;    (else (cons (car L) (take2 (cdr L) (- N 1))))))
;
;(define (drop2 L N)
;  (cond
;    ((null? L) '())
;    ((<= N 0) L)
;    (else (drop2 (cdr L) (- N 1)))))
;
;(define (partition L N)
;  (cond
;    ((null? L) '())
;    ((empty? L) L)
;    ((< N 0) (partition L 1))
;    ((< (length L) N) (list L))
;    (else (cons (take2 L N) (partition (drop2 L N) N)))))

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

;(define (partition L N)
;  (cond
;    ((null? L) '())
;    ((empty? L) print "w" (list L))
;    ((= N 0) (list L))
;    ((< N 0) (list L))
;    (else (cons (car L) (partition (cdr L) (- N 1))))))

(display "partition\n")
(partition '(1 2 3 4 5) 2) 
(partition '(1 2 3 4) 1)
(partition '(1 (2 3) (4 5) 6 7 8) 2)
(partition '(1 2 3 4) -12)

(define (interleave L1 L2)
  (cond
    ((and (null? L1) (null? L2)) '())
    ((null? L1) (cons (car L2) (cdr L2)))
    ((null? L2) (cons (car L1) (cdr L1)))
    (else (cons (car L1) (cons (car L2) (interleave (cdr L1) (cdr L2)))))))

(display "interleave\n")
(interleave '(1 2 3) '(4 5 6))
(interleave '(1 2 3) '(4))
(interleave '() '(1 2))
(interleave '(a (b c) d) '((e f) 5 9))

(define (list-replace ALIST SYM VAL) 
  (cond
    ((null? ALIST) '()) 
    ((equal? SYM (car ALIST)) (cons VAL (list-replace (cdr ALIST) SYM VAL)))
    ((symbol? (car ALIST)) (cons (car ALIST ) (list-replace (cdr ALIST) SYM VAL)))
    (else (cons (list-replace (car ALIST) SYM VAL) (list-replace (cdr ALIST) SYM VAL)))))

(display "list-replace\n")
(list-replace '(a b c) 'a 3)
(list-replace '(a (a b c) c) 'a 3)
(list-replace '() 'a 3)
(list-replace '(a (a (a))) 'a '(3))

(define (remove-all ALIST VAL)
  (cond
    ((not (list? ALIST)) '())
    (else (filter (lambda (ALIST) (not (equal? (car (list ALIST)) VAL))) ALIST))))

;  (cond
;    ((null? ALIST) '()) 
;    ((equal? VAL (car ALIST)) (remove-all (cdr ALIST) VAL))
;    (else (cons (remove-all (car ALIST) VAL) (remove-all (cdr ALIST) VAL)))))

(display "remove-all\n")
(remove-all '(1 2 3 4 1 2 3 4) 3)
(remove-all '(1 1 1 1 1) 1)
(remove-all '(1 (2 3) 4 3 3) 3)
(remove-all '(1 1 1 1 1) 'x)

;(define (rle L)
;  (cond
;    ((null? L) '())
;    (else (let rle-helper ((prev (car L)) (in (cdr L)) (out (list (car L))))
;            (cond
;              ((null? in) (list (list (car out) (length out))))
;              ((equal? prev (car in)) (rle-helper prev (cdr in) (append out (list (car in)))))
;              (else (cons (list (car out) (length out)) (rle in))))))))

(define (rle L)
   (foldr (lambda (X L2) (cons X L2))
          '()
          (foldr (lambda (X L2)
                   (cond
                     ((or (null? L2) (not (equal? (caar L2) X))) (cons (list X 1) L2))
                     (else (cons (list X (+ (cadar L2) 1)) (cdr L2)))))
                 '()
                 L)))

(display "rle\n")
(rle '(1 1 1 3 2 2 2 9 9 9 9 9 9))
(rle '(d d d #t #t 10 10 10 10 10))
(rle '(d d d d a a a a b a a a))

(define (rld-helper L)
  (cond
    ((null? L) '())
    (else (let rld-counter-helper ((X (car L)) (N (cadr L)))
            (cond
              ((<= N 1) (list X))
              (else (append (list X) (rld-counter-helper X (- N 1) ))))))))
    
(display "rld-helper\n")
(rld-helper '(1 3))

(define (rld L)
  (cond
    ((null? L) '())
    (else (apply append (map rld-helper L)))))

(display "rld\n")
(rld '((1 3) (3 1) (2 3) (9 6)))
(rld (rle '(d d d #t #t 10 10 10 10 10)))

(define (nth XS N)
  (cond
    ((null? XS) '())
    ((<= N 0) (car XS))
    (else (nth (cdr XS) (- N 1)))))

(display "nth\n")
(nth '(a b c d e f g h i) 3)

(define (every-nth XS START N)
  (cond
    ((null? XS) '())
    ((>= START (length XS)) '())
    (else (cons (nth XS START) (every-nth XS (+ START N) N) ))))

(display "every-nth\n")
(every-nth '(0 1 2 3 4 5 6 7 8) 3 2)
(every-nth '(0 1 2 3 4 5 6 7 8) 0 4)
(every-nth '(0 1 2 3 4 5 6 7 8) 12 9)
(every-nth '(a b c d e f g h i) 3 2)

(define (running-sum-helper L SUM)
  (cond
    ((null? L) (list SUM))
    (else (cons SUM (running-sum-helper (cdr L) (+ (car L) SUM))))))

(define (running-sum L)
  (cond
    ((null? L) '())
    (else (running-sum-helper (cdr L) (car L)))))

(display "running-sum\n")
(running-sum '(1 2 3))
(running-sum '())
(running-sum '(3 0 -2 3))

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

(display "counts\n")
(counts '(a b c c b b))
(counts '())
(counts '(1 3 c c #f))

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

(display "el-graph->x-graph\n")
(el-graph->x-graph '((x y) (y z) (x z)))
(el-graph->x-graph '((x y) (y z) (x z) (x b)))

(display "el-graph->x-graph\n")
(x-graph->el-graph '((x (y z)) (y (z)) (z ())))
(x-graph->el-graph '((x (y z b)) (y (z)) (z ())))

(provide partition interleave list-replace remove-all
         rle rld every-nth running-sum counts
         el-graph->x-graph x-graph->el-graph)
