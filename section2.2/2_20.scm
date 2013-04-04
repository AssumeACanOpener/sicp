(define (same-parity first . rest)
  (define (iter new-list rest)
    (if (null? rest)
        new-list
        (if (test-same-parity? first (car rest))
            (iter (append new-list (list (car rest))) (cdr rest))
            (iter new-list (cdr rest)))))
  (iter (list first) rest))

(define (test-same-parity? x y)
  (or (and (even? x)
           (even? y))
      (and (odd? x)
           (odd? y))))

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))
