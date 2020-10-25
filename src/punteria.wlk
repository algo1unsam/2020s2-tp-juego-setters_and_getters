import wollok.game.*
import clasesComunes.*
import caballerosRivales.*
import movimiento.*

object punteria inherits Etapa(image = "background_2.png", position = game.at(0, 0)) {

	override method setearVisual() {
		game.addVisual(self)
		rivalFrente.setearVisual()
		diana.setearVisual()
		mira.setearVisual()
		lanza.setearVisual()
		self.enfrentados(caballerosRivales.dificultad().nivel())
	}

	// max superior derecho -> fila:43 | columna:30
	// max superior izq -> fila:13 | columna:30
	// max inf izq -> fila:13 | columna:0
	// max inf der -> fila:43 | columna:0
	override method teclaArriba() {
		mira.moverse(mira.position().up(1))
		if (mira.position().y() < 28) {
			mira.moverse(mira.position().up(1))
		}
	}

	override method teclaAbajo() {
		if (mira.position().y() > 9) {
			mira.moverse(mira.position().down(1))
		}
	}

	override method teclaIzquierda() {
		if (mira.position().x() > 14) {
			mira.moverse(mira.position().left(1))
		}
	}

	override method teclaDerecha() {
		if (mira.position().x() < 34) {
			mira.moverse(mira.position().right(1))
		}
	}

	method enfrentados(nivel) {
		diana.agregarPosiciones(nivel)
		game.onTick(nivel * 1000, "mueveDiana", { diana.posiciones().forEach({ posicion => diana.moverse(posicion)})})
	}
}

object rivalFrente inherits Caballero(image = "caballero_rojo_frente.png", position = game.at(20, 9)) {

	override method moverse() {
	}

}

object diana inherits Puntero(image = "diana.png", position = game.at(29, 17)) {

	var property posiciones = [self.position()]

	method agregarPosiciones(nivel) {
		nivel.times({ i => self.posiciones().add(new Position(x = self.nuevaPosicionX(), y = self.nuevaPosicionY()))})
	}

	method nuevaPosicionX() {
		return 28.randomUpTo(34)
	}

	method nuevaPosicionY() {
		return 16.randomUpTo(22)
	}

	override method seleccion() {
	}

}

object mira inherits Puntero(image = "mira.png", position = game.at(29, 18)) {

	override method moverse(posicion) {
		self.moverse(posicion)
		lanza.moverse(posicion)
	}

	override method seleccion() {
	}

}

// Tengo dudas si arreglarlo asi esta bien?
object lanza inherits Puntero(image = "lanza.png", position = mira.position().down(9).right(1)) {

	override method seleccion() {
	}

}

