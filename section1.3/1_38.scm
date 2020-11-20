#lang sicp

(define (aprox-e num-terms)
  (define (numer x) 1.0)
  (define (denom x)
    (if (= (modulo (+ x 1) 3) 0)
        (* (/ (+ x 1) 3.0) 2.0)
        1.0))
  (+ 2 (cont-frac numer denom num-terms)))

(define (cont-frac n d k)
  (if (= k 1)
      (/ (n 1) (d 1))
      (/ (n 1)
         (+ (d 1)
            (cont-frac (lambda (x) (n (+ x 1)))
                       (lambda (x) (d (+ x 1)))
                       (- k 1))))))
