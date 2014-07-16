(define uk-coins (list 200 100 50 20 10 5 2 1))

(define (first-denomination l) (car l))

(define (except-first-denomination l) (cdr l))

(define (no-more? l) (null? l))

(define (cc amount coin-values)
  (cond ((= amount 0) 
         1)
        ((or (< amount 0) 
             (no-more? coin-values)) 
         0)
        (else
          (+ (cc 
              amount
              (except-first-denomination 
                coin-values))
             (cc 
              (- amount
                 (first-denomination 
                  coin-values))
              coin-values)))))
