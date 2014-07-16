(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one 
  (add-1 zero))

(define two
  (add-1 one))

; (add-1 zero)
; (lambda (f) (lambda (x) (f ((zero f) x))))
; (lambda (f) (lambda (x) (f x)))

(define one
  (lambda (f) (lambda (x) (f x))))

; (add-1 one)
; (lambda (f) (lambda (x) (f ((one f) x))))
; (lambda (f) (lambda (x) (f (f x))))
(define two
  (lambda (f) (lambda (x) (f (f x)))))

(define (sum a b)
  (lambda (f) 
    (lambda (x)
      ((a f) ((b f) x)))))
