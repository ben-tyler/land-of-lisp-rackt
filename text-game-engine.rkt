#lang racket
(require "text-game-data.rkt")

(define location 'living-room)
(define inventory '())

(define (describe-location location nodes)
  (cadr (assoc location nodes)))

(define (describe-path edge)
  `(there is a ,(caddr edge) going ,(cadr edge) from here.))

(define (describe-paths location edges)
  (apply append 
         (map (λ (edge) (describe-path edge))
              (cdr (assoc location edges)))))

(define (objects-at loc objs obj-locs)
  (define (get-location-of-object current-obj)
        (cadr (assoc current-obj obj-locs))) 
  (define (at-loc-p? obj)
    (eq? loc (get-location-of-object obj)))
  (filter at-loc-p? objs))

(define (describe-objects loc objs obj-loc)
  (define (describe-obj obj)
    `(you see a ,obj on the floor.))
  (apply append
         (map describe-obj (objects-at loc
                                       objs
                                       obj-loc))))


(define (look)
  (~a (append (describe-location location
                                 nodes)
              (describe-paths location
                              edges)
              (describe-objects location
                                objects
                                object-locations))))


(define (walk direction)
  (define (get-available-paths)
    (cdr (assoc location edges)))
  (define (find-direction)
    (findf (λ (i) (eq? (cadr i) direction))(get-available-paths)))
  (cond [(not (eq? (find-direction) #f)) (begin
                                           (set! location (car (find-direction))))
                                         (look)]
        [else '(you can not go that way)]))

(define (pickup object)
  (cond [(member object
                 (objects-at location objects object-locations))
         (begin
           (set! inventory (cons `( ,object . body ) object-locations)))
         (printf (~a `(you are now carrying the ,object)))
         ]
        [else '(you can not get that)]))

(pickup 'whiskey)
(define (game-repl)
  ;;(loop (print (eval (read)))))
  (define (cmd) (game-read))
  (game-print (game-eval cmd))
  