#lang sicp

(define (golden-ratio k)
  (/ 1
     (cont-frac (lambda (i) 1.0)
                (lambda (i) 1.0)
                 k)))

(define (cont-frac n d k)
  (if (= k 1)
      (/ (n 1) (d 1))
      (/ (n 1)
         (+ (d 1)
            (cont-frac (lambda (x) (n (+ x 1)))
                       (lambda (x) (d (+ x 1)))
                       (- k 1))))))

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
