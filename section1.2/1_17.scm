(define (fast-* a b)
  (cond ((= b 0) 0)
        ((even? b) (fast-* (double a) (halve b)))
        (else (+ a (fast-* a (- b 1))))
  )
)

(define (double n)
  (+ n n)
)

(define (halve n)
  (/ n 2)
)
