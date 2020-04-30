#lang sicp

(define (tan-cf x k)
  (let ((xsq (* x x)))
    (cont-frac (lambda (i)
                 (if (= i 1)
                     x
                     (- xsq)))
               (lambda (i) (- (* i 2) 1))
               k)))

(define (cont-frac n d k)
  (if (= k 1)
      (/ (n 1) (d 1))
      (/ (n 1)
         (+ (d 1)
            (cont-frac (lambda (x) (n (+ x 1)))
                       (lambda (x) (d (+ x 1)))
                       (- k 1))))))
