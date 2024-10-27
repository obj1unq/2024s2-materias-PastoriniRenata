import materia.*
import carrera.*
import materiasAprobadas.*


class Alumno {
    var property carreras
    var property materiasAprobadas = #{} /* objetos de la clase MateriaAprobada */
    const property nombre

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
        return materiasAprobadas.map({materiaAprobada => materiaAprobada.materia()}).asSet()
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
        }else if(not materia.cumpleLasCorrelativas(self.lasMateriasAprobadas())){
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
    method materiasInscripto(){
        /*
        Brindar información útil para une estudiante, específicamente: las materias en las que está inscripto, las materias en las que quedó en lista de espera. 
        Para esto, usar la lista de todas las materias de las carreras que cursa, resuelto en un punto anterior.
        */
        return self.materiasDeLasCarreras().filter({materia => materia.alumnosCursando().contains(self)}).asSet()



    }
    method materiasEnListaDeEspera(){
        /*
        Brindar información útil para une estudiante, específicamente: las materias en las que está inscripto, las materias en las que quedó en lista de espera. 
        Para esto, usar la lista de todas las materias de las carreras que cursa, resuelto en un punto anterior.
        */
        return self.materiasDeLasCarreras().filter({materia => materia.listaDeEspera().contains(self)}).asSet()


    }
    /*
    10. Más información sobre une estudiante: dada una carrera, conocer todas las materias de esa carrera a las que se puede inscribir. Sólo vale si el estudiante está cursando esa carrera.  
    */
    method materiasALasQueSePuedeinscribir(carrera){
        self.validarSiEstudiaLaCarrera(carrera)
        return self.materiasHabilitadasParaInscribirse(carrera)
    }
    method materiasHabilitadasParaInscribirse(carrera){
        return self.materiasPendientesDeCursar(carrera).filter({materia => materia.cumpleLasCorrelativas(self.lasMateriasAprobadas())})
    }
    method materiasPendientesDeCursar(carrera){
        return carrera.materias().filter({materia => not self.lasMateriasAprobadas().contains(materia)})
    }


    method validarSiEstudiaLaCarrera(carrera) {
        if(not self.estudiaLaCarrera(carrera)){
            self.error("No estudia la carrera")
        }
    }
    method estudiaLaCarrera(carrera){
        return carreras.contains(carrera)
    }

}