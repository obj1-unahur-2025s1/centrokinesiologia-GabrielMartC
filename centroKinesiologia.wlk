import pacientes.*
import aparatos.*

class CentroKinesiologia{
    const pacientes //[]
    const aparatos //[]

    method coloresAparatos() = aparatos.map({apar => apar.color()}).asSet()

    method pacientesMenoresDe8Anios() = pacientes.filter({pac => pac.edad() <= 8})

    method cantPacientQueNoPuedenHacerRutina() = pacientes.count({pac => !pac.puedeRealizarRutina()}) 

    method estaEnOptimasCondiciones() = aparatos.all({apar => !apar.necesitaMantenimiento()})

    method estaComplicado() = self.aparatosPesimasCondiciones().size() >= (aparatos.size() / 2)

    method hacerMantenimientoAparatosPesimasCondiciones() = self.aparatosPesimasCondiciones().forEach({apar => apar.hacerMantenimiento()})

    method aparatosPesimasCondiciones() = aparatos.filter({apar => apar.necesitaMantenimiento()})

    //para test
    method agregarAparatoNuevo(unAparato){
        aparatos.add(unAparato)
    }
}