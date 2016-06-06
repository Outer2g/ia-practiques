(define (domain gym-program)
  (:requirements :fluents :equality)

  (:functions
	(nivel-ejercicio ?l - Ejercicio)
	(posicion-ejercicio ?p - Ejercicio)
	(objetivo-ejercicio ?o - Ejercicio)
	(completar-dia ?d - Dia)
  )

  (:types Ejercicio Dia Nivel)

  (:predicates
	(preparador ?e - Ejercicio ?ee - Ejercicio)
	(finalizado ?d - Dia)
	(puedoHacer ?e - Ejercicio)
	(completado ?e - Ejercicio)
	(hazloen ?d - Dia ?e - Ejercicio)
  )	
  	(:action haz-ejercicio
  		:parameters (?d - Dia ?e - Ejercicio)
  		:precondition (and (completado ?e ) (puedoHacer ?e) (<= (nivel-ejercicio ?e) (objetivo-ejercicio ?e)))
  		:effect (and( not (completado ?e))  (increase (nivel-ejercicio ?e) 1) (hazloen ?d ?e))
  	)
  	(:action check-Capacidad
  		:parameters (?e - Ejercicio  ?ee - Ejercicio)
  		:precondition (and (completado ?e) (preparador ?e ?ee))
  		:effect (puedoHacer ?ee)

  	)

	(:action finalizar-entrenamiento-ejercicio
		:parameters (?e - Ejercicio)
	    :precondition (and (not (completado ?e)) (=(nivel-ejercicio ?e)(objetivo-ejercicio ?e)))
	    :effect (completado ?e)
	)
)