(define nil '())

(define (square n) (* n n))

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (square-list1 items)
  (if (null? items)
      nil
      (cons (square (car items))
            (square-list1 (cdr items)))))

(define (square-list2 items)
  (map (lambda (x) (square x)) items))
