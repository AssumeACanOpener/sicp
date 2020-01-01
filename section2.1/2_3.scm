#lang sicp

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (squared x) (* x x))

(define (make-segment start-point end-point)
  (cons start-point end-point))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (segment-length segment)
  (sqrt (+ (squared (- (x-point (end-segment segment))
                       (x-point (start-segment segment))))
           (squared (- (y-point (end-segment segment))
                       (y-point (start-segment segment)))))))

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (make-rectangle p1 p2 p3 p4)
  (cons (make-segment p1 p2) (make-segment p1 p3)))

(define (make-rectangle2 side1 side2)
  (cons side1 side2))

(define (rectangle-area rectangle)
  (* (length rectangle) (width rectangle)))

(define (rectangle-perimeter rectangle)
  (+ (* (length rectangle) 2) (* (width rectangle) 2)))

(define (length rectangle)
  (segment-length (car rectangle)))

(define (width rectangle)
  (segment-length (cdr rectangle)))
