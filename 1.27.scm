; Test that Carmichael numbers fool the Fermat primality test.

(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder 
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder 
          (* base (expmod base (- exp 1) m))
          m))))

(define (fermat-test base exp m)
  (= (expmod base exp m) base))

(define (test-carmichael n)
  (define (search-iter lower upper)
    (cond ((= lower upper) true)
          ((< lower upper) (and (fermat-test lower upper upper)
                                (search-iter (+ lower 1) upper)))))
  (search-iter 1 n))
