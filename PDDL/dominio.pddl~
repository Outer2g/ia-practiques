(define (domain gym-program)
  (:requirements :fluents :equality)

  (:functions
	(nivel-ejercicio ?l - Ejercicio)
	(posicion-ejercicio ?p - Ejercicio)
	(objetivo-ejercicio ?o - Ejercicio)
	(completar-dia ?d - Dia)
  )

  (:types Ejercicio Dia Posicion)

  (:predicates
	(precursor ?e - Ejercicio ?ee - Ejercicio)
	(at ?e - Ejercicio ?p - Posicion)
	(finalizado ?d - Dia)
	(completado ?e - Ejercicio)
  )

(:action level-up
    :parameters (?e - Ejercicio ?ee - Ejercicio ?d - Dia)
    :precondition (and (precursor ?e ?ee) (< (posicion-ejercicio ?e) (posicion-ejercicio ?ee))
    :effect (finalizado ?d))


