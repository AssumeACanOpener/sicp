#lang sicp

;;;;;;;;;;;;;;;;
; exercise 1.1 ;
;;;;;;;;;;;;;;;;
;10
;(+ 5 3 4)
;(- 9 1)
;(/ 6 2)
;(+ (* 2 4) (- 4 6))
;(define a 3)
;(define b (+ a 1))
;(+ a b (* a b))
;(= a b)
;(if (and (> b a) (< b (* a b)))
;    b
;    a)
;(cond ((= a 4) 6)
;      ((= b 4) (+ 6 7 a))
;      (else 25))
;(+ 2 (if (> b a) b a))
;(* (cond ((> a b) a)
;         ((< a b) b)
;         (else -1))
;   (+ a 1))

;;;;;;;;;;;;;;;;
; exercise 1.2 ;
;;;;;;;;;;;;;;;;
;(/ (+ 5
;      4
;      (- 2
;         (- 3
;            (+ 6
;               (/ 4 5)))))
;   (* 3
;      (- 6 2)
;      (- 2 7)))

;;;;;;;;;;;;;;;;
; exercise 1.3 ;
;;;;;;;;;;;;;;;;
(define (largest-sum-of-squares x y z)

  (define (square x) (* x x))

  (define (sum-of-squares x y)
    (+ (square x) (square y)))

  (cond ((and (>= x y) (>= y z)) (sum-of-squares x y))
        ((and (>= x y) (>= z y)) (sum-of-squares x z))
        (else (sum-of-squares y z))))

;;;;;;;;;;;;;;;;
; exercise 1.7 ;
;;;;;;;;;;;;;;;;
(define (newton-sqrt x)

  (define (average x y)
    (/ (+ x y) 2))

  (define (improve guess x)
    (average (/ x guess) guess))

  (define (square x) (* x x))
  
  ; Original good-enough? function
  ;(define (good-enough? guess x)
  ;  (< (abs (- (square guess) x)) 0.001))

  ; New good-enough? checks the percent difference
  (define (good-enough? guess x)
    (< (abs (- 1 (/ (square guess) x))) .001))
  
  (define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))

  (sqrt-iter 1.0 x))

;;;;;;;;;;;;;;;;
; exercise 1.8 ;
;;;;;;;;;;;;;;;;
(define (cube-root x)

  (define (square x) (* x x))

  (define (cube x) (* x x x))

  (define (good-enough? guess x)
    (< (abs (- 1 (/ (cube guess) x))) .0000000000000001))

  (define (improve guess x)
    (/ (+ (/ x (square guess)) (* 2 guess)) 3))

  (define (iter guess x)
    (if (good-enough? guess x)
        guess
        (iter (improve guess x) x)))

  (iter 1.0 x))

;;;;;;;;;;;;;;;;;
; exercise 1.11 ;
;;;;;;;;;;;;;;;;;
(define (recursive-f n)
  (if (< n 3)
      n
      (+ (recursive-f (- n 1))
         (* 2 (recursive-f (- n 2)))
         (* 3 (recursive-f (- n 3))))))

(define (iterative-f n)
  (define (iter f-3 f-2 f-1 count)
    (if (> count n)
        f-1
        (iter f-2
              f-1
              (+ f-1
                 (* 2 f-2)
                 (* 3 f-3))
              (+ count 1))))
  
  (if (< n 3)
      n
      (iter 0 1 2 3)))

;;;;;;;;;;;;;;;;;
; exercise 1.12 ;
;;;;;;;;;;;;;;;;;
(define (pascal-triangle row column)
  (if (or (<= column 1) (>= column row))
      1
      (+ (pascal-triangle (- row 1) (- column 1))
         (pascal-triangle (- row 1) column))))

;;;;;;;;;;;;;;;;;
; exercise 1.16 ;
;;;;;;;;;;;;;;;;;
(define (iterative-fast-expt b n)
  (define (iter a b n)
    (cond ((= n 0) a)
          ((even? n) (iter a (* b b) (/ n 2)))
          (else (iter (* a b) b (- n 1)))))
  (iter 1 b n))

;;;;;;;;;;;;;;;;;
; exercise 1.17 ;
;;;;;;;;;;;;;;;;;
(define (fast-* a b)

  (define (double n) (+ n n))

  (define (halve n) (/ n 2))
  
  (cond ((= b 0) 0)
        ((even? b) (fast-* (double a) (halve b)))
        (else (+ a (fast-* a (- b 1))))))

;;;;;;;;;;;;;;;;;
; exercise 1.18 ;
;;;;;;;;;;;;;;;;;
(define (iterative-fast-* a b)

  (define (double n) (+ n n))

  (define (halve n) (/ n 2))
 
  (define (iter a b result)
    (cond ((= b 0) result)
          ((even? b) (iter (double a) (halve b) result))
          (else (iter a (- b 1) (+ result a)))))
  
  (iter a b 0))

;;;;;;;;;;;;;;;;;
; exercise 1.19 ;
;;;;;;;;;;;;;;;;;
(define (logrithmic-fib n)

  (define (square x) (* x x))
  
  (define (fib-iter a b p q count)
    (cond ((= count 0) b)
          ((even? count) (fib-iter a
                                   b
                                   (+ (square p) (square q))
                                   (+ (* 2 p q) (square q))
                                   (/ count 2)))
          (else (fib-iter (+ (* b q) (* a q) (* a p))
                          (+ (* b p) (* a q))
                          p
                          q
                          (- count 1)))))
  
  (fib-iter 1 0 0 1 n))

;;;;;;;;;;;;;;;;;;;;;;;;;;
; exercise 1.22 and 1.23 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (prime? n)

  (define (square x) (* x x))

  (define (divides? a b) (= (remainder b a) 0))

  (define (next n)
    (if (= n 2)
        3
        (+ n 2)))

  (define (find-divisor n test-divisor)  
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (next test-divisor))))) ;; changed for 1.23

  (define (smallest-divisor n) (find-divisor n 2))

  (= n (smallest-divisor n)))

(define (search-for-primes start finish)

  (define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))

  (define (start-prime-test n start-time)
    (if (prime? n) (report-prime (- (runtime) start-time))))

  (define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (runtime)))

  (timed-prime-test start)
  (if (>= start finish)
      (begin (newline)
             (display "Done"))
      (search-for-primes (+ start 2) finish)))

;;;;;;;;;;;;;;;;;
; exercise 1.24 ;
;;;;;;;;;;;;;;;;;
(define (fast-prime? n times)

  (define (square x) (* x x))

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

(define (timed-fast-prime n)

  (define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))

  (define (start-prime-test n start-time)
    (if (fast-prime? n 100) (report-prime (- (runtime) start-time))))
  
  (newline)
  (display n)
  (start-prime-test n (runtime)))