import aparatos.*

class Persona{
  var edad
  var nivelFortalezaMusc
  var nivelDolorMusc

  method puedeUsarAparato(unAparato) = unAparato.puedeSerUsadoPor(self)
  
  method usarAparato(unAparato){
    if(!self.puedeUsarAparato(unAparato)){
      self.error("el paciente no puede usar ese aparato")
    }

    unAparato.accionesAlSerUsado(self)

  }

  method nivelFortalezaMusc() = nivelFortalezaMusc
  method aumentarFortalezaMusc(unValor) {
    nivelFortalezaMusc = nivelFortalezaMusc + unValor
  }

  method nivelDolorMusc() = nivelDolorMusc
  method sanarDolorMusc(unValor) {
    nivelDolorMusc = 0.max(nivelDolorMusc - unValor)
  }

  method edad() = edad 

}