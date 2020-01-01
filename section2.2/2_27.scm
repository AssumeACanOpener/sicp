#lang sicp

(define (deep-reverse s)
  (cond ((null? (cdr s))
          s)
        ((list? (car s))
          (append (deep-reverse (cdr s))
                  (list (deep-reverse (car s)))))
        (else
          (append (deep-reverse (cdr s))
                  (list (car s))))))

(define a (list (list 1 2) (list 3 4)))
