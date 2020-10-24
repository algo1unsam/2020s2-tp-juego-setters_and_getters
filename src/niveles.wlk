import clasesComunes.*
import wollok.game.*

object nivelUno inherits Dificultad(nivel = 1) {

	override method velocidadSegunNivel() {
		return self.nivel()
	}

	method consultaVictoria(resulVelocidad, resulPunteria) {
		return resulVelocidad or resulPunteria

	}

}

object nivelDos inherits Dificultad(nivel = 2) {

	override method velocidadSegunNivel() {
		return self.nivel() * 0.25
	}

	method consultaVictoria(resulVelocidad, resulPunteria) {
		return  resulVelocidad or resulPunteria
		
		
	}

}

object nivelTres inherits Dificultad(nivel = 3) {

	var gane

	override method velocidadSegunNivel() {
		return self.nivel() * 0.1
	}

	method consultaVictoria(resulVelocidad, resulPunteria) {
		return resulVelocidad and resulPunteria
	}

}

