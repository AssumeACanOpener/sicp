#lang sicp

(define (aproximate-e k)
  (+ 2
     (cont-frac (lambda (x) 1.0)
                (lambda (x)
                  (if (= (modulo (+ x 1) 3) 0)
                      (* (/ (+ x 1) 3) 2)
                      1.0))
                k)))

(define (cont-frac n d k)
  (if (= k 1)
      (/ (n 1) (d 1))
      (/ (n 1)
         (+ (d 1)
            (cont-frac (lambda (x) (n (+ x 1)))
                       (lambda (x) (d (+ x 1)))
                       (- k 1))))))
