import wollok.game.*
import clasesComunes.*
import caballerosRivales.*
import niveles.*
import personajes.*

object resultado inherits Etapa(image = "background_1.png", position = game.at(0, 0)){


	override method setearVisual() {
		game.addVisual(self)
		jugador.position(game.at(20, 7))
		game.addVisualCharacter(jugador)
		rival.position(game.at(4, 7))
		game.addVisualCharacter(rival)
		jugador.decirConstantemente()
		rival.decirConstantemente()
		if (caballerosRivales.dificultad().consultaVictoria(self.ganoEnVelocidad(), self.ganoEnPunteria())) {
//			Luego cambiar imagenes a Win y Lose
			game.addVisual(new Visual(image = "mira.png", position = game.at(15, 7)))
		} else {
			game.addVisual(new Visual(image = "diana.png", position = game.at(15, 7)))
		}
	}

	method ganoEnVelocidad() = jugador.velocidadAdquirida() > rival.velocidadAdquirida()

	method ganoEnPunteria() = jugador.punteriaAdquirida() > rival.punteriaAdquirida()

}

