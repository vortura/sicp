(define (cons x y)
  (define (dispatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else
            (error "Argument not 0 or 1:
                    CONS" m))))
  dispatch)

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (x y) x)))
