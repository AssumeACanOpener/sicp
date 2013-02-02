(define (mult a b)
  (define (iter a b c)
    (cond ((= b 0) c) 
          ((even? b) (iter (double a) (halve b) c)) 
          (else (iter a (- b 1) (+ c a)))))
  (iter a b 0))

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))