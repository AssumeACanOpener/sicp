#lang sicp
(#%require "../common.scm")

(define (iterative-fast-* a b)
  
  (define (iter a b result)
    (cond ((= b 0) result)
          ((even? b) (iter (double a) (halve b) result))
          (else (iter a (- b 1) (+ result a)))))
  
  (iter a b 0))
