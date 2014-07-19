(for-each 
  (lambda (x) (newline) (display x))
  (list 57 321 88))

; This was my first attempt, but it doesn't work because 'if' doesn't allow
; multiple expressions in the else clause.
(define (for-each proc list)
  (if (null? list)
      #t 
      ((proc (car list))
       (for-each proc (cdr list)))))

; Adding 'begin' allows it to work
(define (for-each proc list)
  (if (null? list)
      #t 
      (begin (proc (car list))
             (for-each proc (cdr list)))))

; As does using cond instead of if
(define (for-each proc list) 
  (cond 
    ((null? list) #t) 
    (else (proc (car list)) 
          (for-each proc (cdr list))))) 
