#lang sicp

(#%require "../common.scm")

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (= v1 v2))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (golden-ratio) 
  (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))
