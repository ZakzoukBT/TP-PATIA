;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; hanoi towers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain HANOI)
  (:requirements :strips :typing)
  (:types object tower)
  (:predicates
	       (clear ?x - object)                ;clear : Spécifie que l'objet ?x est en haut de la pile
	       (handempty)                        ;handempty : Spécifie que vous ne tenez aucun objet
	       (holding ?x - object)              ;holding : Spécifie que vous tenez un objet ?x
         (smaller ?x - object ?y - object)    ;smaller : Spécifie que l'objet ?x est plus petit que l'objet ?y
         (on ?x - object ?y - object)         ;on : Spécifie que l'objet ?x est au dessus de l'objet ?y
         (ontower ?x - object ?y - tower)     ;ontower : Spécifie que l'object ?x est sur la tour ?y
	       )

  ;unstack : Enlève un objet ?x de la pile pour le porter dans ses mains laissant apparaitre l'objet ?y sur la pile
  (:action unstack
	     :parameters (?x - object ?y - object)
	     :precondition (and (clear ?x) (on ?x ?y) (handempty))
	     :effect
	     (and (not (on ?x ?y))
		   (not (clear ?x))
		   (not (handempty))
		   (holding ?x)
       (clear ?y)))

  ;stack : Pose l'objet ?x sur l'objet ?y sachant que ?x est plus petit que ?y
  (:action stack
	     :parameters (?x - object ?y - object)
	     :precondition (and (holding ?x) (clear ?y) (smaller ?x ?y))
	     :effect
	     (and (not (holding ?x))
       (not (clear ?y))
		   (clear ?x)
		   (handempty)
       (on ?x ?y)))

  ;put-down : Pose l'objet ?x sur la tour vide ?y
  (:action put-down
	     :parameters (?x - object ?y - tower)
	     :precondition (and (holding ?x) (clear ?y))
	     :effect
	     (and (not (holding ?x))
		   (not (clear ?y))
		   (clear ?x)
		   (handempty)
		   (ontower ?x ?y)))

  ;pick-up : Enlève le dernier objet ?x de la tour ?y
  (:action pick-up
	     :parameters (?x - object ?y - tower)
	     :precondition (and (ontower ?x ?y) (clear ?x) (handempty))
	     :effect
	     (and (holding ?x)
		   (clear ?y)
		   (not (clear ?x))
		   (not (handempty))
		   (not (ontower ?x ?y)))))
