import wollok.game.*
import clasesComunes.*
import caballerosRivales.*
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
		game.onTick(100, "avanzaRival", { rival.moverse()})
		game.onTick(100, "avanzaJugador", { jugador.moverse()})
		game.removeTickEvent("mueveFlecha")
		caballerosRivales.velocidadAdquirida(flecha.seleccion())
	}

	method colisionCaballeros(unaPosicion) {
		game.addVisual(new Visual(image = "caballeros2.png", position = unaPosicion))
		game.removeTickEvent("avanzaJugador")
		game.removeTickEvent("avanzaRival")
		game.removeVisual(rival)
		game.removeVisual(jugador)
		game.addVisual(new Visual(image = "mensajePrueba.png", position = new Position(x = 15, y = 0)))
	}

}

object jugador inherits Caballero(image = "caballero_azul.png", position = game.at(30, 7)) {

	override method moverse() {
		if (self.hayColision()) {
			velocidad.colisionCaballeros(self.position())
		} else {
			self.position(self.position().left(1))
		}
	}

	method hayColision() {
		return self.position().x() - 1 == rival.position().x()
	}

}

object rival inherits Caballero(image = "caballero_rojo.png", position = game.at(0, 2)) {

	override method moverse() {
		self.position(self.position().right(1))
	}

}

object flecha inherits Puntero(position = new Position(x = 49, y = 7), image = "flecha_velocidad.png") {

	override method setearVisual() {
		game.addVisual(self)
		game.onTick(caballerosRivales.dificultad().nivel() * 100, "mueveFlecha", { self.moverse(0)})
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
	} else if (self.position().y().between(17, 22)) {
		200
	} else {
		400
	}

}


