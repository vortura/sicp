(define (n i) 1)

(define (d i)
  (let ((a (remainder (+ i 1) 3)))
    (if (= a 0)
        (* 2 (/ (+ i 1)
                3))
        1)))

(define (cont-frac n d k)
  (define (frac-rec i)
    (if (= i k)
        (/ (n i)
           (d i))
        (/ (n i)
           (+ (d i) (frac-rec (+ i 1))))))
  (frac-rec 1))



