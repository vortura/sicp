(define (cube x) (* x x x))

(define (inc x) (+ x 1))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b n)
  (define (kth-term k)
    (define (coefficient k)
      (cond ((= k 0) 1)
            ((odd? k) 4)
            (else 2)))
    (* (coefficient k)
       (f (+ a (* k
                  (/ (- b a)
                     n))))))
  (* (/ (/ (- b a)
           n)
        3)
     (sum kth-term 0 inc n)))

(integral cube 0 1 100)
