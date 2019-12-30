#lang sicp

(#%provide square)
(define (square x) (* x x))

(#%provide cube)
(define (cube x) (* x x x))

(#%provide average)
(define (average x y) (/ (+ x y) 2))

(#%provide double)
(define (double n) (+ n n))

(#%provide halve)
(define (halve n) (/ n 2))

(#%provide divides?)
(define (divides? a b) (= (remainder b a) 0))