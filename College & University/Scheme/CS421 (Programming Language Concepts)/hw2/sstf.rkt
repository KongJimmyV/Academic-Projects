#lang racket

;;;  Author:         Kong Jimmy Vang
;;;  File:           sstf.rkt
;;;  Project:        hw2 (Scheme Coding and Grammars - Disk Scheduling in Scheme)
;;;  Class:          CS 421
;;;  Date Created:   2/19/2021
;;;  Date Modified   2/20/2021

;;; Returns the absolute value of x.
(define (abs x)
  (cond ((< x 0) (- x))
        (else x)))

;;; Helper function for the "min-diff" function.
;;; See the "min-diff" function for more infomation.
(define (min-diff-helper queue head next-head-pos minimum minimum-index current-index)
  (cond
    ((null? queue) (list next-head-pos minimum minimum-index))
    (else (let h ((distance (abs (- head (car queue)))))
      (cond
        ((< distance minimum)
          (min-diff-helper (cdr queue)
                           head
                           (car queue)
                           distance
                           current-index
                           (+ current-index 1)))
        (else
          (min-diff-helper (cdr queue)
                           head
                           next-head-pos
                           minimum
                           minimum-index
                           (+ current-index 1))))))))

;;; Given a queue list, this function searchs for a track in the queue with the
;;;    minimum difference.
;;;
;;; This minimum difference is calculated for each element in the queue list
;;;    using: (abs (- head (car queue)))
;;;    See the "abs" (absolute value) function.
;;;
;;; Returns a list containing the following: ( <next-head-pos> <minimum> <minimum-index> ).
;;;    <next-head-pos>: The next track position for the head, closest to the original track
;;;        position of the head.
;;;    <minimum>: The absolute value of the minimum difference between the head
;;;         and the minimum difference in the queue.
;;;    <minimum-index>: The index of the queue list that contains the position with the
;;;        absolute value of the minimum difference.
(define (min-diff queue head)
  (min-diff-helper queue
                   head
                   (car queue)
                   (abs (- head (car queue)))
                   0
                   0))

;;; Removes an element from the given list "xs" at index "i".
;;; Returns a list without the element at index "i".
(define (remove-element-by-index xs i)
  (cond ((null? xs) null)
        (else (if (= i 0)
                  (cdr xs)
                  (cons (car xs) (remove-element-by-index (cdr xs) (- i 1))) ))))

;;; Returns the <LIST-OF-MOVEMENTS> for a given queue and head.
;;;    <LIST-OF-MOVEMENTS>: Denotes a list of the time-costs of each head movement.
(define (sstf-get-list-of-movements queue head)
  (cond
    ((null? queue) '())
    (else (let sstf-helper ((min-diff-list (min-diff queue head)))
            (cons (cadr min-diff-list)
                  (sstf-get-list-of-movements
                     (remove-element-by-index queue (caddr min-diff-list))
                     (car min-diff-list)))))))

;;; The Shortest-Seek-Time-First (SSTF) scheduling algorithm for disk scheduling.
;;;
;;; Returns a list containing the following: ( <AVERAGE> <TOTAL> <LIST-OF-MOVEMENTS> ).
;;;    <AVERAGE>: Denotes the average time-cost of all the head movements.
;;;    <TOTAL>: Denotes the sum of the time-costs of all head movements.
;;;    <LIST-OF-MOVEMENTS>: Denotes a list of the time-costs of each head movement.
(define (sstf queue head)
  (cond
    ((null? queue) '())
    (else (let calc-list ((list-of-movements (sstf-get-list-of-movements queue head)) )
            (let calc-total ((total (apply + list-of-movements)))
              (list (/ total (length queue))
                    total
                    list-of-movements))))))

(provide sstf)