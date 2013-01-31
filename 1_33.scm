(define (filtered-accumulate filter combiner null-value term a next b)
  (if (> a b)
      null-value
      (if (filter a)
          (combiner (term a)
                    (filtered-accumulate filter combiner null-value term (next a) next b))
          (combiner null-value
                    (filtered-accumulate filter combiner null-value term (next a) next b)))))

(define (sum-of-squares-of-primes a b)
  (filtered-accumulate prime? + 0 square a inc b))

(define (square n) (* n n))

(define (inc n) (+ n 1))

(define (prime? n)
  (define (smallest-divisor n)
    (find-divisor n 2))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (define (divides? a b)
    (= (remainder b a) 0))
  (cond ((< n 3) true)
        (else (= n (smallest-divisor n)))))
