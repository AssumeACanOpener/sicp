(define x (list (list 1 2) (list 3 4)))

(define (fringe input)
  (if (null? input)
      input
      (if (pair? (car input))
        (append (fringe (car input)) (fringe (cdr input)))
        (append (list (car input)) (fringe (cdr input))))))
