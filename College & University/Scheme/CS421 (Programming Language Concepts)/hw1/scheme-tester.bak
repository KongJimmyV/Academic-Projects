#lang racket
(require "scheme.rkt")

(display "partition\n")
(partition '(1 2 3 4 5) 2) 
(partition '(1 2 3 4) 1)
(partition '(1 (2 3) (4 5) 6 7 8) 2)
(partition '(1 2 3 4) -12)

(display "interleave\n")
(interleave '(1 2 3) '(4 5 6))
(interleave '(1 2 3) '(4))
(interleave '() '(1 2))
(interleave '(a (b c) d) '((e f) 5 9))

(display "list-replace\n")
(list-replace '(a b c) 'a 3)
(list-replace '(a (a b c) c) 'a 3)
(list-replace '() 'a 3)
(list-replace '(a (a (a))) 'a '(3))

(display "remove-all\n")
(remove-all '(1 2 3 4 1 2 3 4) 3)
(remove-all '(1 1 1 1 1) 1)
(remove-all '(1 (2 3) 4 3 3) 3)
(remove-all '(1 1 1 1 1) 'x)

(display "rle\n")
(rle '(1 1 1 3 2 2 2 9 9 9 9 9 9))
(rle '(d d d #t #t 10 10 10 10 10))
(rle '(d d d d a a a a b a a a))

(display "rld\n")
(rld '((1 3) (3 1) (2 3) (9 6)))
(rld (rle '(d d d #t #t 10 10 10 10 10)))

(display "every-nth\n")
(every-nth '(0 1 2 3 4 5 6 7 8) 3 2)
(every-nth '(0 1 2 3 4 5 6 7 8) 0 4)
(every-nth '(0 1 2 3 4 5 6 7 8) 12 9)
(every-nth '(a b c d e f g h i) 3 2)

(display "running-sum\n")
(running-sum '(1 2 3))
(running-sum '())
(running-sum '(3 0 -2 3))

(display "counts\n")
(counts '(a b c c b b))
(counts '())
(counts '(1 3 c c #f))

(display "el-graph->x-graph\n")
(el-graph->x-graph '((x y) (y z) (x z)))
(el-graph->x-graph '((x y) (y z) (x z) (x b)))

(display "el-graph->x-graph\n")
(x-graph->el-graph '((x (y z)) (y (z)) (z ())))
(x-graph->el-graph '((x (y z b)) (y (z)) (z ())))
