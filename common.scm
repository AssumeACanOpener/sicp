#lang sicp

(#%provide tolerance)
(define tolerance .000001)

(#%provide identity)
(define (identity x) x)

(#%provide square)
(define (square x) (* x x))

(#%provide cube)
(define (cube x) (* x x x))

(#%provide average)
(define (average . values)
  (define (sum s)
    (if (null? s)
        0
        (+ (car s) (sum (cdr s)))))
  
  (/ (sum values) (length values)))

(#%provide double)
(define (double x) (+ x x))

(#%provide halve)
(define (halve x) (/ x 2))

(#%provide divides?)
(define (divides? x y) (= (remainder y x) 0))

(#%provide prime?)
(define (prime? n)
  (define (smallest-divisor n)
    (find-divisor n 2))

  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (inc test-divisor)))))
  
  (and (not (= n 1)) (= n (smallest-divisor n))))