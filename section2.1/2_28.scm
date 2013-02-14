(define x (list (list 1 2) (list 3 4)))

(define (fringe x)
  (define (iter input output)
    (if (null? input)
        output 
        (if (pair? (car input))
            (iter (cdr input) (append output (fringe (car input))))
            (iter (cdr input) (append output (list (car input)))))))
  (iter x (list)))
