#lang sicp
(#%require "../common.scm")

(define (heron-sqrt x)

  (define (improve guess)
    (average (/ x guess) guess))
  
  ; Original good-enough? function
  ;(define (good-enough? guess)
  ;  (< (abs (- (square guess) x)) tolerance))

  ; New good-enough? checks the percent difference
  (define (good-enough? guess)
    (< (abs (- 1 (/ (square guess) x))) tolerance))
  
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))

  (sqrt-iter 1.0))
