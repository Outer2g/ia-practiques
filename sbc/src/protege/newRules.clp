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
    (if (or (eq (lowcase ?respuesta) si) (eq (lowcase ?respuesta) s))
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


;;; Fin declaracion de templates ----------------------



;;; Declaracion de funciones --------------------------



;;; Fin declaracion de funciones -----------------------
    
    
    
;;; Declaracion de reglas y hechos ---------------------
(defmodule MAIN (export ?ALL))

(defrule comienzo "regla inicial"
    (declare (salience 10))
        (initial-fact)
        =>
        (printout t crlf)
        (printout t "--------------------------------------------------------------" crlf)
        (printout t "------- I'm no couch potato - Recomendador de rutinas --------" crlf)
        (printout t "--------------------------------------------------------------" crlf)
        (printout t crlf)
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
    (bind ?objetivo (pregunta "Cúal es el objetivo de tu entrenamiento" Musculacion Flexibilidad Fitness))
    (assert (objetivo ?objetivo))
    (assert (tengoObjetivo))
    )
(defrule pregunta-Si-Prueba "pregunta si el usuaro ha hecho la prueba de intensidad"
    (not (tengoSiPrueba))
    =>
    (bind ?resposta (pregunta-sino "Has realizado la prueba de intensidad recomendada"))
    (assert (tengoSiPrueba))
    if (eq ?resposta TRUE) then
        (assert (haRealizadoPrueba))
    )
(defrule pregunta-Si-Tiene-Problemas-Salud "pregunta si el usuario tiene algun tipo de problema"
    (not (tengoSiProblemaSalud))
    =>
    (bind ?resposta (pregunta-sino "Tiene usted algun problema de salud"))
    (assert (tengoSiProblemaSalud))
    if (eq ?resposta TRUE) then
        (assert (tieneProblemasSalud))
    )
    )

(defrule pregunta-Problemas-Salud "pregunta por los posibles problmas de salud del usuario"
    (tieneProblemasSalud)
    =>
    (printout t "TODO: PEDIR problemas salud" crlf)
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
(defrule crea-lista-recomendaciones "Se crea una lista de recomendaciones para ordenarlas"
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
)


; ;;; Fin declaracion de reglas ------------------------------
