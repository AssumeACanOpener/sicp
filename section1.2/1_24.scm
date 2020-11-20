#lang sicp
(#%require "../common.scm")

(define (fast-prime? n times)

  (define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
          (else (remainder (* base (expmod base (- exp 1) m)) m))))

  (define (fermat-test n)
    (define (try-it a)
      (= (expmod a n n) a))
    (try-it (+ 1 (random (- n 1)))))

  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 1000)
      (report-prime (- (runtime) start-time) n)))

(define (report-prime elapsed-time n)
  (display " *** PRIME ***  ")
  (display n)
  (newline)
  (display "Elapsed: Time: ")
  (display elapsed-time)
  (newline))

(define (fast-search-for-primes start finish)
  (timed-prime-test start)
  (if (>= start finish)
      (begin (newline)
             (display "Done"))
      (fast-search-for-primes (+ start 2) finish)))