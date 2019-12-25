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
(define (square x) (* x x))
(define (sum_of_squares x y)
  (+ (square x) (square y))
)

(define (largest_sum_of_squares x y z)
  (cond ((and (>= x y) (>= y z)) (sum_of_squares x y))
        ((and (>= x y) (>= z y)) (sum_of_squares x z))
        (else (sum_of_squares y z))
  )
)

;;;;;;;;;;;;;;;;
; exercise 1.7 ;
;;;;;;;;;;;;;;;;
(define (average x y)
  (/ (+ x y) 2)
)

(define (improve guess x)
  (average (/ x guess) guess)
)

(define (good-enough? guess x)
  (< (abs (- 1 (/ (square guess) x))) .001)
)

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)
  )
)

(define (sqrt x) (sqrt-iter 1.0 x))

;;;;;;;;;;;;;;;;
; exercise 1.8 ;
;;;;;;;;;;;;;;;;
(define (cube-root x) (cube-root-iter 1.0 x))

(define (cube-root-iter guess x)
  (if (cube-good-enough? guess x)
      guess
      (cube-root-iter (cube-root-improve guess x) x)
  )
)

(define (cube-good-enough? guess x)
  (< (abs (- 1 (/ (cube guess) x))) .000000001)
)

(define (cube-root-improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3)
)

(define (cube x) (* x x x))

;;;;;;;;;;;;;;;;;
; exercise 1.11 ;
;;;;;;;;;;;;;;;;;
(define (recursive-1-11 n)
  (if (< n 3)
      n
      (+ (recursive-1-11 (- n 1))
         (* 2 (recursive-1-11 (- n 2)))
         (* 3 (recursive-1-11 (- n 3)))
      )
  )
)

(define (iterative-1-11 n)
  (define (iter f-3 f-2 f-1 count)
    (if (> count n)
        f-1
        (iter f-2 f-1 (+ f-1
                         (* 2 f-2)
                         (* 3 f-3)
                      )
              (+ count 1)
        )
    )
  )
  (if (< n 3)
      n
      (iter 0 1 2 3)
  )
)

;;;;;;;;;;;;;;;;;
; exercise 1.12 ;
;;;;;;;;;;;;;;;;;
(define (pascal-triangle row column)
  (if (or (<= column 1) (>= column row))
      1
      (+ (pascal-triangle (- row 1) (- column 1))
         (pascal-triangle (- row 1) column)
      )
  )
)

;;;;;;;;;;;;;;;;;
; exercise 1.16 ;
;;;;;;;;;;;;;;;;;
(define (iterative-fast-expt b n)
  (define (iter a b n)
    (cond ((= n 0) a)
          ((even? n) (iter a (* b b) (/ n 2)))
          (else (iter (* a b) b (- n 1)))
    )
  )
  (iter 1 b n)
)

;;;;;;;;;;;;;;;;;
; exercise 1.17 ;
;;;;;;;;;;;;;;;;;
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

;;;;;;;;;;;;;;;;;
; exercise 1.18 ;
;;;;;;;;;;;;;;;;;
(define (iterative-fast-* a b)
  (define (iter a b result)
    (cond ((= b 0) result)
          ((even? b) (iter (double a) (halve b) result))
          (else (iter a (- b 1) (+ result a)))))
  (iter a b 0))

;;;;;;;;;;;;;;;;;
; exercise 1.19 ;
;;;;;;;;;;;;;;;;;
(define (logrithmic-fib n)
  (fib-iter 1 0 0 1 n))

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

;;;;;;;;;;;;;;;;;
; exercise 1.22 ;
;;;;;;;;;;;;;;;;;
(define (prime? n)
  (= n (smallest-divisor n)))
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))

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