(define (identity x) x)

(define (inc x) (+ x 1))

(define (even? x)
  (= (remainder x 2) 0))

(define (product term a next b)
  (if (= a b)
      (term a)
      (* (term a) (product term (next a) next b))))

(define (factorial n)
  (product identity 1 inc n))

(define (wallis-term n)
  (if (even? n)
      (/ (+ n 2) (+ n 1))
      (/ (+ n 1.0) (+ n 2))))

; Use John Wallis' formula with n terms to calculate pi/4
(define (quarter-pi n)
  (product wallis-term 1 inc n))

; Iterative version of product
(define (product2 term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))
        
