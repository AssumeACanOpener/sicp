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

