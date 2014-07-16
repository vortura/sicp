(define (f1 n)
  (cond ((< n 3) n)
        (else
          (+ (f1 (- n 1))
             (* 2 (f1 (- n 2)))
             (* 3 (f1 (- n 3)))))))

; f(3) = f(2) + 2f(1)

; f(4) = f(3) + 2f(2) + 3f(1)
;      = f(2) + 2f(1) + 2f(2) + 3f(1)
;      = 2 + 2 + 0 + 4 + 3
;
; f(5) = f(4) + 2f(3) + 3f(2)
;      = f(3) + 2f(2) + 3f(1) + 2(f(2) + 2f(1) + 3f(0)) + 3f(2)
;      = f(2) + 2f(1) + 2f(2) + 3f(1) + 2f(2) + 4f(1) + 3f(2)
;      = 
;
; f(4) = f(3) + 3f(1)
; f(5) = f(4) + 5f(2) + 4f(1)

(define (f2 n)
  (cond ((< n 3) n)
        (else (f2-iter 2 1 0 n))))

(define (f2-iter a b c count)
  (cond ((< count 3) a)
        ((f2-iter (+ a
                     (* 2 b)
                     (* 3 c)
                     )
                  a
                  b
                  (- count 1)))))
