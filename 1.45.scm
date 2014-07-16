(define (inc x) (+ x 1))

(define (square x) (* x x))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (average a b)
  (/ (+ a b)
     2))

(define (average-damp f)
  (lambda (x) 
    (average x (f x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

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

(define (sqrt x)
  (fixed-point
    (average-damp
      (lambda (y) (/ x y)))
    1.0))

(define (cube-root x)
  (fixed-point
    (average-damp
      (lambda (y) (/ x (square y))))
    1.0))

(define (4th-root x)
  (fixed-point
    ((repeated average-damp 2)
      (lambda (y) (/ x (* y y y))))
    1.0))

(define (pow x n)
  (if (= n 1)
      x
      (* x (pow x (- n 1)))))

(define (nth-root n x)
  (fixed-point
    ((repeated average-damp 3)
      (lambda (y) (/ x 
                     (pow y (- n 1)))))
    1.0))
