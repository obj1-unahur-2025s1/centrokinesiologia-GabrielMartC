import aparatos.*

class Persona{
  var edad
  var nivelFortalezaMusc
  var nivelDolorMusc
  const rutina //lista []

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

  method puedeRealizarRutina() = rutina.all({apar => self.puedeUsarAparato(apar)})

  method realizarRutina(){
    if(!self.puedeRealizarRutina()){
      self.error("el paciente no puede usar alguna maquina, no puede realizar la rutina.")
    }

    rutina.forEach({apar => self.usarAparato(apar)})
  }

}

class PacienteResistente inherits Persona{
  override method realizarRutina() {
    super()
    // self.aumentarFortalezaMusc(self.puntosPorAparUsado())
    self.aumentarFortalezaMusc(rutina.size())

  }

  // method puntosPorAparUsado() = rutina.count({})
}

class PacienteCaprichoso inherits Persona{
  override method puedeRealizarRutina() = super() && rutina.any({apar => apar.color() == "rojo"})

  override method realizarRutina(){
    if(!self.puedeRealizarRutina()){
      self.error("el paciente no puede usar alguna maquina, no puede realizar la rutina.")
    }

    rutina.forEach({apar => self.usarAparato(apar)})
    rutina.forEach({apar => self.usarAparato(apar)})
  }
}

class PacienteRapidaRecup inherits Persona{
  override method realizarRutina(){
    super()
    self.sanarDolorMusc(curacionRapidaRecup.valor())
  }
}

object curacionRapidaRecup{
  var valorCuracion = 3

  method valor() = valorCuracion
  method nuevoValor(unValor) {valorCuracion = unValor}

}