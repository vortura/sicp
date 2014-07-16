(define (square x) (* x x))


(define (smallest-divisor n)
  (find-divisor n 2))


(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor
               n
               (+ test-divisor 1)))))


(define (divides? a b)
  (= (remainder b a) 0))


(define (prime? n)
  (= n (smallest-divisor n)))


(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-time)))


(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (/ (- (time-nanosecond (current-time))
                          (time-nanosecond start-time))
                       1000.0)
                       )))


(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))


(define (search-for-primes lower upper)
  (define (search-iter cur last)
    (if (<= cur last) (timed-prime-test cur))
    (if (<= cur last) (search-iter (+ cur 2) last)))
  (if (= (remainder lower 2) 1)
      (search-iter lower upper)
      (search-iter (+ lower 1) upper)))
