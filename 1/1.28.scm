; Test that Carmichael numbers fool the Fermat primality test.

(define (square x) (* x x))

(define (mr-expmod base exp m)
  (define (squaremod-with-check x)
    (define (check-nontrivial-sqrt1 x square)
      (if (and (= square 1)
               (not (= x 1))
               (not (= x (- m 1))))
          0
          square))
    (check-nontrivial-sqrt1 x (remainder (square x) m)))
  (cond ((= exp 0) 1)
        ((even? exp)
          (squaremod-with-check (mr-expmod base (/ exp 2) m)))
        (else
         (remainder 
          (* base (mr-expmod base (- exp 1) m))
          m))))

(define (fermat-test base exp m)
  (= (expmod base exp m) base))

