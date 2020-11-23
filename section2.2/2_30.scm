#lang sicp

(#%require "../common.scm")

(define (square-tree tree)
  (cond ((null? tree) tree)
        ((pair? tree) (cons (square-tree (car tree))
                            (square-tree (cdr tree))))
        (else (square tree))))

(define t1 (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(define t2 (list (list 3 4 5) 6 7 (list 8 9)))