import inscripcion.*


class MateriaAprobada {
    var property nombre = null
    var property nota = null

}

class Alumno {
    var property nombre = null
    var property carreras = #{}
    var property materiasCursando = #{} /* objetos de la clase MateriaAprobada */
    var property materiasAprobadas = #{} /* objetos de la clase MateriaAprobada */



    method agregarMateria(materia, nota){
        const materiaNueva = new MateriaAprobada (nombre = materia, nota = nota)
        
        self.validarAgregarNota(materiaNueva, nota)


        materiasAprobadas.add(materiaNueva)
    }


    method materiasDeLasCarreras(){
        return carreras.all({carrera => self.materiasDeLaCarrera(carrera)}).flatten()
    }

    method materiasDeLaCarrera(carrera){
        return carrera.materias()
    }

    method validarAgregarNota(materia, nota){
        




        if (self.tieneMateriaAprobada(materia)){
            self.error("La materia ya la tiene aprobada")
        }else if(nota<=4){
            self.error("La materia NO está aprobada")

        }
    }
    
    method tieneMateriaAprobada(materia){ 
        return materiasAprobadas.any({nota => nota.nombre() == materia})
    }

    method cantMateriasAprobadas(){
        return materiasAprobadas.size()
    }

    method sumaDeNotas(){
        return materiasAprobadas.sum({nota => nota.nota()})
    }


    method promedioMateriasAprobadas(){
        return self.sumaDeNotas() / self.cantMateriasAprobadas()
    }

    method materiaEstaAprobada(materia){ 
        return materiasAprobadas.any({nota => nota.materia() == materia})
    }




    


}