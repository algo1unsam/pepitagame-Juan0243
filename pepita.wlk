import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.origin()

	method image() {
		if (self.estaEnElNido()) {
			return "pepita-grande.png"
			} else if (self.esAtrapada(silvestre) or self.estaCansada()){
				return "pepita-gris.png"
			} 
			else {
				return "pepita.png"
			}
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {
		if(!self.estaCansada() and self.dentroDeLimite(nuevaPosicion)){
		  self.vola(position.distance(nuevaPosicion))
		  position = nuevaPosicion
    	}
//si se cansa, finaliza el juego
		if (self.estaCansada()) {
                game.say(self, "Me canse")
                game.stop()
        }
	}

	method estaCansada() {
		return energia <= 0
	}

	method estaEnElNido() {
		return position == nido.position()
	}
	
	method estaEnElSuelo() {
		return position.y() == 0 
	}

//es atrapada
	method esAtrapada(silvestre) = self.position() == silvestre.position()

//LIMITES
	method dentroDeLimite(nuevaPosicion) {
        return nuevaPosicion.x().between(0, 9) and nuevaPosicion.y().between(0, 9) 
    }
//GRAVEDAD
	method caer() {
        if (position.y() > 0) { 
            position = position.down(1)
        }
    }
}

