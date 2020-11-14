#lang sicp
(#%require "../common.scm")

(define (heron-sqrt x)

  (define (improve guess)
    (average (/ x guess) guess))
  
  ; Original good-enough? function
  ;(define (good-enough? guess)
  ;  (< (abs (- (square guess) x)) tolerance))

  ; New good-enough?
  ; True when improve doesn't change the guess.
  (define (good-enough? guess)
    (= guess (improve guess)))
  
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))

  (sqrt-iter 1.0))
