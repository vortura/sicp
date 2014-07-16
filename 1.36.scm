(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (newline)
      (display guess)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (func x)
  (/ (log 1000)
     (log x)))

(define (average x y)
  (/ (+ x y)
     2.0))

(define (foo x)
  (fixed-point
    (lambda (y) (average y (func y)))
    1.01))
                         