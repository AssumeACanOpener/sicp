(define nil '())

(define s (list 1 2 3 4 5))

(define (last-pair s)
  (if (null? (cdr s))
      s
      (last-pair (cdr s))))

(define (reverse s)
      (if (null? (cdr s))
          s
          (append (reverse (cdr s)) (list (car s)))))


(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (no-more? coins)
  (if (null? coins)
      true
      false))

(define (first-denomination coins)
  (car coins))

(define (except-first-denomination coins)
  (cdr coins))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

(define (same-parity first . rest)
  (define (parity-matches? x y)
    (or (and (even? x)
             (even? y))
        (and (odd? x)
             (odd? y))))
  (define (parity-list s)
    (if (null? s)
        s
        (if (parity-matches? first (car s))
            (append (list (car s)) (parity-list (cdr s)))
            (parity-list (cdr s)))))
  (append (list first) (parity-list rest)))

(define (square-list items)
  (if (null? items)
      '()
      (cons (square (car items))  (square-list (cdr items)))))

(define (square-list2 items)
  (map square items))

(define (square-list3 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) 
              (cons (square (car things))
                    answer))))
  (iter items nil))

(define (square-list4 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))

(define (for-each proc s)
  (if (not (null? s))
    (begin
      (proc (car s))
      (for-each proc (cdr s)))))

(define (reverse s)
  (if (null? (cdr s))
      s
      (append (reverse (cdr s))
              (list (car s)))))

(define (deep-reverse s)
  (cond ((null? (cdr s))
          s)
        ((list? (car s))
          (append (deep-reverse (cdr s))
                  (list (deep-reverse (car s)))))
        (else
          (append (deep-reverse (cdr s))
                  (list (car s))))))

(define (fringe s)
  (if (null? s)
      s
      (if (pair? (car s))
        (append (fringe (car s)) (fringe (cdr s)))
        (append (list (car s)) (fringe (cdr s))))))