#lang racket


(define objects '(whiskey bucket frog chain))

(define object-locations '(
                           (whiskey living-room)
                           (bucket living-room)
                           (chain garden)
                           (frog garden)))

#;
(define (doo)
(define (bucket) (cadr objects))
(bucket)

(define (bucket-in-living-room)
  (assoc (bucket) object-locations))
(bucket-in-living-room)

(define (at-loc-p-test? obj)
  (not (eq? obj 'bucket)))

(at-loc-p-test? "fooo")

(filter at-loc-p-test? objects)

(define (get-location-of-object obj obj-locs)
  (cadr (assoc obj obj-locs)))
(get-location-of-object 'bucket object-locations) 
  )


(define (objects-at loc objs obj-locs)

  (define (get-location-of-object current-obj)
        (cadr (assoc current-obj obj-locs))) 

  (define (at-loc-p? obj)
    (eq? loc
            (get-location-of-object obj)))

  (filter (λ (i) (at-loc-p? i)) objs))
  ;;((λ (a) (eq? a loc)) 'garden))
;;((λ (a b) (eq? a b)) 'a 'b))
;;  (filter
;;   ((λ (a b) (eq? a 'b)) '(a b c))
  ;;(filter
  ;; (λ (arg)
  ;;   (eq? (get-location-of-object arg) loc)) obj-locs))
  
  ;;(filter at-loc-p? objs))
  ;;(get-location-of-object (car objs) obj-locs)
;;  (at-loc-p? 'bucket)) ;; is th bucket in the garden?
(objects-at 'living-room objects object-locations)
