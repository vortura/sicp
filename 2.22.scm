(define nil '())

; First version of square-list produces the list in reverse order because it
; iterates through items prepending each successive item
(define (square-list1 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))


; Second version produces an invalid list because a list should be
; nil-terminated. In this case the first item in the list is appended to nil,
; and then each subsequent list item is appended to that
(define (square-list2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))
