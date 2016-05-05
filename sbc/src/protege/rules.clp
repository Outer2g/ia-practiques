; Thu May 05 00:41:54 CEST 2016
; 
;+ (version "3.4.8")
;+ (build "Build 629")


(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
        (is-a USER)
        (role abstract)
        (single-slot edad
;+              (comment "Edad de la persona en anyos")
                (type INTEGER)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot objetivo
;+              (comment "Objetivo que se desea conseguir con el programa de entrenamiento")
                (type STRING)
;+              (value "MANTENIMIENTO" "FORMA" "REBAJAR_PESO" "EQUILIBRIO" "MUSCULACIÓN" "FLEXIBILIDAD")
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot peso
;+              (comment "Peso de la persona en KG")
                (type FLOAT)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot tiempo_diario
;+              (comment "Tiempo diario que se dispone para el entrenamiento")
                (type INTEGER)
                (range 30 %3FVARIABLE)
;+              (cardinality 0 1)
                (create-accessor read-write))
        (single-slot duracion_actividad
;+              (comment "Duracion de la actividad en minutos")
                (type INTEGER)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot duracion_ejercicio_max
;+              (comment "Duracion maxima del ejercicio en minutos")
                (type INTEGER)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (multislot grupos_musculares
                (type STRING)
;+              (value "Abdominales" "Pectorales" "Biceps" "Triceps" "Gemelos" "Quadriceps" "Espalda")
                (cardinality 1 ?VARIABLE)
                (create-accessor read-write))
        (single-slot calorias_por_minuto
;+              (comment "Nombre de calorias por minuto que se consumen haciendo el ejercicio")
                (type INTEGER)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot ontologia_Class14
                (type STRING)
;+              (cardinality 0 1)
                (create-accessor read-write))
        (single-slot duracion_ejercicio_min
;+              (comment "Duracion minima del ejercicio en minutos")
                (type INTEGER)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (multislot actividades
;+              (comment "Actividades fisicas que realiza la persona")
                (type INSTANCE)
;+              (allowed-classes)
                (create-accessor read-write))
        (single-slot nombre_ejercicio
;+              (comment "Nombre del ejercicio")
                (type STRING)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot nombre_actividad
;+              (comment "Nombre de la actividad")
                (type STRING)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot repeticiones_min
;+              (comment "Numero minimo de repeticiones del ejercicio")
                (type INTEGER)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot frecuencia_actividad
;+              (comment "Frecuencia de la actividad")
                (type STRING)
;+              (value "DIARIA" "SEMANAL" "MENSUAL")
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot altura
;+              (comment "Altura de la persona en cm")
                (type INTEGER)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot repeticiones_max
;+              (comment "Numero maximo de repeticiones del ejercicio")
                (type INTEGER)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot ontologia_Class23
                (type STRING)
;+              (cardinality 0 1)
                (create-accessor read-write))
        (single-slot ontologia_Class22
                (type STRING)
;+              (cardinality 0 1)
                (create-accessor read-write))
        (single-slot presion_sanguinea
;+              (comment "Presion sanguinea en mmHg")
                (type INTEGER)
;+              (cardinality 1 1)
                (create-accessor read-write)))

(defclass Persona
        (is-a USER)
        (role concrete)
        (multislot actividades
;+              (comment "Actividades fisicas que realiza la persona")
                (type INSTANCE)
;+              (allowed-classes)
                (create-accessor read-write))
        (single-slot edad
;+              (comment "Edad de la persona en anyos")
                (type INTEGER)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot presion_sanguinea
;+              (comment "Presion sanguinea en mmHg")
                (type INTEGER)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot altura
;+              (comment "Altura de la persona en cm")
                (type INTEGER)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot peso
;+              (comment "Peso de la persona en KG")
                (type FLOAT)
;+              (cardinality 1 1)
                (create-accessor read-write)))

(defclass Actividad
        (is-a USER)
        (role concrete)
        (single-slot nombre_actividad
;+              (comment "Nombre de la actividad")
                (type STRING)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot duracion_actividad
;+              (comment "Duracion de la actividad en minutos")
                (type INTEGER)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot frecuencia_actividad
;+              (comment "Frecuencia de la actividad")
                (type STRING)
;+              (value "DIARIA" "SEMANAL" "MENSUAL")
;+              (cardinality 1 1)
                (create-accessor read-write)))

(defclass Programa_entrenamiento
        (is-a USER)
        (role concrete)
        (single-slot tiempo_diario
;+              (comment "Tiempo diario que se dispone para el entrenamiento")
                (type INTEGER)
                (range 30 %3FVARIABLE)
;+              (cardinality 0 1)
                (create-accessor read-write))
        (single-slot objetivo
;+              (comment "Objetivo que se desea conseguir con el programa de entrenamiento")
                (type STRING)
;+              (value "MANTENIMIENTO" "FORMA" "REBAJAR_PESO" "EQUILIBRIO" "MUSCULACIÓN" "FLEXIBILIDAD")
;+              (cardinality 1 1)
                (create-accessor read-write)))

(defclass Ejercicio
        (is-a USER)
        (role concrete)
        (single-slot repeticiones_max
;+              (comment "Numero maximo de repeticiones del ejercicio")
                (type INTEGER)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot repeticiones_min
;+              (comment "Numero minimo de repeticiones del ejercicio")
                (type INTEGER)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot duracion_ejercicio_min
;+              (comment "Duracion minima del ejercicio en minutos")
                (type INTEGER)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot duracion_ejercicio_max
;+              (comment "Duracion maxima del ejercicio en minutos")
                (type INTEGER)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (multislot grupos_musculares
                (type STRING)
;+              (value "Abdominales" "Pectorales" "Biceps" "Triceps" "Gemelos" "Quadriceps" "Espalda")
                (cardinality 1 ?VARIABLE)
                (create-accessor read-write))
        (single-slot nombre_ejercicio
;+              (comment "Nombre del ejercicio")
                (type STRING)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot calorias_por_minuto
;+              (comment "Nombre de calorias por minuto que se consumen haciendo el ejercicio")
                (type INTEGER)
;+              (cardinality 1 1)
                (create-accessor read-write)))
;================================================================================
;============================== Preguntas =======================================
;================================================================================
; Obtiene una respuesta del conjunto de posibles valores
(deffunction pregunta (?pregunta $?posibles-valores)
  (bind $?lowcase-valores (create$))
  (progn$ (?var ?posibles-valores
    (bind $?lowcase-valores (insert$ $?lowcase-valores (+ (length $?lowcase-valores) 1) (lowcase ?var)))
  )
  (format t "¿%s? (%s) " ?pregunta (implode$ ?posibles-valores  (bind ?respuesta (read))
  (while (not (member (lowcase ?respuesta) ?lowcase-valores)) do
    (format t "¿%s? (%s) " ?pregunta (implode$ ?posibles-valores    (bind ?respuesta (read))
  )
  ?respuesta
)

; Obtiene una respuesta 
(deffunction pregunta-general (?pregunta)
  (format t "¿%s? " ?pregunta)
  (bind ?respuesta (read))
  ?respuesta
)

; Realiza una pregunta binaria
(deffunction pregunta-s-n (?pregunta)
  (bind ?respuesta (pregunta ?pregunta si no s n))
  (if (or (eq (lowcase ?respuesta) si) (eq (lowcase ?respuesta) s))
    then TRUE 
    else FALSE
  )
)

; Funcion para hacer una pregunta con respuesta numerica unica
(deffunction pregunta-num (?pregunta ?rangstart ?rangend)
  (format t "%s [%d, %d] " ?pregunta ?rangstart ?rangend)
  (bind ?respuesta (read))
  (while (not(and(>= ?respuesta ?rangstart)(<= ?respuesta ?rangend))) do
    (format t "%s [%d, %d] " ?pregunta ?rangstart ?rangend)
    (bind ?respuesta (read))
  )
  ?respuesta
)


(defrule preguntaEdad "regla para preguntar edad"
        (declare (salience 2))
        (not (tengoEdad))
        =>
        (bind ?edad (pregunta-num "Que edad tienes: " 12 99))
        (if (< ?edad 18)
        then
        (printout t "It's adolescente" crlf)
        (assert (edadBiologica adolescente))
        else
        (if (< ?edad 30)
                then
                (printout t "It's joven" crlf)
                (assert (edadBiologica joven))
                else
                (if (< ?edad 60)
                        then
                        (printout t "It's maduro" crlf)
                        (assert (edadBiologica  maduro))
                        else 
                        (printout t "It's viejo" crlf)
                        (assert (edadBiologica viejo))
                        )
                )
        )
        (assert (tengoEdad))
        )
(defrule preguntaAltura "regla para preguntar altura"
    (declare (salience 2))
    (not (tengoAltura))
    =>
    (bind ?altura (pregunta-num "Cúal es tu altura (en cm): " 1.20 2.20))
    (assert (altura ?altura))
    (assert (tengoAltura))
    )
(defrule preguntaPeso "regla para preguntar peso"
    (declare (salience 2))
    (not (tengoPeso))
    =>
    (bind ?peso (pregunta-num "Cuanto pesas (en kg): " 30 200))
    (assert (peso ?peso))
    (assert (tengoPeso))
    )
(defrule calculaMasa "regla que calcula la masa corporal"
    (altura ?altura)
    (peso ?peso)
    =>
    (assert (masa (/ ?peso (* ?altura ?altura))))
    )

(defrule estado-obeso "la persona es obesa si masa mayor que 30"
    (masa ?x&:(> ?x 30))
    =>
    (assert ( estado-fisico obeso))
    )
(defrule estado-sobrepeso "la persona tiene sobrepeso si masa entre 25 y 29.9"
    (masa ?x&:(> ?x 25))
    (test (< ?x 29.9))
    =>
    (assert ( estado-fisico sobrepeso))
    )
(defrule estado-peso-normal "la persona tiene peso normal si masa entre 18.5 y 24.9"
    (masa ?x&:(> ?x 18.5))
    (test (< ?x 24.9))
    =>
    (assert ( estado-fisico normal))
    )
(defrule estado-infrapeso "la persona sufre de infrapeso si masa menor que 18.5"
    (masa ?x&:(< ?x 18.5))
    =>
    (assert ( estado-fisico infrapeso))
    )
;"si la persona es obesa, mayor que 30"
;"si la persona tiene sobrepeso, entre 25 y 29.9"
;"si la persona tiene peso normal, entre 18.5-24.9"
;"si la persona tiene infrapeso, entre 18.5"

;================================================================================
;================================ MAIN ==========================================
;================================================================================

(defrule comienzo "regla inicial"
    (declare (salience 10))
        (initial-fact)
        =>
        (printout t crlf)
        (printout t "--------------------------------------------------------------" crlf)
        (printout t "------- I'm no couch potato - Recomendador de rutinas --------" crlf)
        (printout t "--------------------------------------------------------------" crlf)
        (printout t crlf)
)