#lang sicp

(define set1 (list 1 2 3 4 5))
(define set2 (list 3 4 5 6 7 8 9))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
      '()    
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1
                     (intersection-set (cdr set1)
                                       (cdr set2))))
              ((< x1 x2)
               (intersection-set (cdr set1) set2))
              ((< x2 x1)
               (intersection-set set1 (cdr set2)))))))

(define (adjoin-set x set)
  (cond ((null? set)  (cons x set))
        ((> x (car set))
          (cons (car set) (adjoin-set x (cdr set))))
        ((= x (car set)) set)
        (else (cons x set))))

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        ((= (car set1) (car set2))
          (cons (car set1) (union-set (cdr set1) (cdr set2))))
        ((< (car set1) (car set2))
          (cons (car set1) (union-set (cdr set1) set2)))
        (else (cons (car set2) (union-set (cdr set2) set1)))))
