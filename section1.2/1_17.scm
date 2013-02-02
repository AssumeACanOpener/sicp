(define (mult a b)
  (cond ((= b 0) 0)
        ((= b 1) a)
        ((even? b) (mult (double a) (halve b)))
        (else (+ a (mult a (- b 1))))))

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))
