#lang sicp

(define x (list (list 1 2) (list 3 4)))

(define (fringe s)
  (cond ((null? s) s)
        ((pair? (car s))
         (append (fringe (car s)) (fringe (cdr s))))
        (else
         (append (list (car s)) (fringe (cdr s))))))
