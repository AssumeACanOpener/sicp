(define (iterative-fast-* a b)

  (define (double n) (+ n n))

  (define (halve n) (/ n 2))
 
  (define (iter a b result)
    (cond ((= b 0) result)
          ((even? b) (iter (double a) (halve b) result))
          (else (iter a (- b 1) (+ result a)))))
  
  (iter a b 0))
