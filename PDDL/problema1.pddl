(define (problem days-v1)
  (:domain gym-program)

  (:objects
  ejercicio1 - ejercicio
  ejercicio2 - ejercicio
  ejercicio3 - ejercicio
  ejercicio4 - ejercicio
  ejercicio5 - ejercicio
  ejercicio6 - ejercicio
  ejercicio7 - ejercicio
  ejercicio8 - ejercicio
  ejercicio9 - ejercicio
  dia1 - dia
  dia2 - dia
  dia3 - dia
  dia4 - dia
  dia5 - dia
  dia6 - dia
  dia7 - dia
  dia8 - dia
  dia9 - dia
  dia10 - dia
  dia11 - dia
  dia12 - dia
  dia13 - dia
  dia14 - dia
  dia15 - dia
  nivel0 - nivel
  nivel1 - nivel
  nivel2 - nivel
  nivel3 - nivel
  nivel4 - nivel
  nivel5 - nivel
  nivel6 - nivel
  nivel7 - nivel
  nivel8 - nivel
  nivel9 - nivel
)
(:init
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
  (nextLevel nivel0 nivel1)
  (nextLevel nivel1 nivel2)
  (nextLevel nivel2 nivel3)
  (nextLevel nivel3 nivel4)
  (nextLevel nivel4 nivel5)
  (nextLevel nivel5 nivel6)
  (nextLevel nivel6 nivel7)
  (nextLevel nivel7 nivel8)
  (nextLevel nivel8 nivel9)
  (completadoConNivel ejercicio1 nivel0)
  (completadoConNivel ejercicio2 nivel0)
  (completadoConNivel ejercicio3 nivel0)
  (completadoConNivel ejercicio4 nivel0)
  (completadoConNivel ejercicio5 nivel0)
  (completadoConNivel ejercicio6 nivel0)
  (completadoConNivel ejercicio7 nivel0)
  (completadoConNivel ejercicio8 nivel0)
  (completadoConNivel ejercicio9 nivel0)
  (espreparable ejercicio4)
  (preparador ejercicio4 ejercicio3)
  (espreparable ejercicio8)
  (preparador ejercicio8 ejercicio4)
  (espreparable ejercicio9)
  (preparador ejercicio9 ejercicio8)
  
)
(:goal 
  (completadoConNivel ejercicio9 nivel8)
)
)

