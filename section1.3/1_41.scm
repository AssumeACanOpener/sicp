#lang sicp

(#%require "../common.scm")

(define (double f)
  (lambda (x) (f (f x))))
