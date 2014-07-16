; Applicative order
;
(gcd 206 40)

(if (= 40 0)
    206
    (gcd 40 (remainder 206 40)))

(if (= 40 0)
    206
    (gcd 40 6)))

(if (= 40 0)
    206
    (if (= 6 0)
        40
        (gcd 6 (remainder 40 6))))

(if (= 40 0)
    206
    (if (= 6 0)
        40
        (gcd 6 4)))
    
(if (= 40 0)
    206
    (if (= 6 0)
        40
        (if (= 4 0)
            6
            (gcd 4 (remainder 6 4)))))

(if (= 40 0)
    206
    (if (= 6 0)
        40
        (if (= 4 0)
            6
            (gcd 4 2))))

(if (= 40 0)
    206
    (if (= 6 0)
        40
        (if (= 4 0)
            6
            (if (= 2 0)
              2
              (gcd 2 (remainder 4 2))))))

(if (= 40 0)
    206
    (if (= 6 0)
        40
        (if (= 4 0)
            6
            (if (= 2 0)
              2
              (gcd 2 0)))))

; Normal order
;   (if (= b 0)
;       a
;       (gcd b (remainder a b))))
;
(gcd 206 40)

(if (= 40 0) ...)
(gcd 40 (remainder 206 40))

(if (= (remainder 206 40) 0) ...)
(if (= 6 0) ...)
(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
