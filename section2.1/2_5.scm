#lang sicp

(define (cons x y)
  (* (expt 2 x) (expt 3 y)))

(define (find-exponent x base)
  (define (iter current count)
    (if (= (remainder current base) 0)
      (iter (/ current base) (+ count 1))
      count))
  (iter x 0))

(define (car z)
  (find-exponent z 2))

(define (cdr z)
  (find-exponent z 3))
