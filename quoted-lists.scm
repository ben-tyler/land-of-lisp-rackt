;; a lists in racket 

;a list is a frequently used lisp data structure.
;it is a list of pairs (conses) and each pair is an association
;the car is the key
;the cdr is the datum

(define (my-acons x y a)
  ;;acons construct a new association
  ;;by adding a new pair to the old list
  (cons (cons x y) a))

(define alist '( (key "datum")
                 (key2 "datum2")))


(display (assoc 'key alist))

;; alist within a lists
;; are they possible?

(define inner-alists '( (l1 (foo "bar")
                            (noo "nar"))
                        (l2 (baz "buzz"))))

;; you must get the cdr of the assoc, that is the tricket
(define nn (cdr (assoc 'l1 inner-alists)))
(display nn)
(define mm (assoc 'foo nn))
(display mm)


;; can we store functions in lists?
(define f-list `( (li ,(λ () (display "hello world")))))
(display ((car (cdr (assoc 'li f-list)))))

;;recursion through lists
(define (incrementAll myList)
  (if (null? myList)
    '()
    (cons (+ 1 (car myList))
          (incrementAll (cdr myList)))))
