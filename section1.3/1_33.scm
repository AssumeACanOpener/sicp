#lang sicp

(#%require "../common.scm")

(define (filtered-accumulate combiner null-value term a next b filter)
  (cond ((> a b) null-value)
        ((filter a) (combiner (term a)
                              (filtered-accumulate combiner
                                                   null-value
                                                   term
                                                   (next a)
                                                   next
                                                   b
                                                   filter)))
        (else (combiner null-value
                        (filtered-accumulate combiner
                                             null-value
                                             term
                                             (next a)
                                             next
                                             b
                                             filter)))))

(define (sum-of-squares-of-primes a b)
  (filtered-accumulate + 0 square a inc b prime?))

(define (product-of-relatively-primes n)
  (define (relatively-prime? x)
    (= 1 (gcd x n)))
  (filtered-accumulate * 1 identity inc (- n 1) relatively-prime?))
