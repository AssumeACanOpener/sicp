#lang sicp

(#%provide tolerance)
(define tolerance .0001)

(#%provide identity)
(define (identity x) x)

(#%provide square)
(define (square x) (* x x))

(#%provide cube)
(define (cube x) (* x x x))

(#%provide average)
(define (average x y) (/ (+ x y) 2))

(#%provide double)
(define (double x) (+ x x))

(#%provide halve)
(define (halve x) (/ x 2))

(#%provide divides?)
(define (divides? x y) (= (remainder y x) 0))
