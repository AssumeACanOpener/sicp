(define (for-each proc items)
  (if (null? items)
      true
      ((proc (car items))
       (for-each proc (cdr items)))))
