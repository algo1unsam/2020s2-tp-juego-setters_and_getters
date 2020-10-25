import wollok.game.*
import clasesComunes.*
import caballerosRivales.*
import velocidad.*

object portada inherits Etapa(image = "background_0.jpg", position = game.at(0, 0)) {

	override method teclaNum(nivel) {
		// Seteo del nivel de dificultad
		caballerosRivales.dificultad(nivel)
		// Cambio a la etapa 'velocidad'
		caballerosRivales.siguienteEtapa(velocidad)
	}

}

