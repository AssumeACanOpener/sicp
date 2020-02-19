#lang sicp
(#%require "../common.scm")

(define (integral f a b n)
  (define (simpsons-rule n)
    (* (/ h 3) (sum simpsons-term 0 inc n)))
  (define (simpsons-term k)
    (cond ((= k 0) (f (+ a (* k h))))
          ((= k n) (f (+ a (* k h))))
          ((odd? k) (* 4 (f (+ a (* k h)))))
          ((even? k) (* 2 (f (+ a (* k h)))))))
  (define h (/ (- b a) n))
  (simpsons-rule n))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))