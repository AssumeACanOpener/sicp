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
