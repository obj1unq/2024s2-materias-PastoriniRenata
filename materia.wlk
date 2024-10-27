import alumno.*
import carrera.*
import materiasAprobadas.*

class Materia{
    const property correlativas
    var property alumnosCursando //objetos de la clase Alumno
    var property cupos
    var property listaDeEspera = []

    method inscribirAlumno(alumno){
        if(cupos>0){
            alumnosCursando.add(alumno)
            cupos -= 1
        }else{
            listaDeEspera.add(alumno)
        }

         
    }
    method estadoDeInscripcion() {
      return "los alumnos inscriptos son:  " + self.nombresAlumnos(alumnosCursando) + "  y los alumnos en lista de espera son: " + self.nombresAlumnos(listaDeEspera)
    }
    method nombresAlumnos(alumnos){
        return alumnos.map({alumno => alumno.nombre()}).join(", ") //join sirve para unificar en un unico string una lsita de strings
    }
     method estaInscripto(alumno){
        return self.alumnosCursando().contains(alumno)
    }
    method cumpleLasCorrelativas(materiasAprobadasDelAlumno){ 
        return correlativas.all({materia => materiasAprobadasDelAlumno.contains(materia)})
    }
    method darDeBaja(alumno){
        alumnosCursando.remove(alumno)
        cupos += 1

        if(not listaDeEspera.isEmpty()){
            const nuevoAlumno = listaDeEspera.first()
            self.inscribirAlumno(nuevoAlumno) // ya verifiqué todo lo necesario para poder inscribirlo cuando quedó en la lista d espera, así q puedo inscribirlo directamente 
                                            // y no es necesario hacer nuevoAlumno.inscribirAMateria(self)
            listaDeEspera.remove(nuevoAlumno)
        }
    }

    
}