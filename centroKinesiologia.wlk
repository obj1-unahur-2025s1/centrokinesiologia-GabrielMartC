import pacientes.*
import aparatos.*

class CentroKinesiologia{
    const pacientes //[]
    const aparatos //[]

    method coloresAparatos() = aparatos.map({apar => apar.color()}).asSet()

    method pacientesMenoresDe8Anios() = pacientes.filter({pac => pac.edad() <= 8})

    method cantPacientQueNoPuedenHacerRutina() = pacientes.count({pac => !pac.puedeRealizarRutina()}) 
}