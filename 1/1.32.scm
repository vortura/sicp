(define (identity x) x)

(define (inc x) (+ x 1))

(define (even? x)
  (= (remainder x 2) 0))

(define (accumulate
          combiner null-term term a next b)
  (if (> a b)
      null-term
      (combiner (term a) (accumulate
                           combiner null-term term (next a) next b))))

; Iterative accumulate
(define (accumulate2 
          combiner null-term term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-term))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (sum2 term a next b)
  (accumulate2 + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 identity a inc b))

(define (product2 term a next b)
  (accumulate2 * 1 identity a inc b))

(define (filtered-accumulate
          combiner filter null-term term a next b)
  (if (> a b) null-term
    (if (filter a)
        (combiner (term a) (filtered-accumulate
                             combiner filter null-term term (next a) next b))
        (combiner null-term (filtered-accumulate
                             combiner filter null-term term (next a) next b)))))
