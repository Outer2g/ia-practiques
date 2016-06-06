(define (domain gym-program)
  (:requirements :fluents :equality)

  (:functions
	(nivel-ejercicio ?l - Ejercicio)
	(posicion-ejercicio ?p - Ejercicio)
	(objetivo-ejercicio ?o - Ejercicio)
	(completar-dia ?d - Dia)
  )

  (:types Ejercicio Dia)

  (:predicates
	(precursor ?e - Ejercicio ?ee - Ejercicio)
	(finalizado ?d - Dia)
	(completado ?e - Ejercicio)
	(at ?d - Dia ?e - Ejercicio)
  )

	(:action level-up
	    :parameters (?d - Dia ?e - Ejercicio ?ee - Ejercicio)
	    :precondition (and (not(at ?d ?ee)) (not(at ?d ?e)) (precursor ?e ?ee))
	    :effect (and (increase (nivel-ejercicio ?ee) 1) (at ?d ?ee) (at ?d ?e))
	)

	(:action finalizar-entrenamiento-ejercicio
		:parameters (?e - Ejercicio)
	    :precondition (and (not (completado ?e)) (=(nivel-ejercicio ?e)(objetivo-ejercicio ?e)))
	    :effect (completado ?e)
	)
)