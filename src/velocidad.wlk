import wollok.game.*
import clasesComunes.*
import caballerosRivales.*
import personajes.*
import punteria.*
import carteles.*

object velocidad inherits Etapa(image = "background_1.png", position = game.at(0, 0)) {

	var hayOnTick = 0
	const sonidoGalopar = game.sound("galopar.wav")
	override method setearVisual() {
		game.addVisual(self)
		jugador.setearVisual()
		rival.setearVisual()
		flecha.setearVisual()
	}

	override method teclaEspaciadora() {
		if (hayOnTick == 0) {
			game.sound("caballo.wav").play()
			sonidoGalopar.play()
			self.tomaVelocidad()
			jugadorInvisible.aparecerEn(48,flecha.position().y()-1)
			jugadorInvisible.decirConstantemente(flecha.seleccion().toString() + "Km/h")
			hayOnTick = 1
		}	
	}

	override method teclaEnter() {
		if (jugador.hayColision()) {
			//game.say(flecha, flecha.seleccion().toString() + "Km/h")
			caballerosRivales.siguienteEtapa(punteria)
			jugadorInvisible.callar()
			game.removeVisual(jugadorInvisible)
		}
	}

	method tomaVelocidad() {
		game.onTick(100, "avanzaRival", { rival.moverse() })
		game.onTick(100, "avanzaJugador", { jugador.moverse() })
		game.removeTickEvent("mueveFlecha")
		jugador.velocidadAdquirida(flecha.seleccion())
	}

	method colisionCaballeros(unaPosicion) {
		sonidoGalopar.stop()
		game.sound("fight.wav").play()
		game.addVisual(new Visual(image = "colix.png", position = new Position(x = 9 , y = 0)))
		
		game.removeTickEvent("avanzaJugador")
		game.removeTickEvent("avanzaRival")
		game.removeVisual(rival)
		game.removeVisual(jugador)
		mensajeEnter.position( new Position(x = 15, y =1))
		mensajeEnter.setearVisual()
		//game.addVisual(new Visual(image = "mensajeEnter.png", position = new Position(x = 15, y =1)))
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
		90
	} else if (self.position().y().between(17, 21)) {
		220
	} else {
		320
	}

}
