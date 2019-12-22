(define (iterative-fast-* a b)
  (define (iter a b result)
    (cond ((= b 0) result)
          ((even? b) (iter (double a) (halve b) result))
          (else (iter a (- b 1) (+ result a)))))
  (iter a b 0))

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))
