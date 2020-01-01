#lang sicp

(define (cont-frac n d k)
  (define (iter i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (iter (+ i 1))))))
  (iter 1))

(define (golden-ratio k)
  (/ 1
     (cont-frac (lambda (i) 1.0)
                (lambda (i) 1.0)
                 k)))

(define (golden-ratio-iter k)
  (/ 1
     (cont-frac-iter (lambda (i) 1.0)
                     (lambda (i) 1.0)
                      k)))

(define (cont-frac-iter n d k)
  (define (iter result k)
    (if (= k 0)
        result
        (iter (/ (n k)
                 (+ (d k) result))
              (- k 1))))
  (iter 0 k))
