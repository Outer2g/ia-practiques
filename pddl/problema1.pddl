(define (problem days-v1)
  (:domain gym-program)
  (:objects 
	e1 e2 e3 - Ejercicio
	d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - Dia)
  (:init

  ;Ejercicio 1 
   (= (nivel-ejercicio e1) 0) 
   (= (objetivo-ejercicio e1) 0)

   ;Ejercicio 2 
   (= (nivel-ejercicio e2) 1) 
   (= (objetivo-ejercicio e2) 7)

   ;Ejercicio 3 
   (= (nivel-ejercicio e3) 2) 
   (= (objetivo-ejercicio e3) 10)

   
   (precursor e1 e2) (precursor e1 e3))
  (:goal
   (forall (?e -Ejercicio) (completado ?e))
  )
)