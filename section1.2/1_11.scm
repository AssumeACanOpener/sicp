#lang sicp

(define (recursive-f n)
  (if (< n 3)
      n
      (+ (recursive-f (- n 1))
         (* 2 (recursive-f (- n 2)))
         (* 3 (recursive-f (- n 3))))))

(define (iterative-f n)
  (define (iter f-3 f-2 f-1 count)
    (if (> count n)
        f-1
        (iter f-2
              f-1
              (+ f-1
                 (* 2 f-2)
                 (* 3 f-3))
              (+ count 1))))
  
  (if (< n 3)
      n
      (iter 0 1 2 3)))
