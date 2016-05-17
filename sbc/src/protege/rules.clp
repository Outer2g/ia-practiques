; Thu May 05 00:41:54 CEST 2016
; Fri May 06 11:46:49 CEST 2016
; 
;+ (version "3.4.8")
;+ (build "Build 629")


(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
    (is-a USER)
    (role abstract)
    (single-slot edad
;+      (comment "Edad de la persona en anyos")
        (type INTEGER)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot peso
;+      (comment "Peso de la persona en KG")
        (type FLOAT)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot programa_entrenamiento
        (type INSTANCE)
;+      (allowed-classes Programa_entrenamiento)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot tiempo_diario
;+      (comment "Tiempo diario que se dispone para el entrenamiento")
        (type INTEGER)
        (range 30 %3FVARIABLE)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot duracion_actividad
;+      (comment "Duracion de la actividad en minutos")
        (type INTEGER)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot duracion_ejercicio_max
;+      (comment "Duracion maxima del ejercicio en minutos")
        (type INTEGER)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot calorias_por_minuto
;+      (comment "Nombre de calorias por minuto que se consumen haciendo el ejercicio")
        (type INTEGER)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot ontologia_Class14
        (type STRING)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot ontologia_Class8
        (type STRING)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot duracion_ejercicio_min
;+      (comment "Duracion minima del ejercicio en minutos")
        (type INTEGER)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot ontologia_Class2
        (type STRING)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (multislot actividades
;+      (comment "Actividades fisicas que realiza la persona")
        (type INSTANCE)
;+      (allowed-classes Actividad_fisica)
        (create-accessor read-write))
    (single-slot dificultad
;+      (comment "Dificultad del ejercicio, del 1 al 3 indicando el 3 la dificultad máxima y el 1 la dificultad mínima")
        (type INTEGER)
        (range 1 3)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot nombre_ejercicio
;+      (comment "Nombre del ejercicio")
        (type STRING)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot objetivo_programa
;+      (comment "Objetivo que se desea conseguir con el programa de entrenamiento")
        (type INSTANCE)
;+      (allowed-classes Objetivo)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot nombre_actividad
;+      (comment "Nombre de la actividad")
        (type STRING)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (multislot objetivos_ejercicio
        (type INSTANCE)
;+      (allowed-classes Objetivo)
        (create-accessor read-write))
    (single-slot repeticiones_min
;+      (comment "Numero minimo de repeticiones del ejercicio")
        (type INTEGER)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot frecuencia_actividad
;+      (comment "Frecuencia de la actividad")
        (type SYMBOL)
        (allowed-values DIARIA SEMANAL MENSUAL)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot altura
;+      (comment "Altura de la persona en cm")
        (type INTEGER)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot repeticiones_max
;+      (comment "Numero maximo de repeticiones del ejercicio")
        (type INTEGER)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot ontologia_Class23
        (type STRING)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot ontologia_Class22
        (type STRING)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot presion_sanguinea
;+      (comment "Presion sanguinea en mmHg")
        (type INTEGER)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot nombre_objetivo
        (type STRING)
;+      (cardinality 0 1)
        (create-accessor read-write)))

(defclass Persona
    (is-a USER)
    (role concrete)
    (single-slot programa_entrenamiento
        (type INSTANCE)
;+      (allowed-classes Programa_entrenamiento)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (multislot actividades
;+      (comment "Actividades fisicas que realiza la persona")
        (type INSTANCE)
;+      (allowed-classes Actividad_fisica)
        (create-accessor read-write))
    (single-slot edad
;+      (comment "Edad de la persona en anyos")
        (type INTEGER)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot presion_sanguinea
;+      (comment "Presion sanguinea en mmHg")
        (type INTEGER)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot altura
;+      (comment "Altura de la persona en cm")
        (type INTEGER)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot peso
;+      (comment "Peso de la persona en KG")
        (type FLOAT)
;+      (cardinality 0 1)
        (create-accessor read-write)))

(defclass Actividad_fisica
    (is-a USER)
    (role concrete)
    (single-slot nombre_actividad
;+      (comment "Nombre de la actividad")
        (type STRING)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot duracion_actividad
;+      (comment "Duracion de la actividad en minutos")
        (type INTEGER)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot frecuencia_actividad
;+      (comment "Frecuencia de la actividad")
        (type SYMBOL)
        (allowed-values DIARIA SEMANAL MENSUAL)
;+      (cardinality 0 1)
        (create-accessor read-write)))

(defclass Programa_entrenamiento
    (is-a USER)
    (role concrete)
    (single-slot tiempo_diario
;+      (comment "Tiempo diario que se dispone para el entrenamiento")
        (type INTEGER)
        (range 30 %3FVARIABLE)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot objetivo_programa
;+      (comment "Objetivo que se desea conseguir con el programa de entrenamiento")
        (type INSTANCE)
;+      (allowed-classes Objetivo)
;+      (cardinality 0 1)
        (create-accessor read-write)))

(defclass Ejercicio
    (is-a USER)
    (role concrete)
    (single-slot repeticiones_max
;+      (comment "Numero maximo de repeticiones del ejercicio")
        (type INTEGER)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot repeticiones_min
;+      (comment "Numero minimo de repeticiones del ejercicio")
        (type INTEGER)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot duracion_ejercicio_min
;+      (comment "Duracion minima del ejercicio en minutos")
        (type INTEGER)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot dificultad
;+      (comment "Dificultad del ejercicio, del 1 al 3 indicando el 3 la dificultad máxima y el 1 la dificultad mínima")
        (type INTEGER)
        (range 1 3)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (multislot objetivos_ejercicio
        (type INSTANCE)
;+      (allowed-classes Objetivo)
        (create-accessor read-write))
    (single-slot duracion_ejercicio_max
;+      (comment "Duracion maxima del ejercicio en minutos")
        (type INTEGER)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot nombre_ejercicio
;+      (comment "Nombre del ejercicio")
        (type STRING)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot calorias_por_minuto
;+      (comment "Nombre de calorias por minuto que se consumen haciendo el ejercicio")
        (type INTEGER)
;+      (cardinality 0 1)
        (create-accessor read-write)))

(defclass Objetivo
    (is-a USER)
    (role concrete)
    (single-slot nombre_objetivo
        (type STRING)
;+      (cardinality 0 1)
        (create-accessor read-write)))
;================================================================================
;============================== Instancias ======================================
;================================================================================
(definstances instancies  
;+ (version "3.4.8")
;+ (build "Build 629")

([ontologia_Class1] of  Ejercicio

    (calorias_por_minuto 200)
    (dificultad 2)
    (duracion_ejercicio_max 30)
    (duracion_ejercicio_min 15)
    (nombre_ejercicio "Press Banca")
    (objetivos_ejercicio [ontologia_Class9])
    (repeticiones_max 20)
    (repeticiones_min 10))

([ontologia_Class10] of  Objetivo

    (nombre_objetivo "Espalda"))

([ontologia_Class10014] of  Objetivo

    (nombre_objetivo "Cardio"))

([ontologia_Class10015] of  Objetivo

    (nombre_objetivo "Abdominales"))

([ontologia_Class10016] of  Objetivo

    (nombre_objetivo "Flexibilidad"))

([ontologia_Class10017] of  Objetivo

    (nombre_objetivo "Equilibrio"))

([ontologia_Class10019] of  Ejercicio

    (calorias_por_minuto 400)
    (dificultad 1)
    (duracion_ejercicio_max 15)
    (duracion_ejercicio_min 19)
    (nombre_ejercicio "Elevaciones de disco")
    (objetivos_ejercicio [ontologia_Class11])
    (repeticiones_max 20)
    (repeticiones_min 15))

([ontologia_Class10020] of  Ejercicio

    (calorias_por_minuto 350)
    (dificultad 2)
    (duracion_ejercicio_max 30)
    (duracion_ejercicio_min 25)
    (nombre_ejercicio "Curl con mancuernas")
    (objetivos_ejercicio [ontologia_Class12])
    (repeticiones_max 8)
    (repeticiones_min 5))

([ontologia_Class10021] of  Ejercicio

    (calorias_por_minuto 380)
    (dificultad 2)
    (duracion_ejercicio_max 30)
    (duracion_ejercicio_min 25)
    (nombre_ejercicio "Extensiones de cuerda")
    (objetivos_ejercicio [ontologia_Class13])
    (repeticiones_max 8)
    (repeticiones_min 5))

([ontologia_Class10022] of  Ejercicio

    (calorias_por_minuto 300)
    (dificultad 2)
    (duracion_ejercicio_max 30)
    (duracion_ejercicio_min 25)
    (nombre_ejercicio "Sentadillas")
    (objetivos_ejercicio [ontologia_Class10023])
    (repeticiones_max 8)
    (repeticiones_min 5))

([ontologia_Class10023] of  Objetivo

    (nombre_objetivo "Piernas"))

([ontologia_Class10024] of  Ejercicio

    (calorias_por_minuto 100)
    (dificultad 1)
    (duracion_ejercicio_max 120)
    (duracion_ejercicio_min 30)
    (nombre_ejercicio "Bicicleta")
    (objetivos_ejercicio [ontologia_Class10014])
    (repeticiones_max 1)
    (repeticiones_min 1))

([ontologia_Class10025] of  Ejercicio

    (calorias_por_minuto 400)
    (dificultad 1)
    (duracion_ejercicio_max 20)
    (duracion_ejercicio_min 15)
    (nombre_ejercicio "Abdominales sin pesas")
    (objetivos_ejercicio [ontologia_Class10015])
    (repeticiones_max 7)
    (repeticiones_min 5))

([ontologia_Class10026] of  Ejercicio

    (calorias_por_minuto 70)
    (dificultad 1)
    (duracion_ejercicio_max 30)
    (duracion_ejercicio_min 25)
    (nombre_ejercicio "Caminar de puntillas")
    (repeticiones_max 5)
    (repeticiones_min 3))

([ontologia_Class10027] of  Ejercicio

    (calorias_por_minuto 50)
    (dificultad 1)
    (duracion_ejercicio_max 15)
    (duracion_ejercicio_min 10)
    (nombre_ejercicio "Intentar tocar el suelo con los dedos")
    (objetivos_ejercicio [ontologia_Class10016])
    (repeticiones_max 5)
    (repeticiones_min 3))

([ontologia_Class11] of  Objetivo

    (nombre_objetivo "Hombro"))

([ontologia_Class12] of  Objetivo

    (nombre_objetivo "Biceps"))

([ontologia_Class13] of  Objetivo

    (nombre_objetivo "Triceps"))

([ontologia_Class5] of  Ejercicio

    (calorias_por_minuto 250)
    (dificultad 3)
    (duracion_ejercicio_max 60)
    (duracion_ejercicio_min 45)
    (nombre_ejercicio "Remo")
    (objetivos_ejercicio [ontologia_Class10])
    (repeticiones_max 100)
    (repeticiones_min 80))

([ontologia_Class9] of  Objetivo

    (nombre_objetivo "Pecho"))

)
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
        (declare (salience 5))
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
    (declare (salience 5))
    (not (tengoAltura))
    =>
    (bind ?altura (pregunta-num "Cúal es tu altura (en cm): " 1.20 2.20))
    (assert (altura ?altura))
    (assert (tengoAltura))
    )
(defrule preguntaPeso "regla para preguntar peso"
    (declare (salience 5))
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
;"si la persona es obesa, mayor que 30"
;"si la persona tiene sobrepeso, entre 25 y 29.9"
;"si la persona tiene peso normal, entre 18.5-24.9"
;"si la persona tiene infrapeso, entre 18.5"

;================================================================================
;================= Problema Abstracto a Solucion Abstracta ======================
;================================================================================

(defrule puede-Basico"regla que decide si el usuario puede hacer los ejercicios basicos"
    (tengoEdad)
    =>
    (assert (puedePressBanca))
    (assert (puedeExtensionesCuerda))
    (assert (puedeSentadillas))
    (assert (puedeAbdominalesSinPesas))
    (assert (puedeCaminarPuntillas))
    (assert (puedeTocarSuelo))
    (assert (puedeRemo))
    (assert (puedeBicicleta))
    )
(defrule puede-Elevaciones-disco
    (or (edadBiologica joven) (edadBiologica maduro))
    =>
    (assert (puedeElevacionesDisco))
    )
(defrule puede-Curl-mancuernas
    (or (edadBiologica joven) (edadBiologica maduro))
    =>
    (assert(puedeCurlMancuernas))
    )

(defrule intensidad-baja "Cual sera la intensidad del ejercicio segun la edad de la persona, mas adelante dependera tambien de la condicion fisica y objetivos"
    (or (edadBiologica viejo) (edadBiologica adolescente))
    =>
    (assert (intensidad baja))
    )
(defrule intensidad-media
    (edadBiologica maduro)
    =>
    (assert (intensidad media))
    )
(defrule intensidad-alta
    (edadBiologica joven)
    =>
    (assert (intensidad alta))
    )
(defrule repes-obeso-sobrepeso "Cuantas repeticiones deberias hacer segun tu estado fisico"
    (puedePressBanca)
    (or (estado-fisico sobrepeso) (estado-fisico obeso))
    =>
    (assert (repes 15))
    )
(defrule repes-infrapeso
    (puedePressBanca)
    (estado-fisico infrapeso)
    =>
    (assert (repes 8))
    )
(defrule repes-normal
    (puedePressBanca)
    (estado-fisico normal)
    =>
    (assert (repes 12)))


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
        (assert (imprimeElevacionesLaterales 0))
        (assert (imprimeCurlMancuernas 0))
)
(defrule final "regla final"
    (declare (salience 1))
    =>
    (printout t crlf)
    (printout t "--------------------------------------------------------------" crlf)
    (printout t "--------------- Ejercicios que puedes realizar ---------------" crlf)
    (printout t "--------------------------------------------------------------" crlf)
    (printout t crlf)
    )
(defrule puedesbasico-r "imprime los ejercicios que puedes hacer"
    (declare (salience 0))
    (puedePressBanca)
    (puedeExtensionesCuerda)
    (puedeSentadillas)
    (puedeAbdominalesSinPesas)
    (puedeCaminarPuntillas)
    (puedeTocarSuelo)
    (puedeRemo)
    (puedeBicicleta)
    =>
    (printout t crlf)
    (printout t "Press Banca" crlf)
    (printout t crlf)
    (printout t "Extensiones cuerda" crlf)
    (printout t crlf)
    (printout t "Sentadillas" crlf)
    (printout t crlf)
    (printout t "Abdominales sin pesas" crlf)
    (printout t crlf)
    (printout t "Caminar de puntillas" crlf)
    (printout t crlf)
    (printout t "Tocar el suelo con los dedos con piernas estiradas" crlf)
    (printout t crlf)
    (printout t "Remo" crlf)
    (printout t crlf)
    (printout t "Bicicleta" crlf)
)
(defrule puedes-elevaciones-disco-r
    (declare (salience 0))
    (puedeElevacionesDisco)
    ?f<-(imprimeElevacionesLaterales ?x&:(= ?x 0))
    =>
    (printout t crlf)
    (printout t "Elevaciones de disco" crlf)
    (retract ?f)
    (assert (imprimeElevacionesLaterales 1))
    )
(defrule puedes-Curl-mancuernas-r
    (declare(salience 0))
    (puedeCurlMancuernas)
    ?f <- (imprimeCurlMancuernas ?x&:(= ?x 0))
    =>
    (printout t crlf)
    (printout t "Curl mancuernas" crlf)
    (retract ?f)
    (assert (imprimeCurlMancuernas 1))
    )
(defrule horariofinal "Totalmente arbitrario"
    (declare (salience -1))
    (imprimeCurlMancuernas ?x)
    (imprimeElevacionesLaterales ?y)
    (intensidad ?intensidad)
    (repes ?nrepes)
    =>
    (printout t "----------Horario semana ---------------------" crlf)
    (printout t crlf)
    (printout t crlf)
    (printout t "Lunes" crlf)
    (printout t crlf)
    (printout t "Press Banca" crlf)
    (if (= ?x 1) then 
        (printout t crlf)
        (printout t "Curl Mancuernas" crlf))

    (printout t crlf)
    (printout t "-------------------------------" crlf)
    (printout t crlf)
    (printout t "Martes" crlf)
    (printout t crlf)
    (printout t "Extensiones cuerda" crlf)
    (if (= ?y 1) then
        (printout t crlf)
        (printout t "Elevaciones disco" crlf))
    (printout t crlf)
    (printout t "-------------------------------" crlf)
    (printout t crlf)
    (printout t "Miercoles" crlf)
    (printout t crlf)
    (printout t "Sentadillas" crlf)
    (printout t crlf)
    (printout t "Bicicleta" crlf)
    (printout t crlf)
    (printout t "-------------------------------" crlf)
    (printout t crlf)
    (printout t "Jueves" crlf)
    (printout t crlf)
    (printout t "Abdominales sin pesas" crlf)
    (printout t crlf)
    (printout t "Remo" crlf)
    (printout t crlf)
    (printout t "----------------" crlf)
    (printout t crlf)
    (printout t "Viernes" crlf)
    (printout t crlf)
    (printout t "Caminar de puntillas" crlf)
    (printout t crlf)
    (printout t "Tocar suelo con los dedos con piernas estirada" crlf)
    (printout t "---------------- Intensidad ---------------" crlf)
    (printout t crlf)
    (printout t ?intensidad crlf)
    (printout t crlf)
    (printout t "---------------- Numero repeticiones ---------------" crlf)
    (printout t crlf)
    (printout t ?nrepes crlf)
    (printout t crlf)
    )