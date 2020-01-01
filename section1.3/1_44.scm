#lang sicp

(define (compose f g)
  (lambda (x) (f (g x))))

(define (square x) (* x x))

(define (repeated f n)
  (define (iter repeated-f i)
    (if (= i n)
        repeated-f
        (iter (compose f repeated-f) (+ i 1))))
  (iter f 1))

(define (smooth f)
  (define dx .0000001)
  (lambda (x)
    (/ (+ (f x)
          (f (+ x dx))
          (f (- x dx)))
       3.0)))
