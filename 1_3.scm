(define (sum_of_squares_of_largest n1 n2 n3)
  (cond ((and (> n1 n3) (> n2 n3)) (sum_of_squares n1 n2))
        ((and (> n1 n2) (> n3 n2)) (sum_of_squares n1 n3))
        (else (sum_of_squares n2 n3))))

(define (sum_of_squares n1 n2) (+ (square n1) (square n2)))

(define (square n) (* n n))
