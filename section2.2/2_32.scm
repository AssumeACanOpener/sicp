(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (r) (cons (car s) r))  rest)))))

(define a (list 1 2 3))

(define b (list 10 20 30 40 50))
