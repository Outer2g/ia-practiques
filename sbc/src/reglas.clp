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

([ontologia_prototipo1_Class32] of  Maquina

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
    (slot grupo_muscular)
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
    (not (heAcabado))
    =>
    (printout t crlf)
    (printout t "1. Muscular" crlf)
    (printout t "2. Cardio Vasculares" crlf)
    (printout t "3. Respiratorios" crlf)
    (printout t "4. Problemas en Articulaciones" crlf)
    (printout t "5. Ninguno" crlf)
    (bind ?problema (pregunta-num "Que problemas de salud tienes: " 1 5))
    (if (eq ?problema 1)
            then
            (assert (problema Muscular))
        else (if (eq ?problema 2)
            then (assert (problema CardioVascular))
    (assert (heAcabado))
        else (if (eq ?problema 3)
            then (assert (problema Respiratorio))
    (assert (heAcabado))
        else (if (eq ?problema 4)
            then (assert (problema Articulaciones))
    (assert (heAcabado))
        else (assert (nopreguntesmasproblemas))
    (assert (heAcabado))
            ))))
    )
(defrule pregunta-Si-TieneMasproblemas "pregunta si la persona tiene mas problemas de salud"
    ?f <- (heAcabado)
    (not (nopreguntesmasproblemas))
    =>
    (bind ?resposta (pregunta-sino "Tiene usted algun otro problema "))
    (if (eq ?resposta TRUE) then
        (retract ?f))
    )
(defrule pregunta-ProblemaEspecifico "pregunta problema especifico muscular"
    ?f<-(problema ?problema&:(eq ?problema Muscular))
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
    (assert (heAcabado))
    (retract ?f)
    )
