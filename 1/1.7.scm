(define (square x) (* x x))

; pow function for positive integers
(define (pow x y)
  (cond ((= y 0) 1)
        ((= y 1) x)
        (else (* x (pow x (- y 1))))))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (good-enough2 guess new-guess)
  (< (abs (- new-guess guess)) 0.001))

(define (sqrt-iter2 guess x)
  (define new-guess (improve guess x))
  (if (good-enough2 guess new-guess)
    guess
    (sqrt-iter2 new-guess x)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

; sqrt procedure
(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt2 x)
  (sqrt-iter2 1.0 x))

(define (resquare x)
  (square (sqrt x)))

(define (resquare2 x)
  (square (sqrt2 x)))

(define (error x)
  (abs (- x (resquare x))))

(define (error2 x)
  (abs (- x (resquare2 x))))

(> (error 0.0005) (error2 0.0005))

(> (error 1000000000) (error2 1000000000))
