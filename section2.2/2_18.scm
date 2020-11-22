#lang sicp

(define a (list 1 2 3 4))

(define (reverse s)
  (if (null? s)
      s
      (append (reverse (cdr s))
              (list (car s)))))
