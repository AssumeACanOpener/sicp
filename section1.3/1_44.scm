#lang sicp

(#%require "../common.scm")

(define (repeated proc n)
  (lambda (x)
    (if (= n 1)
        (proc x)
        (proc ((repeated proc (- n 1)) x)))))

(define (smooth f)
  (define dx .0000001)
  (lambda (x)
    (/ (+ (f x)
          (f (+ x dx))
          (f (- x dx)))
       3.0)))
