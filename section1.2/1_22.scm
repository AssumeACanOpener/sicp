(define (prime? n)

  (define (square x) (* x x))

  (define (divides? a b) (= (remainder b a) 0))

  (define (find-divisor n test-divisor)  
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))

  (define (smallest-divisor n) (find-divisor n 2))

  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes start finish)
  (timed-prime-test start)
  (if (>= start finish)
      (begin (newline)
             (display "Done"))
      (search-for-primes (+ start 2) finish)))
