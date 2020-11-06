import wollok.game.*
import clasesComunes.*
import caballerosRivales.*
import personajes.*
import punteria.*

object velocidad inherits Etapa(image = "background_1.png", position = game.at(0, 0)) {

	var hayOnTick = 0

	override method setearVisual() {
		game.addVisual(self)
		jugador.setearVisual()
		rival.setearVisual()
		flecha.setearVisual()
	}

	override method teclaEspaciadora() {
		if (hayOnTick == 0) {
			self.tomaVelocidad()
			hayOnTick = 1
		}	
	}

	override method teclaEnter() {
		if (jugador.hayColision()) {
			caballerosRivales.siguienteEtapa(punteria)
		}
	}

	method tomaVelocidad() {
		game.onTick(100, "avanzaRival", { rival.moverse() })
		game.onTick(100, "avanzaJugador", { jugador.moverse() })
		game.removeTickEvent("mueveFlecha")
		jugador.velocidadAdquirida(flecha.seleccion())
	}

	method colisionCaballeros(unaPosicion) {
		
		game.addVisual(new Visual(image = "colix.png", position = new Position(x = 9 , y = 0)))
		
		game.removeTickEvent("avanzaJugador")
		game.removeTickEvent("avanzaRival")
		game.removeVisual(rival)
		game.removeVisual(jugador)
		game.addVisual(new Visual(image = "mensajePrueba.png", position = new Position(x = 15, y =0)))
	}

}



object flecha inherits Puntero(position = new Position(x = 49, y = 7), image = "flecha_velocidad.png") {

	override method setearVisual() {
		game.addVisual(self)
		game.onTick(caballerosRivales.dificultad().velocidadSegunNivel() * 100, "mueveFlecha", { self.moverse(0) })
	}

	override method moverse(posicion) {
		if (not (self.position().y() == 22)) {
			self.position(self.position().up(1))
		} else {
			self.position(self.position().down(15))
		}
	}

	override method seleccion() = if (self.position().y().between(7, 17)) {
		100
	} else if (self.position().y().between(17, 21)) {
		200
	} else {
		400
	}

}
