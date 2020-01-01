#lang sicp
(#%require "../common.scm")

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

(define (f1 x)
  (* 2 x))
