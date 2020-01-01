#lang sicp

(define (average x y)
  (/ (+ x y) 2.0))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter repeated-f i)
    (if (= i n)
        repeated-f
        (iter (compose f repeated-f) (+ i 1))))
  (iter f 1))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define tolerance 0.00001)

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (power x y)
  (define (iter x y)
    (if (= y 0)
        1
        (* x (power x (- y 1)))))
  (iter x y))

(define (nth-root x n)
  (fixed-point ((repeated average-damp n) (lambda (y) (/ x (power y (- n 1)))))
               1.0))
