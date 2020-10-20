import wollok.game.*
import clasesComunes.*
import caballerosRivales.*
import movimiento.*

object punteria inherits Visual(image = "background_2.png", position = game.at(0, 0)) {

	method enfrentados(lvlDificultad) {
		game.addVisual(self)
		game.addVisual(rivalFrente)
		puntero.setearVisual(lvlDificultad)
		mira.setearVisual(lvlDificultad)
		lanza.setearVisual(lvlDificultad)
		//game.addVisualCharacter(prueba)
		
	}

}

object rivalFrente inherits Caballero(image = "caballero_rojo_frente.png", position = game.at(20, 9)) {


	override method moverse() {
	}

	override method movimiento() {
	}

}

object puntero inherits Puntero(image = "diana1.png", position = game.at(5, 15)) {
	 var posiciones = []
	override method seleccion() {
	}

	override method setearVisual(lvlDificultad) {
		game.addVisual(self)
	}

	override method moverse(posicion) {
	}

}

object mira inherits Puntero(image = "punteria.png", position = game.at(29, 18)) {

	override method setearVisual(lvlDificultad) {
		game.addVisual(self)
	}

	override method moverse(posicion) {
		
		self.position(posicion)
		
	}

	override method seleccion() {
	}

}



object lanza inherits Puntero(image = "lanza.png", position = mira.position().down(9).right(1)) {

	override method setearVisual(lvlDificultad) {
		game.addVisual(self)
	}

	override method moverse(posicion) {
		self.position(mira.position().down(9).right(1))
	}

	override method seleccion() {}

}

object prueba inherits Visual(image = "prueba.png", position = game.at(0,0)){
	
}
