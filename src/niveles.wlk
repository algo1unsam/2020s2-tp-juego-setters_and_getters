import clasesComunes.*
import wollok.game.*

object nivelUno inherits Dificultad(nivel = 1) {

	var gane

	override method velocidadSegunNivel() {
		return self.nivel()
	}

	method setearVisual(resulVelocidad, resulPunteria) {
		gane = resulVelocidad or resulPunteria
		
		///CAMBIAR EN IMAGE EL OBJETO AL QUE APUNTA (GANASTE O PERDISTE) Y PIDA SU IMAGEN
		if (gane) {
			game.addVisual(new Visual(image = "victoria.png", position = game.at(0, 0)))
		} else {
			game.addVisual(new Visual(image = "derrota.png", position = game.at(0, 0)))
		}
	}

}

object nivelDos inherits Dificultad(nivel = 2) {

	var gane

	override method velocidadSegunNivel() {
		return self.nivel() * 0.25
	}

	method setearVisual(resulVelocidad, resulPunteria) {
		gane = resulVelocidad or resulPunteria
		
		///CAMBIAR EN IMAGE EL OBJETO AL QUE APUNTA (GANASTE O PERDISTE) Y PIDA SU IMAGEN
		if (gane) {
			game.addVisual(new Visual(image = "victoria.png", position = game.at(0, 0)))
		} else {
			game.addVisual(new Visual(image = "derrota.png", position = game.at(0, 0)))
		}
	}

}

object nivelTres inherits Dificultad(nivel = 3) {

	var gane

	override method velocidadSegunNivel() {
		return self.nivel() * 0.1
	}

	method setearVisual(resulVelocidad, resulPunteria) {
		gane = resulVelocidad and resulPunteria
		
		///CAMBIAR EN IMAGE EL OBJETO AL QUE APUNTA (GANASTE O PERDISTE) Y PIDA SU IMAGEN
		if (gane) {
			game.addVisual(new Visual(image = "victoria.png", position = game.at(0, 0)))
		} else {
			game.addVisual(new Visual(image = "derrota.png", position = game.at(0, 0)))
		}
	}

}

