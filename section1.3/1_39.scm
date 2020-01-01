#lang sicp

(define (cont-frac n d k)
  (define (iter i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (iter (+ i 1))))))
  (iter 1))

(define (tan x k)
   (cont-frac (lambda (i)
                (if (= 1 i)
                x
                (- (* x x))))
              (lambda (i) (- (* i 2) 1))
               k))
