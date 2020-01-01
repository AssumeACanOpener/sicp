#lang sicp

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iterative combiner null-value term a next b)
  (define (iter combiner term next a result)
    (if (> a b)
        result
        (iter combiner term next (next a) (combiner (term a) result))))
  (iter combiner term next a null-value))

(define (product term a next b)
  (accumulate-iterative * 1 term a next b))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (inc n)
  (+ n 1))

(define (identity n) n)

(define (square n) (* n n))

(define (add-two n) (+ n 2))

(define (factorial n)
  (product identity 1 inc n))

(define (pi)
  (* 4.0
     (/ (* 2 (product square 4 add-two 199998) 200000)
        (product square 3 add-two 199999))))
