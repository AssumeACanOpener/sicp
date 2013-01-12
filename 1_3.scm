(define (sum-of-squares-of-largest n1 n2 n3)
  (cond ((and (> n1 n3) (> n2 n3)) (sum-of-squares n1 n2))
        ((and (> n1 n2) (> n3 n2)) (sum-of-squares n1 n3))
        (else (sum-of-squares n2 n3))))

(define (sum-of-squares n1 n2) (+ (square n1) (square n2)))

(define (square n) (* n n))
