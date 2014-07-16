; Return x^y
(define (pow x y)
  (if (= y 1)
      x
      (* x (pow x (- y 1)))))

; Return how many times x can be divided by y with remainder 0
(define (y-into-x-count x y)
  (define (iter x divisions)
    (if (= 0 (remainder x y))
        (iter (/ x y) (+ divisions 1))
        divisions))
  (iter x 0))

(define (cons a b)
  (* (pow 2 a)
     (pow 3 b)))

(define (car z) (y-into-x-count z 2))

(define (cdr z) (y-into-x-count z 3))

