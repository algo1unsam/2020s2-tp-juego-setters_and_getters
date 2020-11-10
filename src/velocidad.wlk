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
		jugador.aparecerEn(30, 7)
		rival.aparecerEn(0, 2)
		flecha.setearVisual()
	}

	override method teclaEspaciadora() {
		if (hayOnTick == 0) {
			game.sound("caballo.wav").play()
			if (sonidoGalopar.played()){
				sonidoGalopar.resume()
			}
			else{
				sonidoGalopar.shouldLoop(true)
				sonidoGalopar.play()
			}
			self.tomaVelocidad()
			jugadorInvisible.aparecerEn(48,flecha.position().y()-1)
			jugadorInvisible.decirConstantemente(flecha.seleccion().toString() + "Km/h")
			hayOnTick = 1
		}	
	}

	override method teclaEnter() {
		if (jugador.hayColision()) {
			hayOnTick = 0
			//game.say(flecha, flecha.seleccion().toString() + "Km/h")
			game.removeVisual(jugadorInvisible)
			game.removeVisual(self)
			game.removeVisual(flecha)
			jugadorInvisible.callar()
			game.removeVisual(mensajeEnter)
			game.removeVisual(colision)
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
		sonidoGalopar.pause()
		
		game.sound("fight.wav").play()
		colision.setearVisual()
		game.removeTickEvent("avanzaJugador")
		game.removeTickEvent("avanzaRival")
		game.removeVisual(rival)
		game.removeVisual(jugador)
		mensajeEnter.position(new Position(x = 15, y =1))
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
