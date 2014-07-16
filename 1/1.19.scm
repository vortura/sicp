; a ← b q + a q + a p
; b ← b p + a q

; a ← (b p + a q) q + (b q + a q + a p) q + (b q + a q + a p) p
;   ← (bpq + aqq) + (bqq + aqq + apq) + (bpq + apq + app)
;   ← b (2pq + qq) + a (2pq + 2qq + pp)
;   ← b (2pq + qq) + a (2pq + 2qq) + a (pp + qq)
;
; b ← (b p + a q) p + (b q + a q + a p) q
;   ← (bpp + apq) + (bqq + aqq + apq)
;   ← bpp + 2apq + bqq + aqq
;   ← b(pp + qq) + a(2pq + qq)

; p' = pp + qq
; q' = 2pq + qq

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) 
         b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))
                   (+ (* 2 (* p q)) (* q q))
                   (/ count 2)))
        (else 
         (fib-iter (+ (* b q) 
                      (* a q) 
                      (* a p))
                   (+ (* b p) 
                      (* a q))
                      p
                      q
                      (- count 1)))))
