(deftemplate ejercicio
	(slot nombre_ej (type STRING))
	(slot grupo_muscular_principal (type STRING))
	(multislot grupo_muscular_secundario (type STRING)(cardinality 1 4))
	(slot objetos (allowed-strings "P" "NP" "M"))
	(slot dificultad (type INTEGER)(range 1 3))
	(slot series (type INTEGER))
	(slot repeticiones (type INTEGER))
)

(Pullover of ejercicio
	(nombre_ej Pullover)
	(grupo_muscular_principal "pectoral")
	(grupo_muscular_secundario "hombro" "tricep")
	(objetos "P")
	(dificultad 2)
)

assert (Pullover (series 3)(repeticiones 10))


