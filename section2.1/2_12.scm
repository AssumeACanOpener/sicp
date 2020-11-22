#lang sicp

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (let ((bound1 (- (lower-bound x) (lower-bound y)))
        (bound2 (- (upper-bound x) (upper-bound y))))
    (make-interval (min bound1 bound2) (max bound1 bound2))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (if (spans-zero? y)
      (display "error:  divisor interval spans 0")
      (mul-interval x 
        (make-interval (/ 1.0 (upper-bound y))
                       (/ 1.0 (lower-bound y))))))

(define (spans-zero? interval)
  (and (negative? (lower-bound interval))
       (positive? (upper-bound interval))))

(define (make-interval a b) (cons a b))

(define (lower-bound interval) (car interval))

(define (upper-bound interval) (cdr interval))

(define (width interval )
  (/ (- (upper-bound interval)
        (lower-bound interval))
     2))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (make-center-percent center percent)
  (make-interval (- center
                    (* center percent))
                 (+ center
                    (* center percent))))

(define (percent interval)
  (/ (width interval)
     (center interval)))
