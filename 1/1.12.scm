(define (pascal x y)
  (cond ((< x y) -1)
        ((= x y) 1)
        ((= y 1) 1)
        (else (+ (pascal (- x 1) (- y 1)) 
                 (pascal (- x 1) y)))))
