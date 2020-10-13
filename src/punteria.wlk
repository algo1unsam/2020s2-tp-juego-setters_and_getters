import wollok.game.*
import clasesComunes.*

object punteria inherits Visual(image = "punteria.jpg", position = game.at(0, 0)) {

	method enfrentados(lvlDificultad) {
		game.addVisual(self)
		game.addVisual(rivalFrente)
		puntero.setearVisual(lvlDificultad)
		game.addVisualCharacter(mira)
		
	}

}

object rivalFrente inherits Caballero(image = "cabPunteria1.png", position = game.at(20, 15)) {

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

	override method seleccion() {
	}

	override method setearVisual(lvlDificultad) {
		game.addVisual(self)
	}

	override method moverse(posicion) {
		self.position(posicion)
	
		
	}

	method miraUp() {
		/*if (self.position().y() < 55) {
			self.moverse(self.position().up(1))
		}*/
		game.say(self, "Voy pa arriba")
	}

	method miraDown() {
		/*if (self.position().y() > 0) {
			self.moverse(self.position().down(1))
		}*/
		game.say(self, "Voy pa bajo")
	}

}

