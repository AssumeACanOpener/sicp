#lang sicp

(define (cont-frac n d k)
  (define (iter i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (iter (+ i 1))))))
  (iter 1))

(define (e k)
  (+ 2
     (cont-frac (lambda (i) 1.0)
                (lambda (i) 
                  (if (= (remainder (+ i 1) 3) 0)
                      (* (/ (+ i 1) 3) 2)
                       1))
                 k)))
