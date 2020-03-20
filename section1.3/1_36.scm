#lang sicp

(#%require "../common.scm")

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display "Current guess: ")
      (display guess)
      (newline)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (without-average-damping)
  (fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0))

(define (with-average-damping)
  (fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2.0))