(define (problem 15-days-v1)
  (:domain gym-program)
  (:objects 
	e1 e2 - Ejercicio
	d1 - Dia)
  (:init

    ;Ejercicio 1
    (and (= (nivel-ejercicio e1) 1)
	(= (posicion-ejercicio e1) 0))
	(= (objetivo-ejercicio e1) 3)
    ;Ejercicio 2 
    (and (= (nivel-ejercicio e2) 1)
	(= (posicion-ejercicio e2) 1))
    	(= (objetivo-ejercicio e2) 0)

   (precursor e1 e2))
  (:goal
   (finalizado d1)
  )
