(define (reverse l)
  (define (worker rev rest)
    (if (null? rest)
        rev
        (worker (cons (car rest) rev) (cdr rest))))
  (worker (list (car l)) (cdr l)))

(define (deep-reverse l)
  (define (worker rev rest)
    (if (null? rest)
        rev
        (worker 
          (cons (if (pair? (car rest))
                    (deep-reverse (car rest))
                    (car rest)) rev)
          (cdr rest))))
  (worker nil l))


(define x (list (list 1 2) (list 3 4)))¬
