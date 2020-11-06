import wollok.game.*
import clasesComunes.*
import caballerosRivales.*
import niveles.*
import personajes.*

object resultado inherits Etapa(image = "background_1.png", position = game.at(0, 0)){


	override method setearVisual() {
		game.removeTickEvent("pantalla")
		game.addVisual(self)
		jugador.position(game.at(23, 7))
		game.addVisual(jugador)
		rival.position(game.at(6, 7))
		game.addVisual(rival)
		jugador.decirConstantemente()
		rival.decirConstantemente()
		if (caballerosRivales.dificultad().consultaVictoria(self.ganoEnVelocidad(), self.ganoEnPunteria())) {
//			
			game.addVisual(new Visual(image = "victoria.png", position = game.at(12, 18)))
		} else {
			game.addVisual(new Visual(image = "derrota.png", position = game.at(12, 18)))
		}
	}

	method ganoEnVelocidad() = jugador.velocidadAdquirida() > rival.velocidadAdquirida()

	method ganoEnPunteria() = jugador.punteriaAdquirida() > rival.punteriaAdquirida()

}

