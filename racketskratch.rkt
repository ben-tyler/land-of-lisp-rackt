#lang racket


(define objects '(whiskey bucket frog chain))

(define object-locations '(
                           (whiskey living-room)
                           (bucket living-room)
                           (chain garden)
                           (from garden)))

(define (bucket) (cadr objects))
(bucket)

(define (bucket-in-living-room)
  (assoc (bucket) object-locations))
(bucket-in-living-room)

(define (at-loc-p-test? obj)
  (not (eq? obj 'bucket)))

(at-loc-p-test? "fooo")

(filter at-loc-p-test? objects)

;;(define (get-object-

;;associate object with location 
(define (get-location-of-object obj obj-locs)
  (cadr (assoc obj obj-locs)))
"FOOOO"
(associate-object-with-location 'bucket object-locations) 

(define (objects-at loc objs obj-locs)
  (define (at-loc-p? obj)
    (not (eq? obj 'bucket)))
  (filter at-loc-p? objs))

(objects-at 'garden objects object-locations)
