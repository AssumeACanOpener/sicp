#lang sicp
(#%require "../common.scm")

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (iter-product term a next b)
  (define (iter current result)
    (if (> current b)
        result
        (iter (next current) (* (term current) result))))
  (iter a 1))

(define (compute-pi num-terms)
  (define (pi-term n)
    (if (even? n)
        (/ n (+ n 1))
        (/ (+ n 1) n)))
  (* 4.0
     (iter-product pi-term 2 inc num-terms)))

(define pi (compute-pi 10000))

(define (factorial n)
  (product identity 1 inc n))


