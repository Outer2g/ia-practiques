(define (problem days-v1)
  (:domain gym-program)

  (:objects
  ej1 - Ejercicio
  ej2 - Ejercicio
  ej3 - Ejercicio
  ej4 - Ejercicio
  ej5 - Ejercicio
  ej6 - Ejercicio
  ej7 - Ejercicio
  ej8 - Ejercicio
  ej9 - Ejercicio
  dia1 - Dia
  dia2 - Dia
  dia3 - Dia
  dia4 - Dia
  dia5 - Dia
  dia6 - Dia
  dia7 - Dia
  dia8 - Dia
  dia9 - Dia
  dia10 - Dia
  dia11 - Dia
  dia12 - Dia
  dia13 - Dia
  dia14 - Dia
  dia15 - Dia
  n0 - Nivel
  n1 - Nivel
  n2 - Nivel
  n3 - Nivel
  n4 - Nivel
  n5 - Nivel
  n6 - Nivel
  n7 - Nivel
  n8 - Nivel
  n9 - Nivel
)
(:init
  (nextLevel n0 n1)
  (nextLevel n1 n2)
  (nextLevel n2 n3)
  (nextLevel n3 n4)
  (nextLevel n4 n5)
  (nextLevel n5 n6)
  (nextLevel n6 n7)
  (nextLevel n7 n8)
  (nextLevel n8 n9)
  (hoyEs dia1)
  (nextDay dia1 dia2)
  (nextDay dia2 dia3)
  (nextDay dia3 dia4)
  (nextDay dia4 dia5)
  (nextDay dia5 dia6)
  (nextDay dia6 dia7)
  (nextDay dia7 dia8)
  (nextDay dia8 dia9)
  (nextDay dia9 dia10)
  (nextDay dia10 dia11)
  (nextDay dia11 dia12)
  (nextDay dia12 dia13)
  (nextDay dia13 dia14)
  (nextDay dia14 dia15)
  (completadoConNivel ej1 n0)
  (completadoConNivel ej2 n0)
  (completadoConNivel ej3 n0)
  (completadoConNivel ej4 n0)
  (completadoConNivel ej5 n0)
  (completadoConNivel ej6 n0)
  (completadoConNivel ej7 n0)
  (completadoConNivel ej8 n0)
  (completadoConNivel ej9 n0)
  (espreparable ej4)
  (espreparable ej8)
  (espreparable ej9)
  (preparador ej4 ej3)
  (preparador ej8 ej4)
  (preparador ej9 ej8)
  
)
(:goal 
  (completadoConNivel ej9 n8)
)
)

