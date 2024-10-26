object universidad{
/*  
  
    var property carreras = #{programacion, medicina, derecho }
    
    const property programacion = new Carrera (nombre = "programacion", materias = #{})
    const property medicina     = new Carrera (nombre = "medicina", materias = #{})
    const property derecho      = new Carrera (nombre = "derecho", materias = #{})

    var property materiasProg = #{elementosDeProgramacion, matematica1, objetos1, objetos2, objetos3, trabajoFinal, basesDeDatos}
    var property materiasMed  = #{quimica, biologia1, biologia2, anatomiaGeneral}
    var property materiasDer  = #{}


    var property elementosDeProgramacion = new Materia(nombre = "elementosDeProgramacion"  , carrera = programacion)
    var property matematica1             = new Materia(nombre = "matematica1" , carrera = programacion)
    var property objetos1                = new Materia(nombre = "objetos1", carrera = programacion)
    var property objetos2                = new Materia(nombre = "objetos2" , carrera = programacion)
    var property objetos3                = new Materia(nombre = "objetos 3" , carrera = programacion)
    var property trabajoFinal            = new Materia(nombre = "trabajoFinal", carrera = programacion)
    var property basesDeDatos            = new Materia(nombre = "basesDeDatos", carrera = programacion)

    var property quimica         = new Materia (nombre = "quimica", carrera = medicina)
    var property biologia1       = new Materia (nombre = "biologia1", carrera = medicina)
    var property biologia2       = new Materia (nombre = "biologia2", carrera = medicina)
    var property anatomiaGeneral = new Materia (nombre = "anatomiaGeneral", carrera = medicina)
    

    var property latin                       = new Materia (nombre = "latin", carrera = derecho)
    var property derechoRomano               = new Materia (nombre = "derechoRomano", carrera = derecho)
    var property historiaDelDerechoArgentino = new Materia (nombre = "historiaDelDerechoArgentino", carrera = derecho)
    var property derechoPenal1               = new Materia (nombre = "derechoPenal1", carrera = derecho)
    var property derechoPenal2               = new Materia (nombre = "derechoPenal2", carrera = derecho)


*/
    

}


class Materia{
    var property nombre = null //un string
    var property carrera = null
    var property requisitos = null //correlativas
    

}
class Carrera{
    var property nombre = null//un string
    var property materias = null //??

}