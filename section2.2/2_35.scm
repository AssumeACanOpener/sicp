#lang sicp

(define x (cons (list 1 2) (list 3 4)))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y))
              '()
              sequence))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

(define (count-leaves t)
  (accumulate +
              0
              (map (lambda (x) 1)
                   (enumerate-tree t))))
