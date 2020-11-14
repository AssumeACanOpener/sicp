#lang sicp
(#%require "../common.scm")

(define (cube-root x)

  (define (good-enough? guess)
    (= guess (improve guess)))

  (define (improve guess)
    (/ (+ (/ x (square guess)) (* 2 guess)) 3))

  (define (iter guess)
    (if (good-enough? guess)
        guess
        (iter (improve guess))))

  (iter 1.0))
