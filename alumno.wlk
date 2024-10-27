import materia.*
import carrera.*



class MateriaAprobada {
    var property materia //objeto de la clase materia
    var property nota
}

class Alumno {
    var property carreras
    var property materiasAprobadas = #{} /* objetos de la clase MateriaAprobada */

    method registrarMateria(materia, nota){
        const materiaNueva = new MateriaAprobada (materia = materia, nota = nota)
        
        self.validarAgregarNota(materia, nota)

        materiasAprobadas.add(materiaNueva)
    }
    method validarAgregarNota(materia, nota){

        if (self.tieneMateriaAprobada(materia)){
            self.error("La materia ya la tiene aprobada")
        }else if(nota<4){
            self.error("La materia NO está aprobada")
        }
    }
    method tieneMateriaAprobada(materia){ 
        return self.lasMateriasAprobadas().contains(materia)
    }
    method lasMateriasAprobadas(){
        return materiasAprobadas.map({materiaAprobada => materiaAprobada.materia()})
    }
    method cantMateriasAprobadas(){
        return materiasAprobadas.size()
    }
    method promedioMateriasAprobadas(){
        return self.sumaDeNotas() / self.cantMateriasAprobadas()
    }
    method sumaDeNotas(){
        return materiasAprobadas.sum({materia => materia.nota()})
    }
    method materiasDeLasCarreras(){
        return carreras.map({carrera => carrera.materias()}).flatten()
    }
    
    method agregarCarrera(carrera){
        carreras.add(carrera)
    }
    method inscribirAMateria(materia){
        self.validarPuedeInscribirse(materia)
        materia.inscribirAlumno(self)

    }
    method validarPuedeInscribirse(materia){
        if(not self.esMateriaDeCarreraQueEstudia(materia)){ 
            self.error("No es una materia de la/s carrera/s que estudia")
        }else if(self.tieneMateriaAprobada(materia)){
            self.error("Ya tiene la materia aprobada")
        }else if(materia.estaInscripto(self)){
            self.error("Ya está inscripto en la materia")
        }else if(materia.noCumpleLasCorrelativas(self.lasMateriasAprobadas())){
            self.error("No cumple con las correlativas!")
        }
    }
    method puedeInscribirse(materia){
        return self.esMateriaDeCarreraQueEstudia(materia) and
               self.noTieneLaMateriaAprobada(materia)     and
               materia.cumpleLosRequisitos(self)
                
    }
    method esMateriaDeCarreraQueEstudia(materia){
        return self.materiasDeLasCarreras().contains(materia) 
    }
    method noTieneLaMateriaAprobada(materia){
        return not self.tieneMateriaAprobada(materia)
    }
    method darDeBaja(materia){
        materia.darDeBaja(self)
    }


}