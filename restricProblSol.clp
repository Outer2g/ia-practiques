(deffacts maximo
  (edad 50)
  (edad 12)
  (edad 68)
  (edad 37)
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
