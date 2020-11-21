#lang sicp

(#%require "../common.scm")

(define (compose f g)
  (lambda (x) (f (g x))))
