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
