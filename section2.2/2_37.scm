(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init sequence)
  (if (null? (car sequence)) 
      '()
     (cons (accumulate op init (map car sequence))
            (accumulate-n op init (map cdr sequence)))))

(define v1 (list 1 2 3 4))

(define v2 (list 10 20 30 40))

(define m1 (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))

(define identity (list (list 1 0 0) (list 0 1 0) (list 0 0 1)))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

;(define (matrix-*-vector m v)
;  (map <??> m))

;(define (transpose mat)
;  (accumulate-n <??> <??> mat))

;(define (matrix-*-matrix m n)
;  (let ((cols (transpose n)))
;    (map <??> m)))
