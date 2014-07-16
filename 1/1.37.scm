; Calculate a k-term continued fraction. n and d are functions returning the
; i'th term numerator and denominator respectively. k is the number of terms to
; calculate the fraction to. 
(define (cont-frac n d k)
  (define (frac-rec i)
    (if (= i k)
        (/ (n i)
           (d i))
        (/ (n i)
           (+ (d i) (frac-rec (+ i 1))))))
  (frac-rec 1))

; Same as the above, but as an iterative function
(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (n i)
                         (+ (d i) result)))))
  (iter k 0))


(define (phi k)
  (cont-frac-iter (lambda (i) 1.0)
                  (lambda (i) 1.0)
                  k))
