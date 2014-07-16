(define (length items)
  (if (null? items)
    0
    (+ 1 (length (cdr items)))))

(define (last-pair l)
  (let ((rest (cdr l)))
    (if (null? rest)
        l
        (last-pair rest))))

(define (reverse l)
  (define (worker rev rest)
    (if (null? rest)
        rev
        (worker (cons (car rest) rev) (cdr rest))))
  (worker (list (car l)) (cdr l)))
