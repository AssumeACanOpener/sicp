(define nil '())

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
(define (leaf? object)
  (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))
(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch
               (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))
(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit -- CHOOSE-BRANCH" bit))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)    ; symbol
                               (cdr pair))  ; frequency
                    (make-leaf-set (cdr pairs))))))

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))

(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(define (member? x l)
  (cond ((null? l) false)
        ((equal? x (car l)) true)
        (else (member? x (cdr l)))))

(define (encode-symbol symbol tree)
  (cond ((null? tree) (error "tree is null"))
        ((not (member? symbol (symbols tree)))
          (error "Symbol not found: " symbol))
        ((member? symbol (symbols (left-branch tree)))
          (if (leaf? (left-branch tree))
            (list '0)
            (append (list '0) (encode-symbol symbol (left-branch tree)))))
        (else
          (if (leaf? (right-branch tree))
            (list '1)
            (append (list '1) (encode-symbol symbol (right-branch tree)))))))

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define symbol-pair-list (list (cons 'a 4) (cons 'b 2) (cons 'c 1) (cons 'd 1)))
(define symbol-pair-list2 (list (cons 'a 4) (cons 'b 2)))
(define symbol-pair-list3 (list (cons 'a 4) (cons 'b 2) (cons 'c 1)))

(define spl (list (cons 'd 1) (cons 'c 1) (cons 'b 2) (cons 'a 4)))

(define (successive-merge leaf-set)
  (if (null? (cdr leaf-set))
    (car leaf-set)
    (successive-merge
      (adjoin-set
        (make-code-tree
          (car leaf-set)
          (cadr leaf-set))
        (cddr leaf-set)))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))
