import wollok.game.*
import clasesComunes.*
import caballerosRivales.*

object punteria inherits Visual(image = "background_2.png", position = game.at(0, 0)) {

	method enfrentados(lvlDificultad) {
		game.addVisual(self)
		game.addVisual(rivalFrente)
		puntero.setearVisual(lvlDificultad)
		game.addVisualCharacter(lanza)
		game.addVisualCharacter(mira)
		
	}

}

object rivalFrente inherits Caballero(image = "caballero_rojo_frente.png", position = game.at(20, 9)) {

	// const movimientos 
	override method moverse() {
	}

	override method movimiento() {
	}

}

object puntero inherits Puntero(image = "diana1.png", position = game.at(5, 15)) {

	override method seleccion() {
	}

	override method setearVisual(lvlDificultad) {
		game.addVisual(self)
	}

	override method moverse(posicion) {
	}

}

object mira inherits Puntero(image = "punteria.png", position = game.at(4, 10)) {

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
		self.position(posicion)
	}

	override method seleccion() {
	}

}

