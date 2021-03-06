(define (fast-expt b n)
  (fast-expt-iter 1 b n))

(define (square x) (* x x))

(define (even? n)
    (= (remainder n 2) 0))

(define (fast-expt-iter a b n)
  (cond ((= n 1) a)
        ((even? n) (fast-expt-iter (* a (square b)) b (/ n 2)))
        (else (fast-expt-iter (* a b) b (- n 1)))))
