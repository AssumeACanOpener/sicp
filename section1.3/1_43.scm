#lang sicp

(#%require "../common.scm")

(define (repeated proc n)
  (lambda (x)
    (if (= n 1)
        (proc x)
        (proc ((repeated proc (- n 1)) x)))))
