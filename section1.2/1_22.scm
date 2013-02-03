(define (search-for-primes start end)
  (define (search-iter current end)
    (cond ((> current end)
            (newline) (display "done"))
          (else (cond ((prime? current)
                        (newline)
                        (display current)
                        (display " is prime.")))
                (search-iter (+ current 1) end))))
  (search-iter start end))

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