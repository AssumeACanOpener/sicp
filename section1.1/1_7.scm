#lang sicp
(#%require "../common.scm")

(define (newton-sqrt x)

  (define (improve guess)
    (average (/ x guess) guess))
  
  ; Original good-enough? function
  ;(define (good-enough? guess x)
  ;  (< (abs (- (square guess) x)) 0.001))

  ; New good-enough? checks the percent difference
  (define (good-enough? guess)
    (< (abs (- 1 (/ (square guess) x))) .00001))
  
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))

  (sqrt-iter 1.0))
