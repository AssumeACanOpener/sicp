#lang sicp

(define (last-pair s)
  (if (null? (cdr s))
      s
      (last-pair (cdr s))))

(define a (list 1 2 3 4))
