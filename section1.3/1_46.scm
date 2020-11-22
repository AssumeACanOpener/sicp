#lang sicp

(#%require "../common.scm")

(define (iterative-improve good-enough? improve)
  (define (iter guess)
    (if (good-enough? guess)
        guess
        (iter (improve guess))))
  iter)

(define (sqrt x)  
  (define (good-enough? guess)
    (= (square guess) x))
  (define (improve guess) (average guess (/ x guess)))
  ((iterative-improve good-enough? improve) 1.0))

(define (fixed-point f first-guess)
  (define (close-enough? x)
    (= x (f x)))
  ((iterative-improve close-enough? f) first-guess))