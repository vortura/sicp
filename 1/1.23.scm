; 1009 *** 6.0
; 1013 *** 7.0
; 1019 *** 6.0
;
; 10007 *** 20.0
; 10009 *** 19.0
; 10037 *** 20.0
;
; 100003 *** 74.0
; 100019 *** 61.0
; 100043 *** 60.0
;
; 1000003 *** 67
; 1000033 *** 90
; 1000037 *** 73

(define (next n)
  (if (= n 2)
      3
      (+ n 2)))


(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else (find-divisor
               n
              (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

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

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) 
         (fast-prime? n (- times 1)))
        (else false)))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (square x) (* x x))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
      (report-prime (- (runtime) start-time))))

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
