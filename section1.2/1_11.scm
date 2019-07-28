(define (recursive-1-11 n)
  (if (< n 3)
      n
      (+ (recursive-1-11 (- n 1))
         (* 2 (recursive-1-11 (- n 2)))
         (* 3 (recursive-1-11 (- n 3))))))

(define (iterative-1-11 n)
  (define (iter f-3 f-2 f-1 count)
    (if (> count n)
        f-1
        (iter f-2 f-1 (+ f-1
                         (* 2 f-2)
                         (* 3 f-3))
              (+ count 1))))

  (if (< n 3)
      n
      (iter 0 1 2 3)))
