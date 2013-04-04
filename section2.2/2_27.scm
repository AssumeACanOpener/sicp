(define (deep-reverse forward-list)
  (define (iter forward-list reverse-list)
    (if (null? forward-list)
        reverse-list
        (if (pair? (car forward-list))
            (iter (cdr forward-list)
                  (cons (deep-reverse (car forward-list))
                        reverse-list))
            (iter (cdr forward-list)
                  (cons (car forward-list)
                        reverse-list)))))
  (iter forward-list (list)))

(define a (list (list 1 2) (list 3 4)))
