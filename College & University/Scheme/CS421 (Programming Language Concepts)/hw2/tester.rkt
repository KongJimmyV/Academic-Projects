#lang racket
(require "sstf.rkt")
(require "heap.rkt")
(require "simplify.rkt")

;#|
(display "==================\n")
(display "sstf\n")
(sstf '(3 12 1) 6)
(sstf '(0 1 2 3 4 5) 0)
(sstf '(4111 3923 5093 9869 4282 4310 155 2251 316 8346
        447 7221 3010 1755 8385 2377 8937 5806 931 9201
        5472 4853 8981 9490 4980 8762 5245 2409 868 272) 3100)

(display "==================\n")
(display "heap-create\n")
(heap-create)

(display "==================\n")
(display "heap-is-empty?\n")
(heap-is-empty? (heap-create))
(heap-is-empty? '())
(heap-is-empty? '(9 () ()))
(heap-is-empty? '(9 (8 () ()) (7 () ())))
(heap-is-empty? '(9 (8 (6 (1 () ()) (4 () ())) (5 () ())) (7 (2 () ()) (3 () ()))))

(display "==================\n")
(display "heap-size\n")
(heap-size (heap-create))
(heap-size '())
(heap-size '(9 () ()))
(heap-size '(9 () (7 () ())))
(heap-size '(9 (8 () ()) ()))
(heap-size '(9 (8 () ()) (7 () ())))
(heap-size '(9 (8 (6 (1 () ()) (4 () ())) (5 () ())) (7 (2 () ()) (3 () ()))))

(display "==================\n")
(display "heap-insert\n")
(heap-insert '() < 1)
(heap-insert '() > 1)
(define h (heap-create))
(set! h (heap-insert h < 3))
(set! h (heap-insert h < 1))
(set! h (heap-insert h < 5))
(set! h (heap-insert h < 9))
(set! h (heap-insert h < 8))
(set! h (heap-insert h < 2))
(set! h (heap-insert h < 7))
(set! h (heap-insert h < 4))
(set! h (heap-insert h < 6))
(display h)
(display "\n")
(heap-size h)

(display "==================\n")
(display "heap-peek\n")
(heap-peek '(1 (3 (4 (9 () ()) (6 () ())) (8 () ())) (2 (5 () ()) (7 () ()))))
(heap-peek '(9 (8 (6 (1 () ()) (4 () ())) (5 () ())) (7 (2 () ()) (3 () ()))))
(heap-peek '(b (d (w () ()) (e () ())) (q (r () ()) (t () ()))))
(heap-peek '((a) ((5 12 0 5) ((#t #t #t #t) () ()) ()) ((1 3) () ())))
(heap-peek '())

(display "==================\n")
(display "heap-contains\n")
(heap-contains '(1 (3 (4 (9 () ()) (6 () ())) (8 () ())) (2 (5 () ()) (7 () ()))) (lambda (x1 x2) (equal? x1 x2)) 1)
(heap-contains '(1 (3 (4 (9 () ()) (6 () ())) (8 () ())) (2 (5 () ()) (7 () ()))) (lambda (x1 x2) (equal? x1 x2)) 9)
(heap-contains '(1 (3 (4 (9 () ()) (6 () ())) (8 () ())) (2 (5 () ()) (7 () ()))) (lambda (x1 x2) (equal? x1 x2)) -1)
(heap-contains '(1 (3 (4 (9 () ()) (6 () ())) (8 () ())) (2 (5 () ()) (7 () ()))) (lambda (x1 x2) (equal? x1 x2)) 10)
(heap-contains '(9 (8 (6 (1 () ()) (4 () ())) (5 () ())) (7 (2 () ()) (3 () ()))) (lambda (x1 x2) (equal? x1 x2)) 1)
(heap-contains '(9 (8 (6 (1 () ()) (4 () ())) (5 () ())) (7 (2 () ()) (3 () ()))) (lambda (x1 x2) (equal? x1 x2)) 9)
(heap-contains '(9 (8 (6 (1 () ()) (4 () ())) (5 () ())) (7 (2 () ()) (3 () ()))) (lambda (x1 x2) (equal? x1 x2)) -1)
(heap-contains '(9 (8 (6 (1 () ()) (4 () ())) (5 () ())) (7 (2 () ()) (3 () ()))) (lambda (x1 x2) (equal? x1 x2)) 10)
(heap-contains '((a) ((5 12 0 5) ((#t #t #t #t) () ()) ()) ((1 3) () ())) (lambda (x1 x2) (equal? x1 x2)) 'a)
(heap-contains '((a) ((5 12 0 5) ((#t #t #t #t) () ()) ()) ((1 3) () ())) (lambda (x1 x2) (equal? x1 x2)) '(a))

(display "==================\n")
(display "list->heap\n")
(list->heap '(3 1 5 9 8 2 7 4 6) <)
(list->heap '(3 1 5 9 8 2 7 4 6) >)
(list->heap '(d e q w b r t) (lambda (x y) (string<? (symbol->string x) (symbol->string y))))
(list->heap '((1 3) (5 12 0 5) (a) (#t #t #t #t)) (lambda (x y) (< (length x) (length y))))
;|#

(display "==================\n")
(display "simplify\n")
(simplify '(+ (+ 3 5) (* (/ y 1) (+ x 0))))
(simplify '(+ z (/ 53 0)))
(simplify '(+ z a))
(simplify '12)
(simplify '(+ (- 5 2) 9))
(simplify '(+ x a))
(simplify '(/ (+ 3 a) (+ a 3)))
(simplify '(+ a 3))
(simplify '(+ 3 a))
(simplify '(+ (- 1 a) 3))
(simplify 'x)
(simplify '(pick 0 1 2))
(simplify '(pick error 1 2))
(simplify '(pick 3 1 2))
(simplify '(pick (/ 3 0) 1 2))
(simplify '(pick a (- (/ (- (/ b c) (+ c 0)) (/ (/ 2 c) (- 2 1))) (/ (- (* c c) (* 0 1)) (/ b (+ 1 c)))) 2))
(simplify '(+ c (/ (+ (* (+ a (* 0 c)) (pick 3 3 a)) (+ a a)) (- (- (* (* b 0) (/ 1 c)) (pick b 3 0)) c))))
(simplify '(* (+ (/ (* (pick (* (pick 3 0 b) (+ 3 3)) (/ (pick a c b) (- 3 1)) (+ (pick b b 1) 1)) (* (/ (pick a 2 1) (pick 3 c 0)) (pick (pick 1 c a) (+ 0 2) (* 2 0)))) (- (+ (+ (* a (+ c 3)) 3) c) (- (/ (pick 0 c 0) (- (pick 3 2 a) (+ 0 2))) (+ (+ (* a 1) (pick a c b)) 2)))) (* (* (pick (- (+ a 0) (- 2 c)) (pick b 3 b) 3) (* 0 (pick (/ a a) (- 3 1) 2))) (pick (+ (/ (pick 2 c 0) (+ 2 1)) (/ (* 2 2) 1)) (+ a (* (- 2 c) (* 0 b))) (/ (pick c 0 0) (* (* c b) (* 2 3)))))) (* (* (- (pick (/ (+ a c) (- a 3)) (- (+ a 0) (/ 0 1)) (- (pick a a 2) (pick 0 3 a))) 2) (- (- (- 0 (- (- 0 2) (* b 3))) (pick (/ 1 a) (* 0 c) a)) b)) c)))
;(simplify '(/ a (pick (- (pick (- (- (+ (+ (/ 1 (+ 0 b)) (pick 2 b a)) (- b (pick 2 a a))) (+ (pick (+ c 2) b (- a c)) a)) (pick (pick (pick 0 b 0) 0 (- 2 a)) c (- a (- (- 2 2) (/ b 1))))) (+ a (+ 2 (* (- 2 (pick 2 2 3)) (/ (pick a 0 a) (* b (+ c a)))))) (+ (pick a (pick (- b b) (/ 3 3) (/ 3 b)) (* (pick b 3 b) (* (* c a) 1))) (+ (pick (* (+ 2 1) (+ c a)) (pick 2 2 c) c) (- b (/ (/ (/ 2 0) (pick 1 3 2)) (* (* c 2) (* b 1))))))) (- 0 (* (/ (/ (* (+ (pick 2 1 b) (- a (+ c b))) (* (/ (/ 1 b) b) (/ (pick a b b) a))) (/ (- (+ (+ 0 c) (+ 0 a)) 2) 1)) a) a))) (+ (/ (+ (+ (/ (pick (* (- 2 c) (+ 3 3)) (- (- 3 a) (* 1 2)) (/ (pick c 0 a) (/ c 3))) (* (pick 3 (- 1 c) (* 1 2)) (pick (/ b c) (* a 2) (+ c 3)))) (- 3 (pick b (+ (+ 2 c) (pick c b b)) (- 3 (* 0 a))))) (+ (+ (+ (- b (* 0 (- b a))) (* (/ (+ 3 1) (* c b)) b)) (* b (- (+ (- 3 0) (- b 2)) (pick c 2 3)))) (- (- (* (+ (+ c 2) (+ b 0)) (/ 3 3)) (/ (* (+ 1 a) (- 3 a)) (/ (* 1 b) (pick c 1 2)))) (+ (+ c (/ (+ 2 b) a)) (+ (* 3 c) (/ (pick a b b) (- a c))))))) (/ a 3)) c) (/ (/ (/ (- (/ (pick (pick 3 b 0) 1 (* (pick 0 c a) (- b b))) (- (pick (pick 3 3 1) 3 (- c b)) (+ 0 2))) (/ (pick (* (/ 0 c) (* 1 a)) (+ (- 1 1) (- 3 1)) (+ (pick b 2 b) (+ 1 a))) (* (* (* (* 0 2) (/ b a)) (* (* 1 3) (+ c 3))) (+ a 0)))) b) (/ (/ b 1) (pick (+ (pick a (pick b a a) (/ 3 1)) a) (pick (pick 2 2 3) (- (/ 2 3) (+ 2 b)) (* (/ a c) (- c a))) (pick (- 2 (- 0 0)) (/ (* 1 1) (- c c)) c)))) (* (* (- (* (* (pick (- c 2) (pick b c 2) (* c b)) (pick 2 (/ 0 3) (pick b b 1))) a) (pick (pick (* 1 c) (/ 3 2) (+ a 1)) (/ (- (+ c b) (- c c)) (- (pick 2 0 2) (* 3 1))) (pick (+ b c) a (+ b c)))) (pick (* b 1) (pick (pick a b a) 2 (/ a (- c a))) (pick (pick c a b) (- (+ a a) (- b a)) (- (pick c 2 0) (- 0 3))))) (- (pick (- (/ (- a 0) a) (* (/ (pick 3 c 2) (/ 0 c)) (- (+ 3 2) (/ 1 c)))) (pick (+ (+ 3 c) (- 0 a)) (pick 1 b 3) (+ (+ c c) 0)) (- (+ (/ a b) (+ (pick b a 2) (pick 1 b c))) (* 2 (pick 0 a 1)))) (pick (- (+ (+ (pick b 0 b) 3) (/ (* 2 c) (/ 2 1))) (+ b (/ (- b 2) (/ 3 b)))) (+ c (pick (+ 3 1) (- b a) (+ a b))) (- (* (pick 2 a a) (/ 1 (+ b 0))) (* (- c (- c c)) (- (* 0 3) (pick a 2 a)))))))))))
;(simplify '(/ a (pick (- (pick (- (- (+ (+ (/ 1 (+ 0 b)) (pick 2 b a)) (- b (pick 2 a a))) (+ (pick (+ c 2) b (- a c)) a)) (pick (pick (pick 0 b 0) 0 (- 2 a)) c (- a (- (- 2 2) (/ b 1))))) (+ a (+ 2 (* (- 2 (pick 2 2 3)) (/ (pick a 0 a) (* b (+ c a)))))) (+ (pick a (pick (- b b) (/ 3 3) (/ 3 b)) (* (pick b 3 b) (* (* c a) 1))) (+ (pick (* (+ 2 1) (+ c a)) (pick 2 2 c) c) (- b (/ (/ (/ 2 0) (pick 1 3 2)) (* (* c 2) (* b 1))))))) (- 0 (* (/ (/ (* (+ (pick 2 1 b) (- a (+ c b))) (* (/ (/ 1 b) b) (/ (pick a b b) a))) (/ (- (+ (+ 0 c) (+ 0 a)) 2) 1)) a) a))) (+ (/ (+ (+ (/ (pick (* (- 2 c) (+ 3 3)) (- (- 3 a) (* 1 2)) (/ (pick c 0 a) (/ c 3))) (* (pick 3 (- 1 c) (* 1 2)) (pick (/ b c) (* a 2) (+ c 3)))) (- 3 (pick b (+ (+ 2 c) (pick c b b)) (- 3 (* 0 a))))) (+ (+ (+ (- b (* 0 (- b a))) (* (/ (+ 3 1) (* c b)) b)) (* b (- (+ (- 3 0) (- b 2)) (pick c 2 3)))) (- (- (* (+ (+ c 2) (+ b 0)) (/ 3 3)) (/ (* (+ 1 a) (- 3 a)) (/ (* 1 b) (pick c 1 2)))) (+ (+ c (/ (+ 2 b) a)) (+ (* 3 c) (/ (pick a b b) (- a c))))))) (/ a 3)) c) (/ (/ (/ (- (/ (pick (pick 3 b 0) 1 (* (pick 0 c a) (- b b))) (- (pick (pick 3 3 1) 3 (- c b)) (+ 0 2))) (/ (pick (* (/ 0 c) (* 1 a)) (+ (- 1 1) (- 3 1)) (+ (pick b 2 b) (+ 1 a))) (* (* (* (* 0 2) (/ b a)) (* (* 1 3) (+ c 3))) (+ a 0)))) b) (/ (/ b 1) (pick (+ (pick a (pick b a a) (/ 3 1)) a) (pick (pick 2 2 3) (- (/ 2 3) (+ 2 b)) (* (/ a c) (- c a))) (pick (- 2 (- 0 0)) (/ (* 1 1) (- c c)) c)))) (* (* (- (* (* (pick (- c 2) (pick b c 2) (* c b)) (pick 2 (/ 0 3) (pick b b 1))) a) (pick (pick (* 1 c) (/ 3 2) (+ a 1)) (/ (- (+ c b) (- c c)) (- (pick 2 0 2) (* 3 1))) (pick (+ b c) a (+ b c)))) (pick (* b 1) (pick (pick a b a) 2 (/ a (- c a))) (pick (pick c a b) (- (+ a a) (- b a)) (- (pick c 2 0) (- 0 3))))) (- (pick (- (/ (- a 0) a) (* (/ (pick 3 c 2) (/ 0 c)) (- (+ 3 2) (/ 1 c)))) (pick (+ (+ 3 c) (- 0 a)) (pick 1 b 3) (+ (+ c c) 0)) (- (+ (/ a b) (+ (pick b a 2) (pick 1 b c))) (* 2 (pick 0 a 1)))) (pick (- (+ (+ (pick b 0 b) 3) (/ (* 2 c) (/ 2 1))) (+ b (/ (- b 2) (/ 3 b)))) (+ c (pick (+ 3 1) (- b a) (+ a b))) (- (* (pick 2 a a) (/ 1 (+ b 0))) (* (- c (- c c)) (- (* 0 3) (pick a 2 a)))))))))))

(simplify '(/
            a
            (pick
             (- ;; Simplifed
              (pick
               (-
                (-
                 (+
                  (+
                   (/ 1 (+ 0 b))
                   (pick 2 b a))
                  (- b (pick 2 a a)))
                 (+ (pick (+ c 2) b (- a c)) a))
                (pick (pick (pick 0 b 0) 0 (- 2 a)) c (- a (- (- 2 2) (/ b 1)))))
               (+ a (+ 2 (* (- 2 (pick 2 2 3)) (/ (pick a 0 a) (* b (+ c a))))))
               (+ (pick a (pick (- b b) (/ 3 3) (/ 3 b)) (* (pick b 3 b) (* (* c a) 1))) (+ (pick (* (+ 2 1) (+ c a)) (pick 2 2 c) c) (- b (/ (/ (/ 2 0) (pick 1 3 2)) (* (* c 2) (* b 1)))))))
              (- 0 (* (/ (/ (* (+ (pick 2 1 b) (- a (+ c b))) (* (/ (/ 1 b) b) (/ (pick a b b) a))) (/ (- (+ (+ 0 c) (+ 0 a)) 2) 1)) a) a)))
             (+ ;; Simplifed
              (/
               (+
                (+
                 (/ (pick (* (- 2 c) (+ 3 3)) (- (- 3 a) (* 1 2)) (/ (pick c 0 a) (/ c 3))) (* (pick 3 (- 1 c) (* 1 2)) (pick (/ b c) (* a 2) (+ c 3))))
                 (- 3 (pick b (+ (+ 2 c) (pick c b b)) (- 3 (* 0 a)))))
                (+
                 (+ (+ (- b (* 0 (- b a))) (* (/ (+ 3 1) (* c b)) b)) (* b (- (+ (- 3 0) (- b 2)) (pick c 2 3))))
                 (- (- (* (+ (+ c 2) (+ b 0)) (/ 3 3)) (/ (* (+ 1 a) (- 3 a)) (/ (* 1 b) (pick c 1 2)))) (+ (+ c (/ (+ 2 b) a)) (+ (* 3 c) (/ (pick a b b) (- a c)))))))
               (/ a 3)) c)
             (/ ;; Error. Rule 12: (○ X Y) → ERROR if either X or Y is an ERROR for any arithmetic operator ○
              (/
               (/
                (-
                 (/
                  (pick (pick 3 b 0) 1 (* (pick 0 c a) (- b b)))
                  (- (pick (pick 3 3 1) 3 (- c b)) (+ 0 2)))
                 (/ ;; Error: Division By 0. Rule 9: (/ X 0) → ERROR for any X
                  (pick
                   (* (/ 0 c) (* 1 a))
                   (+ (- 1 1) (- 3 1))
                   (+ (pick b 2 b) (+ 1 a)))
                  (* ;; Becomes 0. Rule 4: (* 0 X) → 0 for any X
                   (*
                    (*
                     (* 0 2) ;; Becomes 0. Rule 4: (* 0 X) → 0 for any X
                     (/ b a))
                    (* (* 1 3) (+ c 3)))
                   (+ a 0))))
                b)
               (/
                (/ b 1)
                (pick
                 (+ (pick a (pick b a a) (/ 3 1)) a)
                 (pick (pick 2 2 3) (- (/ 2 3) (+ 2 b)) (* (/ a c) (- c a)))
                 (pick (- 2 (- 0 0)) (/ (* 1 1) (- c c)) c))))
              (*
               (*
                (-
                 (* (* (pick (- c 2) (pick b c 2) (* c b)) (pick 2 (/ 0 3) (pick b b 1))) a)
                 (pick (pick (* 1 c) (/ 3 2) (+ a 1)) (/ (- (+ c b) (- c c)) (- (pick 2 0 2) (* 3 1))) (pick (+ b c) a (+ b c))))
                (pick
                 (* b 1)
                 (pick (pick a b a) 2 (/ a (- c a)))
                 (pick (pick c a b) (- (+ a a) (- b a)) (- (pick c 2 0) (- 0 3)))))
               (-
                (pick
                 (-
                  (/ (- a 0) a)
                  (*
                   (/ ;; Error: Division By 0. Rule 9: (/ X 0) → ERROR for any X
                    (pick 3 c 2)
                    (/ 0 c)) ;; Becomes 0. Rule 14: (/ 0 X) → 0 for any X other than 0 and 1
                   (- (+ 3 2) (/ 1 c))))
                 (pick (+ (+ 3 c) (- 0 a)) (pick 1 b 3) (+ (+ c c) 0))
                 (- (+ (/ a b) (+ (pick b a 2) (pick 1 b c))) (* 2 (pick 0 a 1))))
                (pick
                 (- (+ (+ (pick b 0 b) 3) (/ (* 2 c) (/ 2 1))) (+ b (/ (- b 2) (/ 3 b))))
                 (+ c (pick (+ 3 1) (- b a) (+ a b)))
                 (- (* (pick 2 a a) (/ 1 (+ b 0))) (* (- c (- c c)) (- (* 0 3) (pick a 2 a)))))))))))

#|

(pick a (- (/ (- (/ b c) c) (/ 2 c)) (/ (* c c) (/ b (+ c 1)))) 2)
(pick a (- (/ (- (/ b c) c) (/ 2 c)) (/ (* c c) (/ b (+ c 1)))) 2)

(+ c (/ (+ (* a a) (+ a a)) (- (- 0 (pick b 3 0)) c)))
(+ c (/ (+ (* a a) (+ a a)) (- (- 0 (pick b 3 0)) c)))

(- 0 (* a (/ (/ (* (* (/ (pick a b b) a) (/ (/ 1 b) b)) (+ b (- a (+ b c)))) (- (+ a c) 2)) a))))
(- 0 (* a (/ (/ (* (+ b (- a (+ b c))) (* (/ (/ 1 b) b) (/ (pick a b b) a))) (- (+ a c) 2)) a))))
(- 0 (* a (/ (/ (* (* (/ (pick a b b) a) (/ (/ 1 b) b)) (+ b (- a (+ b c)))) (- (+ a c) 2)) a))))

(/
  a
  (pick
   (-
    (pick
     (- (- (+ (+ a (/ 1 b)) (- b a)) (+ a (pick (+ c 2) b (- a c)))) (pick (pick b 0 (- 2 a)) c (- a (- 0 b))))
     (+ a (+ 2 (* -1 (/ (pick a 0 a) (* b (+ a c))))))
     error)
    (- 0 (* a (/ (/ (* (* (/ (pick a b b) a) (/ (/ 1 b) b)) (+ b (- a (+ b c)))) (- (+ a c) 2)) a))))
   (+
    c
    (/
     (+
      (+
       (+ (* b (- (+ 3 (- b 2)) (pick c 2 3))) (+ b (* b (/ 4 (* b c)))))
       (-
        (- (+ b (+ c 2)) (/ (* (+ a 1) (- 3 a)) (/ b (pick c 1 2))))
        (+ (+ (* c 3) (/ (pick a b b) (- a c))) (+ c (/ (+ b 2) a)))))
      (+
       (- 3 (pick b (+ (+ c 2) (pick c b b)) 3))
       (/ (pick (* 6 (- 2 c)) (- (- 3 a) 2) (/ (pick c 0 a) (/ c 3))) (* 2 (pick (/ b c) (* a 2) (+ c 3))))))
     (/ a 3)))
   1))

(/
  a
  (pick
   (-
    (pick
     (- (- (+ (+ a (/ 1 b)) (- b a)) (+ a (pick (+ c 2) b (- a c)))) (pick (pick b 0 (- 2 a)) c (- a (- 0 b))))
     (+ a (+ 2 (* -1 (/ (pick a 0 a) (* b (+ a c))))))
     error)
    (- 0 (* a (/ (/ (* (* (/ (pick a b b) a) (/ (/ 1 b) b)) (+ b (- a (+ b c)))) (- (+ a c) 2)) a))))
   (+
    c
    (/
     (+
      (+
       (+ (* b (- (+ 3 (- b 2)) (pick c 2 3))) (+ b (* b (/ 4 (* b c)))))
       (-
        (- (+ b (+ c 2)) (/ (* (+ a 1) (- 3 a)) (/ b (pick c 1 2))))
        (+ (+ (* c 3) (/ (pick a b b) (- a c))) (+ c (/ (+ b 2) a)))))
      (+
       (- 3 (pick b (+ (+ c 2) (pick c b b)) 3))
       (/ (pick (* 6 (- 2 c)) (- (- 3 a) 2) (/ (pick c 0 a) (/ c 3))) (* 2 (pick (/ b c) (* a 2) (+ c 3))))))
     (/ a 3)))
   error))

(1 (3 (4 (9 () ()) (6 () ())) (8 () ())) (2 (5 () ()) (7 () ())))
       1
   3       2
 4   8    5 7
9 6

(list->heap '(3 1 5 9 8 2 7 4 6) <)
3

 1
3

 1
3 5

  1
 3 5
9

    1
 3     5
9 8

    1
 3     2
9 8   5

    1
 3     2
9 8   5 7

       1
   3       2
 4   8    5 7
9

       1
   3       2
 4   8    5 7
9 6

(9 (8 (6 (1 () ()) (4 () ())) (5 () ())) (7 (2 () ()) (3 () ())))
       9
   8       7
 6   5    2 3
1 4

(list->heap '(3 1 5 9 8 2 7 4 6) >)
3

 3
1

 5
1 3

  9
 5 3
1

    9
 8     3
1 5

    9
 8     3
1 5   2

    9
 8     7
1 5   2 3

       9
   8       7
 4   5    2 3
1

       9
   8       7
 6   5    2 3
1 4

(b (d (w () ()) (e () ())) (q (r () ()) (t () ())))
    b
 d     q
w e   r t

|#