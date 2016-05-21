; Sat May 21 14:14:29 CEST 2016
;
;+ (version "3.4.8")
;+ (build "Build 629")

;================================================================================
;============================== Clases ==========================================
;================================================================================
(defmodule MAIN (export ?ALL))

(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
	(is-a USER)
	(role abstract)
	(single-slot ejercicio
;+		(comment "Nombre del ejercicio en cuestion")
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot objetivo
;+		(comment "Nombre del objetivo en cuestion")
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot series_max
;+		(comment "Numero maximo de series (grupos de repeticiones) a realizar")
		(type INTEGER)
		(range 1 ?VARIABLE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot grupo_muscular
;+		(comment "Nombre del grupo muscular en cuestion")
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot grupos_musculares
;+		(comment "Grupos musculares trabajados con el ejercicio")
		(type INSTANCE)
;+		(allowed-classes Grupo_Muscular)
		(create-accessor read-write))
	(multislot metas
;+		(comment "Conjunto de objetivos que se consiguen o mejoran realizando el ejercicio")
		(type INSTANCE)
;+		(allowed-classes Objetivo)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(single-slot calorias_por_minuto
;+		(comment "Calorias quemadas por minuto en la realizacion del ejercicio")
		(type FLOAT)
		(range 0.0 ?VARIABLE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot duracion_max
;+		(comment "Duracion maxima del ejercicio en minutos")
		(type INTEGER)
		(range 1 ?VARIABLE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot repeticiones_min
;+		(comment "Numero minimo de repeticiones a realizar")
		(type INTEGER)
		(range 1 ?VARIABLE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot repeticiones_max
;+		(comment "Numero maximo de repeticiones a realizar")
		(type INTEGER)
		(range 1 ?VARIABLE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot duracion_min
;+		(comment "Duracion minima del ejercicio en minutos")
		(type INTEGER)
		(range 1 ?VARIABLE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot series_min
;+		(comment "Numero minimo de series (grupos de repeticiones) a realizar")
		(type INTEGER)
		(range 1 ?VARIABLE)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Objetivo
	(is-a USER)
	(role concrete)
	(single-slot objetivo
;+		(comment "Nombre del objetivo en cuestion")
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Grupo_Muscular
	(is-a USER)
	(role concrete)
	(single-slot grupo_muscular
;+		(comment "Nombre del grupo muscular en cuestion")
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Ejercicio
	(is-a USER)
	(role abstract)
	(single-slot duracion_max
;+		(comment "Duracion maxima del ejercicio en minutos")
		(type INTEGER)
		(range 1 ?VARIABLE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot repeticiones_max
;+		(comment "Numero maximo de repeticiones a realizar")
		(type INTEGER)
		(range 1 ?VARIABLE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot repeticiones_min
;+		(comment "Numero minimo de repeticiones a realizar")
		(type INTEGER)
		(range 1 ?VARIABLE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot ejercicio
;+		(comment "Nombre del ejercicio en cuestion")
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot grupos_musculares
;+		(comment "Grupos musculares trabajados con el ejercicio")
		(type INSTANCE)
;+		(allowed-classes Grupo_Muscular)
		(create-accessor read-write))
	(single-slot duracion_min
;+		(comment "Duracion minima del ejercicio en minutos")
		(type INTEGER)
		(range 1 ?VARIABLE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot metas
;+		(comment "Conjunto de objetivos que se consiguen o mejoran realizando el ejercicio")
		(type INSTANCE)
;+		(allowed-classes Objetivo)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(single-slot series_min
;+		(comment "Numero minimo de series (grupos de repeticiones) a realizar")
		(type INTEGER)
		(range 1 ?VARIABLE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot calorias_por_minuto
;+		(comment "Calorias quemadas por minuto en la realizacion del ejercicio")
		(type FLOAT)
		(range 0.0 ?VARIABLE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot series_max
;+		(comment "Numero maximo de series (grupos de repeticiones) a realizar")
		(type INTEGER)
		(range 1 ?VARIABLE)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Suelo
	(is-a Ejercicio) (pattern-match reactive)
	(role concrete))

(defclass Maquina
	(is-a Ejercicio) (pattern-match reactive)
	(role concrete))

(defclass Pesas "Quiza incluir el atributo pesas_base"
	(is-a Ejercicio) (pattern-match reactive)
	(role concrete))

(defclass Estiramiento
	(is-a Ejercicio) (pattern-match reactive)
	(role concrete))

(defclass Equilibrio
	(is-a Ejercicio) (pattern-match reactive)
	(role concrete))

(defclass Barra
	(is-a Ejercicio) (pattern-match reactive)
	(role concrete))


;================================================================================
;============================== Instancias ======================================
;================================================================================
(definstances instancies
([ontologia_prototipo1_Class0] of  Maquina

	(calorias_por_minuto 5.5)
	(duracion_max 25)
	(duracion_min 6)
	(ejercicio "Press militar")
	(grupos_musculares [ontologia_prototipo1_Class27])
	(metas [ontologia_prototipo1_Class18])
	(repeticiones_max 25)
	(repeticiones_min 5)
	(series_max 8)
	(series_min 3))

([ontologia_prototipo1_Class18] of  Objetivo

	(objetivo "Musculacion"))

([ontologia_prototipo1_Class19] of  Objetivo

	(objetivo "Flexibilidad"))

([ontologia_prototipo1_Class2] of  Pesas

	(calorias_por_minuto 4.5)
	(duracion_max 15)
	(duracion_min 8)
	(ejercicio "Elevaciones laterales")
	(grupos_musculares [ontologia_prototipo1_Class27])
	(metas [ontologia_prototipo1_Class18])
	(repeticiones_max 18)
	(repeticiones_min 5)
	(series_max 6)
	(series_min 4))

([ontologia_prototipo1_Class20] of  Objetivo

	(objetivo "Equilibrio"))

([ontologia_prototipo1_Class21] of  Objetivo

	(objetivo "Mantenimiento"))

([ontologia_prototipo1_Class22] of  Objetivo

	(objetivo "Forma"))

([ontologia_prototipo1_Class23] of  Objetivo

	(objetivo "Adelgazar"))

([ontologia_prototipo1_Class24] of  Grupo_Muscular

	(grupo_muscular "Abdominales"))

([ontologia_prototipo1_Class25] of  Grupo_Muscular

	(grupo_muscular "Pectorales"))

([ontologia_prototipo1_Class26] of  Grupo_Muscular

	(grupo_muscular "Espalda"))

([ontologia_prototipo1_Class27] of  Grupo_Muscular

	(grupo_muscular "Hombro"))

([ontologia_prototipo1_Class28] of  Grupo_Muscular

	(grupo_muscular "Biceps"))

([ontologia_prototipo1_Class29] of  Grupo_Muscular

	(grupo_muscular "Triceps"))

([ontologia_prototipo1_Class3] of  Pesas

	(calorias_por_minuto 4.0)
	(duracion_max 20)
	(duracion_min 6)
	(ejercicio "Elevaciones de disco")
	(grupos_musculares [ontologia_prototipo1_Class27])
	(metas [ontologia_prototipo1_Class18])
	(repeticiones_max 18)
	(repeticiones_min 3)
	(series_max 7)
	(series_min 3))

([ontologia_prototipo1_Class30] of  Grupo_Muscular

	(grupo_muscular "Quadriceps"))

([ontologia_prototipo1_Class31] of  Grupo_Muscular

	(grupo_muscular "Gemelos"))

([ontologia_prototipo1_Class32] of  Pesas

	(calorias_por_minuto 6.56)
	(duracion_max 15)
	(duracion_min 6)
	(ejercicio "Press Banca")
	(grupos_musculares [ontologia_prototipo1_Class25])
	(metas [ontologia_prototipo1_Class18])
	(repeticiones_max 15)
	(repeticiones_min 2)
	(series_max 5)
	(series_min 3))

([ontologia_prototipo1_Class35] of  Pesas

	(calorias_por_minuto 4.5)
	(duracion_max 20)
	(duracion_min 6)
	(ejercicio "Pullover")
	(grupos_musculares [ontologia_prototipo1_Class25])
	(metas [ontologia_prototipo1_Class18])
	(repeticiones_max 20)
	(repeticiones_min 5)
	(series_max 8)
	(series_min 3))

([ontologia_prototipo1_Class36] of  Suelo

	(calorias_por_minuto 5.0)
	(duracion_max 40)
	(duracion_min 8)
	(ejercicio "Flexiones")
	(grupos_musculares
		[ontologia_prototipo1_Class25]
		[ontologia_prototipo1_Class29])
	(metas
		[ontologia_prototipo1_Class18]
		[ontologia_prototipo1_Class21])
	(repeticiones_max 100)
	(repeticiones_min 3)
	(series_max 8)
	(series_min 4))

([ontologia_prototipo1_Class38] of  Maquina

	(calorias_por_minuto 9.5)
	(duracion_max 37)
	(duracion_min 8)
	(ejercicio "Remo")
	(grupos_musculares [ontologia_prototipo1_Class26])
	(metas [ontologia_prototipo1_Class18])
	(repeticiones_max 60)
	(repeticiones_min 10)
	(series_max 10)
	(series_min 4))

([ontologia_prototipo1_Class39] of  Maquina

	(calorias_por_minuto 3.5)
	(duracion_max 25)
	(duracion_min 10)
	(ejercicio "Polea tras-nuca")
	(grupos_musculares [ontologia_prototipo1_Class26])
	(metas [ontologia_prototipo1_Class18])
	(repeticiones_max 15)
	(repeticiones_min 5)
	(series_max 10)
	(series_min 5))

([ontologia_prototipo1_Class4] of  Pesas

	(calorias_por_minuto 4.5)
	(duracion_max 16)
	(duracion_min 7)
	(ejercicio "Curl con mancuernas")
	(grupos_musculares [ontologia_prototipo1_Class28])
	(metas [ontologia_prototipo1_Class18])
	(repeticiones_max 15)
	(repeticiones_min 8)
	(series_max 6)
	(series_min 3))

([ontologia_prototipo1_Class43] of  Barra

	(calorias_por_minuto 6.8)
	(duracion_max 39)
	(duracion_min 6)
	(ejercicio "FatMan Pullups")
	(grupos_musculares [ontologia_prototipo1_Class26])
	(metas [ontologia_prototipo1_Class18])
	(repeticiones_max 75)
	(repeticiones_min 2)
	(series_max 80)
	(series_min 3))

([ontologia_prototipo1_Class44] of  Barra

	(calorias_por_minuto 6.8)
	(duracion_max 39)
	(duracion_min 6)
	(ejercicio "Dominadas abiertas")
	(grupos_musculares [ontologia_prototipo1_Class26])
	(metas [ontologia_prototipo1_Class18])
	(repeticiones_max 75)
	(repeticiones_min 2)
	(series_max 80)
	(series_min 3))

([ontologia_prototipo1_Class45] of  Suelo

	(calorias_por_minuto 4.5)
	(duracion_max 28)
	(duracion_min 6)
	(ejercicio "Abdominales")
	(grupos_musculares [ontologia_prototipo1_Class24])
	(metas
		[ontologia_prototipo1_Class18]
		[ontologia_prototipo1_Class21])
	(repeticiones_max 50)
	(repeticiones_min 5)
	(series_max 6)
	(series_min 3))

([ontologia_prototipo1_Class46] of  Maquina

	(calorias_por_minuto 15.0)
	(duracion_max 60)
	(duracion_min 10)
	(ejercicio "Cinta")
	(grupos_musculares
		[ontologia_prototipo1_Class30]
		[ontologia_prototipo1_Class31])
	(metas
		[ontologia_prototipo1_Class21]
		[ontologia_prototipo1_Class22]
		[ontologia_prototipo1_Class23]))

([ontologia_prototipo1_Class47] of  Maquina

	(calorias_por_minuto 12.0)
	(duracion_max 120)
	(duracion_min 15)
	(ejercicio "Bicicleta")
	(grupos_musculares
		[ontologia_prototipo1_Class30]
		[ontologia_prototipo1_Class31])
	(metas
		[ontologia_prototipo1_Class21]
		[ontologia_prototipo1_Class22]
		[ontologia_prototipo1_Class23]))

([ontologia_prototipo1_Class5] of  Barra

	(calorias_por_minuto 4.5)
	(duracion_max 12)
	(duracion_min 6)
	(ejercicio "Curl Scott barra")
	(grupos_musculares [ontologia_prototipo1_Class28])
	(metas [ontologia_prototipo1_Class18])
	(repeticiones_max 10)
	(repeticiones_min 3)
	(series_max 5)
	(series_min 3))

([ontologia_prototipo1_Class6] of  Maquina

	(calorias_por_minuto 3.8)
	(duracion_max 30)
	(duracion_min 10)
	(ejercicio "Extensiones cuerda")
	(grupos_musculares [ontologia_prototipo1_Class29])
	(metas [ontologia_prototipo1_Class18])
	(repeticiones_max 25)
	(repeticiones_min 5)
	(series_max 10)
	(series_min 5))

([ontologia_prototipo1_Class7] of  Pesas

	(calorias_por_minuto 4.5)
	(duracion_max 18)
	(duracion_min 6)
	(ejercicio "Press triceps declinado")
	(grupos_musculares [ontologia_prototipo1_Class29])
	(metas [ontologia_prototipo1_Class18])
	(repeticiones_max 10)
	(repeticiones_min 3)
	(series_max 8)
	(series_min 3))

([ontologia_prototipo1_Class8] of  Suelo

	(calorias_por_minuto 3.5)
	(duracion_max 35)
	(duracion_min 6)
	(ejercicio "Sentadillas")
	(grupos_musculares [ontologia_prototipo1_Class30])
	(metas [ontologia_prototipo1_Class18])
	(repeticiones_max 50)
	(repeticiones_min 5)
	(series_max 7)
	(series_min 3))

([ontologia_prototipo1_Class9] of  Suelo

	(calorias_por_minuto 3.5)
	(duracion_max 26)
	(duracion_min 7)
	(ejercicio "Elevaciones de gemelos")
	(grupos_musculares [ontologia_prototipo1_Class31])
	(metas [ontologia_prototipo1_Class18])
	(repeticiones_max 60)
	(repeticiones_min 15)
	(series_max 8)
	(series_min 3))


);;Close instances
;================================================================================
;============================== Preguntas =======================================
;================================================================================
; Obtiene una respuesta del conjunto de posibles valores
(deffunction pregunta-general (?pregunta)
        (format t "%s" ?pregunta)
        (bind ?respuesta (read))
        ?respuesta
)

;;; Funcion para hacer una pregunta con respuesta en un rango dado
(deffunction pregunta-num (?pregunta ?rangini ?rangfi)
        (format t "%s [%d, %d] " ?pregunta ?rangini ?rangfi)
        (bind ?respuesta (read))
        (while (not(and(>= ?respuesta ?rangini)(<= ?respuesta ?rangfi))) do
                (format t "Â¿%s? [%d, %d] " ?pregunta ?rangini ?rangfi)
                (bind ?respuesta (read))
        )
        ?respuesta
)

;;; Funcion para hacer una pregunta con un conjunto definido de valores de repuesta
(deffunction pregunta-lista (?pregunta $?valores_posibles)
        (format t "%s" ?pregunta)
        (bind ?resposta (readline))
        (bind ?res (str-explode ?resposta))
        ?res
)

;funcion para preguntar con unos valores predefinidos en los que la respuesta ha de ser uno de ellos
(deffunction pregunta (?pregunta $?valores-permitidos)
     (progn$
        (?var ?valores-permitidos)
        (lowcase ?var))
     (format t "¿%s? (%s) " ?pregunta (implode$ ?valores-permitidos))
     (bind ?respuesta (read))
     (while (not (member (lowcase ?respuesta) ?valores-permitidos)) do
        (format t "¿%s? (%s) " ?pregunta (implode$ ?valores-permitidos))
        (bind ?respuesta (read))
     )
     ?respuesta
 )



 ;Funcion para preguntar rapidamente si o no
(deffunction pregunta-sino (?pregunta)
    ;(format t "%s" ?pregunta)
    (bind ?respuesta (pregunta ?pregunta si no))
    (if (eq (lowcase ?respuesta) si)
        then TRUE
        else FALSE
     )
)

;;; Inicio de la solucion implementada

;;; Declaracion de clases propias

;;; Fin de declaracion de clases propias --------------

;;; Declaracion de messages ---------------------------

;;; Fin declaracion de messages -----------------------


;;; Declaracion de templates --------------------------

(deftemplate ejercicio-Repeticiones "Template del ejercicio que ha de realizar el usuario con que repeticiones y series"
    (slot nombre_ejercicio)
    (slot nrepeticiones)
    (slot nseries (default 4))
)
(deftemplate ejercicio-Intensidad "Template del ejercicio que ha de realizar el usuario con que intensidad y duracion"
    (slot nombre_ejercicio)
    (slot intensidad)
    (slot duracion)
)
;;; Fin declaracion de templates ----------------------



;;; Declaracion de funciones --------------------------



;;; Fin declaracion de funciones -----------------------



;;; Declaracion de reglas y hechos ---------------------

(defrule comienzo "regla inicial"
    (declare (salience 10))
        (initial-fact)
        =>
        (printout t crlf)
        (printout t "--------------------------------------------------------------" crlf)
        (printout t "------- I'm no couch potato - Recomendador de rutinas --------" crlf)
        (printout t "--------------------------------------------------------------" crlf)
        (printout t crlf)
        (assert (numeroHabitos 0))
        (focus recopilacion-usuario)
)

;;; Modulo recopilacion
(defmodule recopilacion-usuario
    (import MAIN ?ALL)
    (export ?ALL)
)
(defrule pregunta-edad "pregunta edad"
        (not (tengoEdad))
        =>
        (bind ?edad (pregunta-num "Cuantos años tienes: " 14 99))
        (assert (edad ?edad))
        (assert (tengoEdad))
        )

(defrule pregunta-Altura "pregunta estatura"
    (not(tengoAltura))
    =>
    (bind ?altura (pregunta-num "Cúal es tu altura (en cm): " 1.20 2.20))
    (assert (altura ?altura))
    (assert (tengoAltura))
    )

(defrule pregunta-Peso "pregunta peso"
    (not (tengoPeso))
    =>
    (bind ?peso (pregunta-num "Cuanto pesas (en kg): " 30 200))
    (assert (peso ?peso))
    (assert (tengoPeso))
)

(defrule pregunta-Presion "pregunta presion sanguinea"
    (not (tengoPresionSanguinea))
    =>
    (bind ?presionMinima (pregunta-num "Presion sanguinea minima: " 0 200))
    (assert (presionSanguineaMinima ?presionMinima))
    (bind ?presionMaxima (pregunta-num "Presion sanguinea maxima: " 0 300))
    (assert (presionSanguineaMaxima ?presionMaxima))
    (assert (tengoPresionSanguinea))
    )
(defrule pregunta-Objectivo "pregunta el objetivo del entrenamiento"
    (not (tengoObjetivo))
    =>
    (printout t crlf)
    (printout t "1. Muscular" crlf)
    (printout t "2. Adelgazar" crlf)
    (printout t "3. Mantenimiento" crlf)
    (bind ?objetivo (pregunta-num "Que Objetivo tienes " 1 3))
    (if (eq ?objetivo 1)
            then
            (assert (objetivo Muscular))
        else (if (eq ?objetivo 2)
            then (assert (objetivo Adelgazar))
        else (if (eq ?objetivo 3)
            then (assert (objetivo Mantenimiento))
            )))
    (assert (tengoObjetivo))
    )
(defrule pregunta-Si-Prueba "pregunta si el usuaro ha hecho la prueba de intensidad"
    (not (tengoSiPrueba))
    =>
    (bind ?resposta (pregunta-sino "Has realizado la prueba de intensidad recomendada"))
    (assert (tengoSiPrueba))
    (if (eq ?resposta TRUE) then
            (assert (haRealizadoPrueba)))
    )
(defrule pregunta-Si-Tiene-Problemas-Salud "pregunta si el usuario tiene algun tipo de problema"
    (not (tengoSiProblemaSalud))
    =>
    (bind ?resposta (pregunta-sino "Tiene usted algun problema de salud"))
    (assert (tengoSiProblemaSalud))
    (if (eq ?resposta TRUE) then
        (assert (tieneProblemasSalud)))
    )

(defrule pregunta-Tiempo-Diario "pregunta tiempo que quiere invertir diariamente"
    (not (tengoTiempoDiario))
    =>
    (bind ?tiempo (pregunta-num "Cuanto tiempo le quieres dedicar diariamente(en minutos)" 30 240))
    (assert (tiempoDiario ?tiempo))
    )

(defrule pregunta-Problemas-Salud "pregunta por los posibles problmas de salud del usuario"
    (tieneProblemasSalud)
    =>
    (printout t crlf)
    (printout t "1. Muscular" crlf)
    (printout t "2. Cardio Vasculares" crlf)
    (printout t "3. Respiratorios" crlf)
    (printout t "4. Problemas en Articulaciones")
    (bind ?problema (pregunta-num "Que problemas de salud tienes: " 1 4))
    (if (eq ?problema 1)
            then
            (assert (problema Muscular))
        else (if (eq ?problema 2)
            then (assert (problema CardioVascular))
        else (if (eq ?problema 3)
            then (assert (problema Respiratorio))
        else (if (eq ?problema 4)
            then (assert (problema Articulaciones))
            ))))
    )
(defrule pregunta-ProblemaEspecifico "pregunta problema especifico muscular"
    (problema ?problema&:(eq ?problema Muscular))
    =>
    (printout t crlf)
    (printout t "1. Hombro" crlf)
    (printout t "2. Rodilla" crlf)
    (printout t "3. Antebrazo" crlf)

    (bind ?respuesta (pregunta-num "Que problema muscular tienes" 1 3))
    (if (eq ?respuesta 1)
            then
            (assert (restriccion Hombro))
        else (if (eq ?respuesta 2)
            then (assert (restriccion Rodilla))
        else (if (eq ?respuesta 3)
            then (assert (restriccion Antebrazo))
            )))
    (assert (tengoObjetivo))
    )
(defrule pregunta-Habitos "pregunta habitos de la persona"
    (not (tengoHabitos))
    ?fHabitos <- (numeroHabitos ?nhabitos)
    =>
    (printout t crlf)
    (printout t "1. Salir a correr" crlf)
    (printout t "2. Salir en bicicleta" crlf)
    (printout t "3. Escalada" crlf)
    (printout t "4. Ninguna" crlf)
    (bind ?respuesta (pregunta-num "Cúal de estas actividades realizas" 1 4))
    (if (eq ?respuesta 1)
        then (assert (habito correr))
            (retract ?fHabitos)
            (assert (numeroHabitos (+ ?nhabitos 1))))
    (if (eq ?respuesta 2)
        then (assert (habito bicicleta))
            (retract ?fHabitos)
            (assert (numeroHabitos (+ ?nhabitos 1))))
    (if (eq ?respuesta 3)
        then (assert (habito escalada))
            (retract ?fHabitos)
            (assert (numeroHabitos (+ ?nhabitos 1))))
    (if (eq ?respuesta 4)
        then (assert (nopreguntesmashabitos)))
    (assert (tengoHabitos))
    )
(defrule pregunta-Si-TieneMasHabitos "pregunta si la persona tiene mas habitos"
    ?f <- (tengoHabitos)
    (not (nopreguntesmashabitos))
    =>
    (bind ?resposta (pregunta-sino "Realiza usted alguna otra actividad"))
    (if (eq ?resposta TRUE) then
        (retract ?f))
    )
(defrule pregunta-Resultados-Prueba "recopila los datos de la prueba"
    (haRealizadoPrueba)
    =>
    (printout t "TODO: PEDIR datos" crlf)
    )

(defrule pasa-next "pregunta problemas de salud"
    (declare (salience -1))
    =>
    (focus procesado))

(defrule calcula-Indice-Masa "calculo del indice de masa muscular"
    (altura ?altura)
    (peso ?peso)
    =>
    (assert (masa (/ ?peso (* ?altura ?altura))))
    )

;;; Modulo procesado de contenido ---------------------------------------------------

(defmodule procesado
    (import MAIN ?ALL)
    (import recopilacion-usuario ?ALL)
    (export ?ALL)
)

(defrule init_intensidad "intensidad basica"
    (not (tengoIntensidad))
    =>
    (assert (tengoIntensidad))
    (assert (intensidadBasica 50))
    )
(defrule procesa-edad "segun edad se hacen cosas"
    (edad ?edad)
        =>
        (if (< ?edad 18)
        then
        (assert (edadBiologica adolescente))
        else
        (if (< ?edad 30)
                then
                (assert (edadBiologica joven))
                else
                (if (< ?edad 60)
                        then
                        (assert (edadBiologica  maduro))
                        else
                        (assert (edadBiologica viejo))
                        )
                )
        )
        (assert (tengoEdad))
)
(defrule procesa-objetivo "segun el objetivo, se le recomendara unas repeticiones o intensidades basicas"
    (objetivo ?objetivo)
    =>
    (if (eq ?objetivo Muscular) then (assert (nrepeticionesBasicas 8))
        else (if (eq ?objetivo Adelgazar) then (assert (nrepeticionesBasicas 15)))
        else (assert (nrepeticionesBasicas 12)))
)
(defrule estado-articulaciones "la persona tiene problemas de articulaciones, entonces no puede hacer pesas"
    (or (problema Articulaciones) (restriccion Antebrazo))
    =>
    (assert (noPuedePesas))
    )
(defrule estado-obeso "la persona es obesa si masa mayor que 30"
    (masa ?x&:(> ?x 30))
    =>
    (assert ( estado-fisico obeso))
    )
(defrule estado-sobrepeso "la persona tiene sobrepeso si masa entre 25 y 29.9"
    (masa ?x&:(and (> ?x 25) (< ?x 30)))
    =>
    (assert ( estado-fisico sobrepeso))
    )
(defrule estado-peso-normal "la persona tiene peso normal si masa entre 18.5 y 24.9"
    (masa ?x&:(and (> ?x 18.5) (< ?x 25)))
    =>
    (assert ( estado-fisico normal))
    )
(defrule estado-infrapeso "la persona sufre de infrapeso si masa menor que 18.5"
    (masa ?x&:(< ?x 18.5))
    =>
    (assert ( estado-fisico infrapeso))
    )
(defrule procesa-estado-fisico "procesa el estado fisico de la persona segun las actividades que haga"
    (numeroHabitos ?x)
    =>

    (if (< ?x 4) then (assert (actividad-fisica poca))
        else (if (and (> ?x 3) (< ?x 5)) then (assert (actividad-fisica moderada))
            else (assert (actividad-fisica mucha))))
    )
(defrule procesa-presion "procesa la presion sanguinea"
	(presionSanguineaMaxima ?presionMaxima)
	(presionSanguineaMinima ?presionMinima)
	=>
	(if (and (> ?presionMaxima 130) (> ?presionMinima 90)) then (assert (tension Alta))
        else (if (and (< ?presionMaxima 90) (< ?presionMinima 61)) then (assert (tension Baja)))
        else (assert (tension Normal)))
	)
(defrule next "pasa next module"
    (declare (salience -1))
    =>
    (focus generacion))


;;; Módulo de generacion de respuestas -------------------------------------------------
(defmodule generacion
    (import MAIN ?ALL)
    (import recopilacion-usuario ?ALL)
        (import procesado ?ALL)
    (export ?ALL)
    )
(defrule considera-tension "si tension alta -> baja intensidad"
	(declare (salience 10))
	(tension Alta)
	?f<-(intensidadBasica ?intensity)
	=>
	(retract ?f)
	(assert (intensidad 20))
	)
;Problema: no se puede igualar ?obj con ?grupo
(defrule haz-magia
	?obj<-(object (is-a Grupo_Muscular) (grupo_muscular "Gemelos"))
	(object (is-a Maquina) (ejercicio ?ejercicio)(grupos_musculares $?grupos ?grupo))
	=>
	(assert (prueba ?obj))
	(assert (pruebaGrup ?grupo))
	)

(defrule considera-hombro-problemas "Tiene en cuenta la lesion para los ejercicios con maquina"
    (or (restriccion Hombro) (edadBiologica ?edadBiologica&:(eq ?edadBiologica viejo)))
    (nrepeticionesBasicas ?nrepesBasic)
    ;?grupoMuscular <- (object (is-a Grupo_Muscular) (grupo_muscular "Hombro"))
    ;(object (is-a Maquina) (ejercicio ?ejercicio) (grupos_musculares ))
    =>
    (printout t crlf)
    (printout t "--------------------------------------------------------------" crlf)
    (assert (ejercicio-Repeticiones (nombre_ejercicio PressMilitar) (nrepeticiones (/ ?nrepesBasic 4))))
)
(defrule considera-hombro-normal
    (and (not (restriccion Hombro)) (edadBiologica ?edadBiologica&:(neq ?edadBiologica viejo)))
    (nrepeticionesBasicas ?nrepesBasic)
    =>
    (assert (ejercicio-Repeticiones (nombre_ejercicio PressMilitar) (nrepeticiones ?nrepesBasic)))
    (assert (ejercicio-Repeticiones (nombre_ejercicio ElevacionesLaterales) (nrepeticiones ?nrepesBasic)))
    (assert (ejercicio-Repeticiones (nombre_ejercicio ElevacionesDeDisco) (nrepeticiones ?nrepesBasic)))
)
(defrule considera-rodilla-problemas "comprueba si puede hacer ejercicios de pierna"
    (restriccion Rodilla)
    (intensidad ?intesidadBasic)
    (object (is-a Maquina) (ejercicio "Cinta") (duracion_min ?duracion))
    (object (is-a Maquina) (ejercicio "Bicicleta") (duracion_min ?duracionBici))
    (object (is-a Suelo) (ejercicio "Elevaciones de gemelos") (duracion_min ?duracionEle))

    =>
    (assert (ejercicio-Intensidad (nombre_ejercicio Cinta) (intensidad (/ ?intesidadBasic 4)) (duracion ?duracion)))
    (assert (ejercicio-Intensidad (nombre_ejercicio Bicicleta) (intensidad (/ ?intesidadBasic 4)) (duracion ?duracionBici)))
    (assert (ejercicio-Intensidad (nombre_ejercicio ElevacionesGemelos) (intensidad (/ ?intesidadBasic 4)) (duracion ?duracionEle)))
)
(defrule considera-rodilla-normal "considera que puede hacer ejercicios de pierna"
    (not (restriccion Rodilla))
    (intensidad ?intesidadBasic)
    (objetivo ?objetivo)
    =>
    (if (eq ?objetivo Adelgazar) then (bind ?duracion 45)
        else (bind ?duracion 30))
    (assert (ejercicio-Intensidad (nombre_ejercicio Cinta) (intensidad ?intesidadBasic) (duracion ?duracion)))
    (assert (ejercicio-Intensidad (nombre_ejercicio Bicicleta) (intensidad ?intesidadBasic) (duracion ?duracion)))
    (assert (ejercicio-Intensidad (nombre_ejercicio ElevacionesGemelos) (intensidad ?intesidadBasic) (duracion ?duracion)))
    )

(defrule considera-problemas-articulaciones "Si tiene problemas en las articulaciones, mejor que no haga pesas"
	(noPuedePesas)
	(object (is-a Pesas) (ejercicio ?ejercicio))
	=>
	(assert (noPuedo ?ejercicio))
	)
(defrule pasa-next-module
    (declare (salience -1))
    =>
    (focus presentacion)
)

;;; Modulo de presentacion de resultados ----------------------------------------------------
(defmodule presentacion
    (import MAIN ?ALL)
    (import recopilacion-usuario ?ALL)
    (import procesado ?ALL)
    (import generacion ?ALL)
    (export ?ALL)
)
(defrule mostrar-respuesta "Muestra el contenido escogido"
    (declare (salience 1))
    =>
    (printout t crlf)
    (printout t "--------------------------------------------------------------" crlf)
    (printout t "--------------- Ejercicios que puedes realizar ---------------" crlf)
    (printout t "--------------------------------------------------------------" crlf)
    (printout t crlf)
    (facts)
)


; ;;; Fin declaracion de reglas ------------------------------
