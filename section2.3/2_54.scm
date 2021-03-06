#lang sicp

(define (equal? s1 s2)
  (cond ((and (not (list? s1)) (not (list? s2)))
          (eq? s1 s2))
        ((or (null? s1) (null? s2))
          (and (null? s1) (null? s2)))
        ((and (list? s1) (list? s2))
          (and (equal? (car s1) (car s2))
               (equal? (cdr s1) (cdr s2))))
        (else false)))
