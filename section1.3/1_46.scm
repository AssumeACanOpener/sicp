(define (average x y)
  (/ (+ x y) 2.0))

(define tolerance 0.00001)

(define (square-root x)
  (fixed-point (lambda (y) (average y (/ x  y)))
               1.0))

(define (good-enough? guess next)
  (< (abs (- guess next)) tolerance))

(define (fixed-point f first-guess)
  (iterative-improve f
                     good-enough?
                     first-guess))

(define (iterative-improve improve good-enough? first-guess)
  (define (try guess)
    (let ((next (improve guess)))
      (if (good-enough? guess next)
          next
          (try next))))
  (try first-guess))
