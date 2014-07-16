(define (make-interval a b) (cons a b))

(define (lower-bound i) (car i))

(define (upper-bound i) (cdr i))

(define (add-interval x y)
  (make-interval (+ (lower-bound x)
                    (lower-bound y))
                 (+ (upper-bound x)
                    (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x)
               (lower-bound y)))
        (p2 (* (lower-bound x)
               (upper-bound y)))
        (p3 (* (upper-bound x)
               (lower-bound y)))
        (p4 (* (upper-bound x)
               (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

; Return true if inclusive interval i contains x
(define (spans i x)
  (and (<= (lower-bound i) x)
       (>= (upper-bound i) x)))

(define (div-interval x y)
  (if (spans y 0)
      (error "Error dividing by an interval that spans zero.")
      (mul-interval x
        (make-interval
          (/ 1.0 (upper-bound y))
          (/ 1.0 (lower-bound y))))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x)
                    (lower-bound y))
                 (- (upper-bound x)
                    (upper-bound y))))

(define (width i)
  (/ (- (upper-bound i)
        (lower-bound i))
     2))

(define (make-centre-percent c p)
  (let ((v (* c p)))
    (make-interval (- c v) (+ c v))))

(define (centre i)
  (+ (lower-bound i)
     (width i)))

(define (percent i)
  (/ (width i)
     (centre i)))

(percent
  (mul-interval
    (make-centre-percent 2 0.1)
    (make-centre-percent 1 0.1)))

(define (display-centre-percent i)
  (display "[")
  (display (centre i))
  (display ",")
  (display (percent i))
  (display "]")
  (newline))


(define (par1 r1 r2)
  (div-interval
    (mul-interval r1 r2)
    (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
      one
      (add-interval
        (div-interval one r1)
        (div-interval one r2)))))

(display-centre-percent (par1 (make-centre-percent 1 .01) (make-centre-percent 2 0.02)))
(display-centre-percent (par2 (make-centre-percent 1 .01) (make-centre-percent 2 0.02)))

