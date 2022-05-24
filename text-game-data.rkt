#lang racket
(provide nodes
         edges
         objects
         object-locations)

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
                           (frog garden)))
