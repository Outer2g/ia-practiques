(deffacts edades
  (edad 50)
  (edad 12)
  (edad 68)
  (edad 37)
)
(deffacts pesos
  (peso 70)
  (peso 30)
  (peso 60)
  (peso 30)
)
(deffacts aluras
  (altura 1.75)
  (altura 1.80)
  (altura 1.90)
  (altura 1.50)
)


(defrule edad-biologica-Adolescente "calcula edad biologica"
  (edad ?x)
=>
 (if (< ?x 18)
        then
        (printout t "It's adolescente" crlf)
        (assert (edadBiologica adolescente))
        else
        (if (< ?x 30)
                then
                (printout t "It's joven" crlf)
                (assert (edadBiologica joven))
                else
                (if (< ?x 60)
                        then
                        (printout t "It's maduro" crlf)
                        (assert (edadBiologica  maduro))
                        else 
                        (printout t "It's viejo" crlf)
                        (assert (edadBiologica viejo))
                        )
                )
        )
)
(defrule calculo-masa-corporal "calcula la masa corporal de la persona"
    (peso ?x)  
    (altura ?y)
  =>
    (assert (masa-corporal (/ ?x (* ?y ?y))))
)

(defrule estado-fisico-obeso "si la persona es obesa, mayor que 30"
  (masa-corporal ?masa&:(> ?masa 30))
  =>
  (assert (estado-fisico obeso))
  )

(defrule estado-fisico-sobrepeso "si la persona tiene sobrepeso, entre 25 y 29.9"
  (masa-corporal ?masa&:(and (> ?masa 25) (< ?masa 29.9)))
  =>
  (assert (estado-fisico normal))
  )

(defrule estado-fisico-peso-normal "si la persona tiene peso normal, entre 18.5-24.9"
  (masa-corporal ?masa&:(and (> ?masa 18.5) (< ?masa 24.9)))
  =>
  (assert (estado-fisico normal))
  )
(defrule estado-fisico-infrapeso "si la persona tiene infrapeso, entre 18.5"
  (masa-corporal ?masa&:(< ?masa 18.5))
  =>
  (assert (estado-fisico infrapeso))
  )


------------------------
Salida standard para prototipo (sin objetivo)
	Ejercicios (Ej grupo dia + abds + cardio)
	Series est: 3
	Repeticiones est: 10
	Peso: 65% Repeticion maxima (1RM)
	Descanso est: 120s
	Tiempo total del dia:
	Calorias consumidas:

Adolescente	Dificultad ej 1,2 , +3%RM
Joven		Na, +5%RM
Maduro		Todo menos ej sin pesas
Viejo		Solo maquinas, -5% RM

Obeso		No pesas, series +1, rep-4 -5%RM
Sobrepeso	Dificultad ej 1,2 , rep-2

(defrule estado-fisico-peso-sobrepeso "si la persona tiene sobrepeso, entre 18.5-24.9"
  (masa-corporal ?masa&:(and (> ?masa 18.5) (< ?masa 24.9)))
  =>
  (not Dificultad 3)
  (repeticiones ?rep&:(- rep 2))
  (assert (estado-fisico sobrepeso))
  )

Normal		Na +5% RM

(defrule estado-fisico-peso-normal "si la persona tiene peso normal, entre 18.5-24.9"
  (masa-corporal ?masa&:(and (> ?masa 18.5) (< ?masa 24.9)))
  =>
  (RM ?rm&:(- rm 5)) 
  (assert (estado-fisico normal))
  )

Infrapeso	Prioridad max + maquinas -2%RM

(defrule estado-fisico-infrapeso "si la persona tiene infrapeso, entre 18.5"
  (masa-corporal ?masa&:(< ?masa 18.5))
  =>
	(RM ?rm&:(- rm 2))
	"(Ej concretos dia (ej. pectorales) + maquinas)" 
	(assert (estado-fisico infrapeso)
  )

