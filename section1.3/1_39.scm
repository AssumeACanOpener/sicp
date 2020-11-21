#lang sicp

(#%require "../common.scm")

(define (tan-cf x k)
  (define (numer i)
    (if (= i 1)
        x
        (- (square x))))
  (define (denom i)
    (- (* i 2.0) 1.0))
  (cont-frac numer denom k))

(define (cont-frac n d k)
  (if (= k 1)
      (/ (n 1) (d 1))
      (/ (n 1)
         (+ (d 1)
            (cont-frac (lambda (x) (n (+ x 1)))
                       (lambda (x) (d (+ x 1)))
                       (- k 1))))))
