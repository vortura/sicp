(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

(define (sign n d)
  (/ (/ n (abs n))
     (/ d (abs d))))

(define (make-rat n d)
  (let ((g ((if (< d 0) - +) (gcd n d))))
    (cons (/ n g) (/ d g))))
