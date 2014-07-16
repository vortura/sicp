(define (same-parity l)
  (let ((par-check
          (if (even? (car l))
              even?
              odd?)))
    (define (par-iter res l)
      (if (null? l)
          res
          (if (par-check (car l))
              (par-iter (cons (car l) res) (cdr l))
              (par-iter res (cdr l)))))
    (reverse (par-iter (list (car l)) (cdr l)))))

  

