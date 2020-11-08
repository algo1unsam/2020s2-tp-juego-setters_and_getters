import wollok.game.*
import clasesComunes.*
import caballerosRivales.*
import niveles.*
import personajes.*

object resultado inherits Etapa(image = "FondoResultado.jpg", position = game.at(0, 0)){

	override method setearVisual() {
		game.addVisual(self)
		
		jugador.aparecerEn(38,9)
		rival.aparecerEn(6, 9)
		
		jugadorInvisible.aparecerEn(43,13)
		rivalInvisible.aparecerEn(9, 13)
		
		game.schedule(500, {jugadorInvisible.decirConstantemente(jugador.puntaje())})
		game.schedule(500, {rivalInvisible.decirConstantemente(rival.puntaje())})

		if (caballerosRivales.dificultad().consultaVictoria(self.ganoEnVelocidad(), self.ganoEnPunteria())) {		
			game.addVisual(new Visual(image = "victoria.png", position = game.at(17, 18)))
			game.sound("victoria.wav").play()
		} else {
			game.addVisual(new Visual(image = "derrota.png", position = game.at(17, 18)))
			game.sound("derrota.wav").play()
		}
	}

	method ganoEnVelocidad() = jugador.velocidadAdquirida() > rival.velocidadAdquirida()

	method ganoEnPunteria() = jugador.punteriaAdquirida() > rival.punteriaAdquirida()

}

