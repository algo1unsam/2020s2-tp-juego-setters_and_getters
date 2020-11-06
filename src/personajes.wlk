import wollok.game.*
import velocidad.*
import punteria.*

import clasesComunes.*
import portada.*
import niveles.*

object jugador inherits Caballero(image = "caballero_azul.png", position = game.at(30, 7)) {

	override method moverse() {
		if (self.hayColision()) {
			velocidad.colisionCaballeros(self.position())
		} else {
			self.position(self.movimiento())
		}
	}

	override method movimiento() {
		return self.position().left(1)
	}

	
	method hayColision() {
		return self.position().x() == 17
	}

}

object rival inherits Caballero(image = "caballero_rojo.png", position = game.at(0, 2)) {

	override method movimiento() {
		return self.position().right(1)
	}

	override method moverse() {
		self.position(self.movimiento())
	}

}

