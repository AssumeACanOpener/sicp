(define (reverse forward-list)
  (define (iter forward-list reverse-list)
    (if (null? forward-list)
        reverse-list
        (iter (cdr forward-list)
              (cons (car forward-list)
                    reverse-list))))

  (iter forward-list (list)))

(define a (list 1 2 3 4))
