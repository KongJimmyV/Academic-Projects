#lang racket

(require "simplify.rkt")

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