(defrule pregunta-Habitos "pregunta habitos de la persona"
	(declare (salience -1))
    (not (tengoHabitos))
    ?fHabitos <- (numeroHabitos ?nhabitos)
    =>
    (printout t crlf)
    (printout t "1. Salir a correr" crlf)
    (printout t "2. Salir en bicicleta" crlf)
    (printout t "3. Escalada" crlf)
    (printout t "4. Natacion" crlf)
    (printout t "5. Tenis" crlf)
    (printout t "6. Paddel" crlf)
    (printout t "7. Ninguna" crlf)
    (bind ?respuesta (pregunta-num "Cúal de estas actividades realizas" 1 7))
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
        then (assert (habito natacion))
            (retract ?fHabitos)
            (assert (numeroHabitos (+ ?nhabitos 1))))
    (if (eq ?respuesta 5)
        then (assert (habito tenis))
            (retract ?fHabitos)
            (assert (numeroHabitos (+ ?nhabitos 1))))
    (if (eq ?respuesta 6)
        then (assert (habito paddel))
            (retract ?fHabitos)
            (assert (numeroHabitos (+ ?nhabitos 1))))
    (if (eq ?respuesta 7)
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
    (if (eq ?objetivo Muscular) then (assert (nrepeticionesBasicas 8)))
    (if (eq ?objetivo Adelgazar) then (assert (nrepeticionesBasicas 12)))
    (if (eq ?objetivo Mantenimiento) then (assert (nrepeticionesBasicas 15)))
)
(defrule estado-articulaciones "la persona tiene problemas de articulaciones, entonces no puede hacer pesas"
    (or (problema Articulaciones) (restriccion Antebrazo) (edadBiologica ?edad&:(eq ?edad viejo)))
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
(defrule calcula-intensidad "si tension alta -> baja intensidad"
	(declare (salience 10))
	(tension ?tension)
	?f<-(intensidadBasica ?intensity)
	(estado-fisico ?estado)
	(actividad-fisica ?actividad)
	=>
	(retract ?f)
	(bind ?intensidadFinal ?intensity)
	"si tension alta o baja, restamos 30, si no se queda igual"
	(if (or (eq ?tension Alta) (eq ?tension Baja)) then (bind ?intensidadFinal (- ?intensidadFinal 30)))
	"si sobrepeso o obeso, se decrementaf en -5 y -10 respectivamente, si no se queda igual"
	(if (eq ?estado sobrepeso) then (bind ?intensidadFinal (+ ?intensidadFinal -5))
		else (if (eq ?estado obeso) then (bind ?intensidadFinal (+ ?intensidadFinal -10))))
	"si esta acostumbrado a hacer actividad fisica, sube, si no, no"
	(if (eq ?actividad moderada) then (bind ?intensidadFinal (+ ?intensidadFinal 10))
		else (if (eq ?actividad mucha) then (bind ?intensidadFinal (+ ?intensidadFinal 30))))
	(assert (intensidad ?intensidadFinal))
)
(defrule considera-tension-normal
	(declare (salience 10))
	(tension ?ten&:(neq ?ten Alta))
	?f<-(intensidadBasica ?intensity)
	=>
	(retract ?f)
	(assert (intensidad ?intensity))
)
(defrule considera-pecho-normal "Tiene en cuenta pecho sin problemas del usuario"
	(not (restriccion pecho))
    (nrepeticionesBasicas ?nrepesBasic)
    ?grupoMuscular <- (object (is-a Grupo_Muscular) (grupo_muscular "Pectorales"))
    (object (is-a Maquina|Pesas|Suelo|Barra) (ejercicio ?ejercicio) (grupos_musculares $?grupos))
    =>
    (progn$ (?elemento $?grupos)
		(bind ?grupo (instance-address * ?elemento))
		(if (eq ?grupo ?grupoMuscular)
		 then 
			(assert (ejercicio-Repeticiones (nombre_ejercicio ?ejercicio) (nrepeticiones ?nrepesBasic ) (grupo_muscular Pectoral)))
			)
	)
	)
(defrule considera-espalda-normal "Tiene ne cuenta ejercicios de espalda sin problemas del usuario"
	(not (restriccion espalda))
    (nrepeticionesBasicas ?nrepesBasic)
    ?grupoMuscular <- (object (is-a Grupo_Muscular) (grupo_muscular "Espalda"))
    (object (is-a Maquina|Pesas|Suelo|Barra) (ejercicio ?ejercicio) (grupos_musculares $?grupos))
    =>
    (progn$ (?elemento $?grupos)
		(bind ?grupo (instance-address * ?elemento))
		(if (eq ?grupo ?grupoMuscular)
		 then 
			(assert (ejercicio-Repeticiones (nombre_ejercicio ?ejercicio) (nrepeticiones ?nrepesBasic ) (grupo_muscular Espalda)))
			)
	)
)
(defrule considera-Biceps-normal "tiene en cuenta ejercicios de biceps sin problmeas del usuario"
	(not (restriccion biceps))
    (nrepeticionesBasicas ?nrepesBasic)
    ?grupoMuscular <- (object (is-a Grupo_Muscular) (grupo_muscular "Biceps"))
    (object (is-a Maquina|Pesas|Barra) (ejercicio ?ejercicio) (grupos_musculares $?grupos))
    =>
    (progn$ (?elemento $?grupos)
		(bind ?grupo (instance-address * ?elemento))
		(if (eq ?grupo ?grupoMuscular)
		 then 
			(assert (ejercicio-Repeticiones (nombre_ejercicio ?ejercicio) (nrepeticiones ?nrepesBasic ) (grupo_muscular Biceps)))
			)
	)
)
(defrule considera-Triceps-normal "tiene en cuenta ejercicios de triceps sin problmeas del usuario"
	(not (restriccion triceps))
    (nrepeticionesBasicas ?nrepesBasic)
    ?grupoMuscular <- (object (is-a Grupo_Muscular) (grupo_muscular "Triceps"))
    (object (is-a Maquina|Pesas|Suelo|Barra) (ejercicio ?ejercicio) (grupos_musculares $?grupos))
    =>
    (progn$ (?elemento $?grupos)
		(bind ?grupo (instance-address * ?elemento))
		(if (eq ?grupo ?grupoMuscular)
		 then 
			(assert (ejercicio-Repeticiones (nombre_ejercicio ?ejercicio) (nrepeticiones ?nrepesBasic ) (grupo_muscular Triceps)))
			)
	)
)
(defrule considera-hombro-problemas "Tiene en cuenta la lesion para los ejercicios con maquina"
    (or (restriccion Hombro) (edadBiologica ?edadBiologica&:(eq ?edadBiologica viejo)))
    (nrepeticionesBasicas ?nrepesBasic)
    ?grupoMuscular <- (object (is-a Grupo_Muscular) (grupo_muscular "Hombro"))
    (object (is-a Maquina) (ejercicio ?ejercicio) (grupos_musculares $?grupos))
    =>
    (progn$ (?elemento $?grupos)
		(bind ?grupo (instance-address * ?elemento))
		(if (eq ?grupo ?grupoMuscular)
		 then 
			(assert (ejercicio-Repeticiones (nombre_ejercicio ?ejercicio) (nrepeticiones (/ ?nrepesBasic 4)) (grupo_muscular Hombro)))
			)
	)
)
(defrule considera-hombro-normal
    (and (not (restriccion Hombro)) (edadBiologica ?edadBiologica&:(neq ?edadBiologica viejo)))
    (nrepeticionesBasicas ?nrepesBasic)
    ?grupoMuscular <- (object (is-a Grupo_Muscular) (grupo_muscular "Hombro"))
    (object (is-a Maquina|Pesas|Suelo|Barra) (ejercicio ?ejercicio) (grupos_musculares $?grupos))
    =>
    (progn$ (?elemento $?grupos)
		(bind ?grupo (instance-address * ?elemento))
		(if (eq ?grupo ?grupoMuscular)
		 then 
			(assert (ejercicio-Repeticiones (nombre_ejercicio ?ejercicio) (nrepeticiones ?nrepesBasic) (grupo_muscular Hombro)))
			)
	)
)
(defrule considera-rodilla-problemas "comprueba si puede hacer ejercicios de pierna"
    (restriccion Rodilla)
    (intensidad ?intesidadBasic)
    ?grupoMuscular <- (object (is-a Grupo_Muscular) (grupo_muscular "Quadriceps"|"Gemelos"))
    (object (is-a Maquina|Suelo) (ejercicio ?ejercicio) (duracion_min ?duracion) (grupos_musculares $?grupos))
    =>

    (progn$ (?elemento $?grupos)
		(bind ?grupo (instance-address * ?elemento))
		(if (eq ?grupo ?grupoMuscular)
		 then 
			(assert (ejercicio-Intensidad (nombre_ejercicio ?ejercicio) (intensidad (/ ?intesidadBasic 4)) (duracion ?duracion)))
			)
	)
)
(defrule considera-rodilla-normal "considera que puede hacer ejercicios de pierna"
    (not (restriccion Rodilla))
    (intensidad ?intesidadBasic)
    (objetivo ?objetivo)
    (estado-fisico ?estado)
    ?grupoMuscular <- (object (is-a Grupo_Muscular) (grupo_muscular "Quadriceps"|"Gemelos"))
    (object (is-a Maquina|Pesas|Suelo|Barra) (ejercicio ?ejercicio) (grupos_musculares $?grupos))
    =>
    (if (eq ?objetivo Adelgazar) then (bind ?duracion 45)
        else (bind ?duracion 30))
    (if (eq ?estado obeso) then (bind ?duracion (+ ?duracion 15)))
    (if (eq ?estado infrapeso) then (bind ?duracion (- ?duracion 15)))

    (progn$ (?elemento $?grupos)
		(bind ?grupo (instance-address * ?elemento))
		(if (eq ?grupo ?grupoMuscular)
		 then 
			(assert (ejercicio-Intensidad (nombre_ejercicio ?ejercicio) (intensidad ?intesidadBasic) (duracion ?duracion)))
			)
	)
    )

(defrule considera-problemas-articulaciones "Si tiene problemas en las articulaciones, mejor que no haga pesas"
	(noPuedePesas)
	(object (is-a Pesas|Barra) (ejercicio ?ejercicio))
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
    (declare (salience 100))
    =>
    (printout t crlf)
    (printout t "--------------------------------------------------------------" crlf)
    (printout t "------------- Horario recomendado para la semana -------------" crlf)
    (printout t "--------------------------------------------------------------" crlf)
    (printout t crlf)
    (assert (tiempoLunes 0))
    (assert (tiempoMartes 0))
    (assert (tiempoMiercoles 0))
    (assert (tiempoJueves 0))
    (assert (tiempoViernes 0))
    	)
(defrule mostrar-lunes "Muestra cabecera lunes"
	(declare (salience 99))
	(not (HeMostradoLunes))
	=>
	(assert (HeMostradoLunes))
    (printout t crlf)
    (printout t "Lunes: Pectoral" crlf)
    (printout t crlf)
    (printout t "Ejercicio 		numero repeticiones 	numero series" crlf)
    (printout t "--------------------------------------------------------------" crlf)
)
(defrule mostrar-lunes-Pectoral "Muestra contenido del lunes"
	(declare (salience 98))
	?ejerc<-(ejercicio-Repeticiones (nombre_ejercicio ?ejercicio) (nrepeticiones ?nrepes) (nseries ?nseries) (grupo_muscular Pectoral))
	(not (noPuedo ?ej&:(eq ?ej ?ejercicio)))
	(tiempoDiario ?tiempoDiario)
	?factTime<-(tiempoLunes ?tiempoLunes)
	(test (< ?tiempoLunes ?tiempoDiario))
	=>
	(bind ?tiempo (+ ?tiempoLunes (+ (* ?nrepes 0.1) ?nseries)))
	(retract ?factTime)
	(retract ?ejerc)
	(assert (tiempoLunes ?tiempo))
    (printout t crlf)
    (printout t ?ejercicio "			" ?nrepes "			" ?nseries crlf)
    (assert (heDeRellenarLunes))
	)
(defrule rellena-cabezera-lunes
	(declare (salience 97))
	(heDeRellenarLunes)
	=>
    (printout t crlf)
    (printout t "Ejercicio 			intensidad 	  duracion" crlf)
    (printout t "--------------------------------------------------------------" crlf)
	)
(defrule rellena-lunes "Rellena con cardio el lunes"
	(declare (salience 96))
	?factTime<- (tiempoLunes ?tiempoLunes)
	(test (< ?tiempoLunes 30.0))
	?ej<-(ejercicio-Intensidad (nombre_ejercicio ?ejercicio) (intensidad ?intensidad)(duracion ?duracion))
	(not (noPuedo ?ej&:(eq ?ej ?ejercicio)))
	=>
	(retract ?factTime)
	(retract ?ej)
	(assert (tiempoLunes (+ ?tiempoLunes ?duracion)))
    (printout t crlf)
    (printout t ?ejercicio "			" ?intensidad "			" ?duracion crlf)
	)

(defrule mostrar-martes "Muestra cabecera martes"
	(declare (salience 95))
	(not (HeMostradoMartes))
	=>
	(assert (HeMostradoMartes))
    (printout t crlf)
    (printout t "Martes: Hombro" crlf)
    (printout t crlf)
    (printout t "--------------------------------------------------------------" crlf)
)
(defrule mostrar-martes-Hombro "Muestra contenido del martes"
	(declare (salience 94))
	?ejerc<-(ejercicio-Repeticiones (nombre_ejercicio ?ejercicio) (nrepeticiones ?nrepes) (nseries ?nseries) (grupo_muscular Hombro))
	(not (noPuedo ?ej&:(eq ?ej ?ejercicio)))
	(tiempoDiario ?tiempoDiario)
	?factTime<-(tiempoMartes ?tiempoDia)
	(test (< ?tiempoDia ?tiempoDiario))
	=>
	(bind ?tiempo (+ ?tiempoDia (+ (* ?nrepes 0.1) ?nseries)))
	(retract ?factTime)
	(retract ?ejerc)
	(assert (tiempoMartes ?tiempo))
    (printout t crlf)
    (printout t ?ejercicio "			" ?nrepes "			" ?nseries crlf)
    (assert (heDeRellenarMartes))
	)
(defrule rellena-cabezera-martes
	(declare (salience 92))
	(heDeRellenarMartes)
	=>
    (printout t crlf)
    (printout t "Ejercicio 			intensidad 		duracion" crlf)
    (printout t "--------------------------------------------------------------" crlf)
	)
(defrule rellena-martes "Rellena con cardio el martes"
	(declare (salience 91))
	?factTime<- (tiempoMartes ?tiempoDia)
	(test (< ?tiempoDia 30.0))
	?ej<-(ejercicio-Intensidad (nombre_ejercicio ?ejercicio) (intensidad ?intensidad)(duracion ?duracion))
	(not (noPuedo ?ej&:(eq ?ej ?ejercicio)))
	=>
	(retract ?ej)
	(retract ?factTime)
	(assert (tiempoMartes (+ ?tiempoDia ?duracion)))
    (printout t crlf)
    (printout t ?ejercicio "			" ?intensidad "			" ?duracion crlf)
    )

(defrule mostrar-miercoles "Muestra cabecera miercoles"
	(declare (salience 90))
	(not (HemostradoMiercoles))
	=>
	(assert (HemostradoMiercoles))
    (printout t crlf)
    (printout t "Miercoles: Espalda" crlf)
    (printout t crlf)
    (printout t "--------------------------------------------------------------" crlf)
)
(defrule mostrar-miercoles-Espalda "Muestra contenido del miercoles"
	(declare (salience 89))
	?ejerc<-(ejercicio-Repeticiones (nombre_ejercicio ?ejercicio) (nrepeticiones ?nrepes) (nseries ?nseries) (grupo_muscular Espalda))
	(not (noPuedo ?ej&:(eq ?ej ?ejercicio)))
	(tiempoDiario ?tiempoDiario)
	?factTime<-(tiempoMiercoles ?tiempoDia)
	(test (< ?tiempoDia ?tiempoDiario))
	=>
	(bind ?tiempo (+ ?tiempoDia (+ (* ?nrepes 0.1) ?nseries)))
	(retract ?factTime)
	(retract ?ejerc)
	(assert (tiempoMiercoles ?tiempo))
    (printout t crlf)
    (printout t ?ejercicio "			" ?nrepes "			" ?nseries crlf)
    (assert (heDeRellenarMiercoles))
	)
(defrule rellena-cabezera-miercoles
	(declare (salience 88))
	(heDeRellenarMiercoles)
	=>
    (printout t crlf)
    (printout t "Ejercicio 			intensidad 		duracion" crlf)
    (printout t "--------------------------------------------------------------" crlf)
	)
(defrule rellena-miercoles "Rellena con cardio el miercoles"
	(declare (salience 87))
	?factTime<- (tiempoMiercoles ?tiempoDia)
	(test (< ?tiempoDia 30.0))
	?ej<-(ejercicio-Intensidad (nombre_ejercicio ?ejercicio) (intensidad ?intensidad)(duracion ?duracion))
	(not (noPuedo ?ej&:(eq ?ej ?ejercicio)))
	=>
	(retract ?factTime)
	(retract ?ej)
	(assert (tiempoMiercoles (+ ?tiempoDia ?duracion)))
    (printout t crlf)
    (printout t ?ejercicio "			" ?intensidad "			" ?duracion crlf)
	)


(defrule mostrar-jueves "Muestra cabecera jueves"
	(declare (salience 86))
	(not (HemostradoJueves))
	=>
	(assert (HemostradoJueves))
    (printout t crlf)
    (printout t "Jueves: Biceps" crlf)
    (printout t crlf)
    (printout t "--------------------------------------------------------------" crlf)
)
(defrule mostrar-jueves-Biceps "Muestra contenido del jueves"
	(declare (salience 85))
	?ejerc<-(ejercicio-Repeticiones (nombre_ejercicio ?ejercicio) (nrepeticiones ?nrepes) (nseries ?nseries) (grupo_muscular Biceps))
	(not (noPuedo ?ej&:(eq ?ej ?ejercicio)))
	(tiempoDiario ?tiempoDiario)
	?factTime<-(tiempoJueves ?tiempoDia)
	(test (< ?tiempoDia ?tiempoDiario))
	=>
	(bind ?tiempo (+ ?tiempoDia (+ (* ?nrepes 0.1) ?nseries)))
	(retract ?factTime)
	(retract ?ejerc)
	(assert (tiempoJueves ?tiempo))
    (printout t crlf)
    (printout t ?ejercicio "			" ?nrepes "			" ?nseries crlf)
    (assert (heDeRellenarJueves))
	)
(defrule rellena-cabezera-jueves
	(declare (salience 84))
	(heDeRellenarJueves)
	=>
    (printout t crlf)
    (printout t "Ejercicio 			intensidad 		duracion" crlf)
    (printout t "--------------------------------------------------------------" crlf)
	)
(defrule rellena-jueves "Rellena con cardio el jueves"
	(declare (salience 83))
	?factTime<- (tiempoJueves ?tiempoDia)
	(test (< ?tiempoDia 30.0))
	?ej<-(ejercicio-Intensidad (nombre_ejercicio ?ejercicio) (intensidad ?intensidad)(duracion ?duracion))
	(not (noPuedo ?ej&:(eq ?ej ?ejercicio)))
	=>
	(retract ?factTime)
	(retract ?ej)
	(assert (tiempoJueves (+ ?tiempoDia ?duracion)))
    (printout t crlf)
    (printout t ?ejercicio "			" ?intensidad "			" ?duracion crlf)
	)


(defrule mostrar-viernes "Muestra cabecera viernes"
	(declare (salience 82))
	(not (HemostradoViernes))
	=>
	(assert (HemostradoViernes))
    (printout t crlf)
    (printout t "Viernes: Triceps" crlf)
    (printout t crlf)
    (printout t "--------------------------------------------------------------" crlf))
(defrule mostrar-viernes-Triceps "Muestra contenido del viernes"
	(declare (salience 81))
	?ejerc<-(ejercicio-Repeticiones (nombre_ejercicio ?ejercicio) (nrepeticiones ?nrepes) (nseries ?nseries) (grupo_muscular Triceps))
	(not (noPuedo ?ej&:(eq ?ej ?ejercicio)))
	(tiempoDiario ?tiempoDiario)
	?factTime<-(tiempoViernes ?tiempoDia)
	(test (< ?tiempoDia ?tiempoDiario))
	=>
	(bind ?tiempo (+ ?tiempoDia (+ (* ?nrepes 0.1) ?nseries)))
	(retract ?factTime)
	(retract ?ejerc)
	(assert (tiempoViernes ?tiempo))
    (printout t crlf)
    (printout t ?ejercicio "			" ?nrepes "			" ?nseries crlf)
    (assert (hedeRellenarViernes))
	)
(defrule rellena-cabezera-viernes
	(declare (salience 80))
	(hedeRellenarViernes)
	=>
    (printout t crlf)
    (printout t "Ejercicio 			intensidad 		duracion" crlf)
    (printout t "--------------------------------------------------------------" crlf)
	)
(defrule rellena-viernes "Rellena con cardio el miercoles"
	(declare (salience 79))
	(ejercicio-Intensidad (nombre_ejercicio ?ejercicio) (intensidad ?intensidad)(duracion ?duracion))
	?factTime<- (tiempoViernes ?tiempoDia)
	(test (< ?tiempoDia 30.0))
	(not (noPuedo ?ej&:(eq ?ej ?ejercicio)))
	=>
	(retract ?factTime)
	(assert (tiempoViernes (+ ?tiempoDia ?duracion)))
    (printout t crlf)
    (printout t ?ejercicio "			" ?intensidad "			" ?duracion crlf)
	)

; ;;; Fin declaracion de reglas ------------------------------
