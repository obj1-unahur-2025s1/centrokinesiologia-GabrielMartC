class AparatoMagneto{
    var color = "blanco"

    method color() = color

    method accionesAlSerUsado(unaPersona){
        unaPersona.sanarDolorMusc(unaPersona.nivelDolorMusc() * 0.1)
    }

    method puedeSerUsadoPor(unaPersona) = true
}

class AparatoBicicleta{
    var color = "blanco"

    method color() = color

    method accionesAlSerUsado(unaPersona){
        unaPersona.sanarDolorMusc(4)
        unaPersona.aumentarFortalezaMusc(3)
    }

    method puedeSerUsadoPor(unaPersona) = unaPersona.edad() > 8

}

class AparatoMinitramp{
    var color = "blanco"

    method color() = color

    method accionesAlSerUsado(unaPersona){
        unaPersona.aumentarFortalezaMusc(unaPersona.edad() * 0.1)
    }

    method puedeSerUsadoPor(unaPersona) = unaPersona.nivelDolorMusc() < 20

}