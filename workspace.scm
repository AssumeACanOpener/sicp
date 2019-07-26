#lang sicp

;the semicolon is apparently how you do comments

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
  (+ (square x) (square y)))

(define (largest_sum_of_squares x y z)
  (cond ((and (>= x y) (>= y z)) (sum_of_squares x y))
        ((and (>= x y) (>= z y)) (sum_of_squares x z))
        (else (sum_of_squares y z))))

;;;;;;;;;;;;;;;;
; exercise 1.7 ;
;;;;;;;;;;;;;;;;
(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average (/ x guess) guess))

;(define (good-enough? guess x)
;  (< (abs (- (square guess) x)) .001))

(define (good-enough? guess x)
  (< (abs (- 1 (/ (square guess) x))) .001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x) (sqrt-iter 1.0 x))

;;;;;;;;;;;;;;;;
; exercise 1.8 ;
;;;;;;;;;;;;;;;;
(define (cube-root x) (cube-root-iter 1.0 x))

(define (cube-root-iter guess x)
  (if (cube-good-enough? guess x)
      guess
      (cube-root-iter (cube-root-improve guess x) x)))

(define (cube-good-enough? guess x)
  (< (abs (- 1 (/ (cube guess) x))) .000000001))

(define (cube-root-improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (cube x) (* x x x))