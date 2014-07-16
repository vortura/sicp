(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? a b)
  (< (abs (- a b)) 1.e-6))

(define (iterative-improve test improve)
  (lambda (guess)
    (let ((improved-guess (improve guess)))
      (if (test guess improved-guess)
          improved-guess
          ((iterative-improve test improve) improved-guess))
      )))

(define (sqrt x)
  ((iterative-improve
    good-enough?
    (lambda (y)
      (/ (+ (/ x y) y) 2))) 1.0))
