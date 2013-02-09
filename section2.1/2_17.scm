(define (last-pair list)
  (if (null? (cdr list))
      list
      (last-pair (cdr list))))

(define a (list 1 2 3 4))
