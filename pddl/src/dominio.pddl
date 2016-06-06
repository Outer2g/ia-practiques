(define (domain gym-program)
  (:requirements :strips :equality :typing :adl)

  (:types Ejercicio Dia Nivel - object)

  (:predicates
	(hoyEs ?dia - Dia)
  ;El dia siguiente a ?dia es ?next
  (nextDay ?dia ?next - Dia)
  ;Como no usamos metric-FF tenemos que indicarle el siguiente nivel a mano
  (nextLevel ?n - Nivel ?nivel - Nivel)
  ;Ejercicio ?e ha sido completado el dia ?dia
  (completado ?e - Ejercicio ?dia - Dia)
  ;El ejercicio ?e ha sido completado con una dificultad ?n
  (completadoConNivel ?e - Ejercicio ?n - Nivel)
  ;Indica si el ejercicio tiene algun ejercicio preparador
  (espreparable ?e - Ejercicio)
  ;Indica que el ejercicio ?e ha sido preparado el dia ?dia
  (preparado ?e - Ejercicio ?dia - Dia)
  ;Indica cual es el preparador de ?e
  (preparador ?e - Ejercicio ?ej - Ejercicio)
  )	

  (:action haz-ejercicio
    :parameters (?e - Ejercicio ?hoy - Dia ?nivelAnterior - Nivel ?nivelSiguiente - Nivel)
    :precondition (and (nextLevel ?nivelAnterior ?nivelSiguiente) (hoyEs ?hoy) 
          (not (completado ?e ?hoy)) (or (not (espreparable ?e)) (preparado ?e ?hoy))
          (completadoConNivel ?e ?nivelAnterior))
    :effect (and (completado ?e ?hoy) (completadoConNivel ?e ?nivelSiguiente))
  )
  (:action has-hecho-preparador
    :parameters (?e - Ejercicio ?ee - Ejercicio ?hoy - dia)
    :precondition (and (hoyEs ?hoy) (not (preparado ?e ?hoy)) (preparador ?e ?ee) (completado ?ee ?hoy))
    :effect (preparado ?e ?hoy)
  )
  (:action pasa-dia
    :parameters (?hoy - Dia ?mañ - Dia)
    :precondition (and (hoyEs ?hoy) (nextDay ?hoy ?mañ))
    :effect (and (not (hoyEs ?hoy)) (hoyEs ?mañ))
  )
)