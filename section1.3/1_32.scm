#lang sicp
(#%require "../common.scm")

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iterative combiner null-value term a next b)
  (define (iter current result)
    (if (> current b)
        result
        (iter (next current) (combiner (term current) result))))
  (iter a null-value))

(define (product term a next b)
  (accumulate-iterative * 1 term a next b))

(define (sum term a next b)
  (accumulate-iterative + 0 term a next b))

(define (factorial n)
  (product identity 1 inc n))
