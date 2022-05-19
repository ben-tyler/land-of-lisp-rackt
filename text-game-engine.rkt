#lang racket

(define nodes
  '(
    (living-room
     (you are in the living-room. a wizard is snoring loudly on the couch.))
    (garden
     (you are in a beautiful garden. there is a well in front of you.))
    (attic
     (you are in the attic. there is a giant welding torch in the corner.))))

(define edges '(
                (living-room (garden west door) (attic upstairs ladder))
                (garden (living-room east door))
                (attic (living-room downstairs ladder))))

(define objects '(whiskey bucket frog chain))

(define object-locations '(
                           (whiskey living-room)
                           (bucket living-room)
                           (chain garden)
                           (from garden)))

(define (describe-location location nodes)
  (cadr (assoc location nodes)))

(define (describe-path edge)
  `(there is a ,(caddr edge) going ,(cadr edge) from here.))

;;(define (describe-paths location edges)
;;  (apply #'append (mapcar #'describe-path (cdr (assoc location edges)))))

(define (describe-paths location edges)
  (apply append 
         (map (λ (edge) (describe-path edge))
              (cdr (assoc location edges)))))

;;(defun objects-at (loc objs obj-locs)
;; (labels ((at-loc-p (obj)
;; (eq (cadr (assoc obj obj-locs)) loc)))
;; (remove-if-not #'at-loc-p objs)))


(define objects-at (loc objs obj-locs)
  (define (at-loc-p? obj)
    (eq? (cadr (assoc obj obj-locs)) loc))
  (filter at-loc-p? objs))
  


;;(remove-if-not)

(describe-paths 'living-room edges)

                        

(describe-path '(garden west door))

(describe-location 'living-room nodes)
