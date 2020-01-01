#lang sicp

(define nil '())

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init sequence)
  (if (null? (car sequence)) 
      nil
      (cons (accumulate op init (map car sequence))
            (accumulate-n op init (map cdr sequence)))))

(define v1 (list 1 2 3 4))

(define v2 (list 10 20 30 40))

(define v3 (list 10 10 10))

(define m1 (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))

(define identity-3x3 (list (list 1 0 0) (list 0 1 0) (list 0 0 1)))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product row v)) m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row) (matrix-*-vector cols row))
         m)))
