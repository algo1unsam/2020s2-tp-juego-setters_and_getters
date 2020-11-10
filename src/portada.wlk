import wollok.game.*
import clasesComunes.*
import caballerosRivales.*
import velocidad.*

object portada inherits Etapa(image = "portada.png", position = game.at(0, 0)) {

	override method teclaNum(nivel) {
		// Seteo del nivel de dificultad y al rival
		caballerosRivales.dificultad(nivel)
		caballerosRivales.dificultad().seteaRival()
			// Cambio a la etapa 'velocidad'
		caballerosRivales.siguienteEtapa(velocidad)
	}

}