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

(define (segment-length segment)
  (sqrt (+ (square (- (x-point (end-segment segment))
                      (x-point (start-segment segment))))
           (square (- (y-point (end-segment segment))
                      (y-point (start-segment segment)))))))

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

; Constructor from 2 points, which form a diagonal
(define (make-rectangle p1 p2)
  (cons (make-segment p1 (make-point (x-point p2) (y-point p1)))
        (make-segment p1 (make-point (x-point p1) (y-point p2)))))

; Constructor from 2 sides of a rectangle, both starting from the same point
(define (make-rectangle2 side1 side2)
  (cons side1 side2))

(define (side1 rectangle)
  (car rectangle))

(define (side2 rectangle)
  (cdr rectangle))

(define (rectangle-area rectangle)
  (* (rectangle-length rectangle) (rectangle-width rectangle)))

(define (rectangle-perimeter rectangle)
  (+ (* (rectangle-length rectangle) 2) (* (rectangle-width rectangle) 2)))

(define (rectangle-length rectangle)
  (segment-length (side1 rectangle)))

(define (rectangle-width rectangle)
  (segment-length (side2 rectangle)))
