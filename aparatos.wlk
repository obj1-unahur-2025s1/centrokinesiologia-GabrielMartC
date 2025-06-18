class AparatoMagneto{
    var color = "blanco"
    var puntosImantacion = 800

    method color() = color

    method accionesAlSerUsado(unaPersona){
        unaPersona.sanarDolorMusc(unaPersona.nivelDolorMusc() * 0.1)
        puntosImantacion = 0.max(puntosImantacion - 1)
    }

    method puedeSerUsadoPor(unaPersona) = true

    method necesitaMantenimiento() = puntosImantacion < 100

    method hacerMantenimiento(){
        puntosImantacion += 100
    }
}

class AparatoBicicleta{
    var color = "blanco"
    var cantVecesDesajusteTornillos = 0
    var cantVecesPierdeAceite = 0

    method color() = color

    method accionesAlSerUsado(unaPersona){
        if(unaPersona.nivelDolorMusc() > 30 && unaPersona.edad().between(30, 50)){
            cantVecesDesajusteTornillos += 1
            cantVecesPierdeAceite += 1
        }
        else if(unaPersona.nivelDolorMusc() > 30){
            cantVecesDesajusteTornillos += 1
        }
        unaPersona.sanarDolorMusc(4)
        unaPersona.aumentarFortalezaMusc(3)
        
    }

    method puedeSerUsadoPor(unaPersona) = unaPersona.edad() > 8

    method necesitaMantenimiento() = cantVecesDesajusteTornillos >= 10 || cantVecesPierdeAceite >= 5

    method hacerMantenimiento(){
        cantVecesDesajusteTornillos = 0
        cantVecesPierdeAceite = 0
    }
}

class AparatoMinitramp{
    var color = "blanco"

    method color() = color

    method accionesAlSerUsado(unaPersona){
        unaPersona.aumentarFortalezaMusc(unaPersona.edad() * 0.1)
    }

    method puedeSerUsadoPor(unaPersona) = unaPersona.nivelDolorMusc() < 20

    method necesitaMantenimiento() = false

    method hacerMantenimiento(){}
}