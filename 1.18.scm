(define (double x) (+ x x))

(define (halve x) (/ x 2))

(define (even? x) (= (remainder x 2) 0))

(define (* x y)
  (mult-iter x y 0))

(define (mult-iter x y a)
  (cond ((= x 0) a)
        ((even? x) (mult-iter (halve x) (double y) a))
        (else (mult-iter (- x 1) y (+ a y)))))

