#lang sicp

(define get 2d-get)
(define put 2d-put!)

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (deriv exp var)
   (cond ((number? exp) 0)
         ((variable? exp) (if (same-variable? exp var) 1 0))
         (else ((get 'deriv (operator exp)) (operands exp)
                                            var))))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

(define (install-sum-deriv)
  ;;Internal
  (define (=number? a b)
    (if (and (number? a) (number? b))
      (eq? a b)
      false))
  (define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2)) (+ a1 a2))
          (else (list '+ a1 a2))))
  (define (addend s) (car s))
  (define (augend s) (cadr s))
  ;;Interface
  (put 'deriv '+
    (lambda (operands var)
      (make-sum (deriv (addend operands) var)
                (deriv (augend operands) var))))
  'done)

(define (install-product-deriv)
  ;;Internal
  (define (=number? a b)
    (if (and (number? a) (number? b))
      (eq? a b)
      false))
  (define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2)) (+ a1 a2))
          (else (list '+ a1 a2))))
  (define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
          ((=number? m1 1) m2)
          ((=number? m2 1) m1)
          ((and (number? m1) (number? m2)) (* m1 m2))
          (else (list '* m1 m2))))
  (define (multiplier s) (car s))
  (define (multiplicand s) (cadr s))
  ;;Interface
  (put 'deriv '*
    (lambda (operands var)
      (make-sum (make-product (deriv (multiplier operands) var)
                              (multiplicand operands))
                (make-product (deriv (multiplicand operands) var)
                              (multiplier operands)))))
  'done)

(define (install-exponentiation-deriv)
  ;;Internal
  (define (=number? a b)
    (if (and (number? a) (number? b))
      (eq? a b)
      false))
  (define (exponentiation? x)
    (and (pair? x) (eq? (car x) '**)))
  (define (base e) (car e))
  (define (exponent e) (cadr e))
  (define (make-exponentiation b e)
    (cond ((=number? b 0) 0)
          ((=number? e 0) 1)
          ((=number? e 1) b)
          ((and (number? b) (number? e)) (expt b e))
          (else (list '** b e))))
  (define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
          ((=number? m1 1) m2)
          ((=number? m2 1) m1)
          ((and (number? m1) (number? m2)) (* m1 m2))
          (else (list '* m1 m2))))
  ;;Interface
  (put 'deriv '**
    (lambda (operands var)
      (make-product
        (make-product
          (exponent operands)
          (make-exponentiation (base operands)
                               (+ (exponent operands) (- 1))))
        (deriv (base operands) var))))
  'done)
