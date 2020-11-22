#lang sicp

(#%require "../common.scm")

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-segment start-point end-point)
  (cons start-point end-point))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (average-points p1 p2)
  (make-point (average (x-point p1) (x-point p2))
              (average (y-point p1) (y-point p2))))

(define (midpoint-segment segment)
  (average-points (start-segment segment) (end-segment segment)))
