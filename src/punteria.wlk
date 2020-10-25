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
		self.enfrentados(caballerosRivales.dificultad())
	}
  
  override method teclaEnter(){
			caballerosRivales.siguienteEtapa(resultado)
      // En resultado hacer: resultado.setearVisual() lo que haga en resultado.muestraResultado()
	}

	// max superior derecho -> fila:43 | columna:30
	// max superior izq -> fila:13 | columna:30
	// max inf izq -> fila:13 | columna:0
	// max inf der -> fila:43 | columna:0
//	override method teclaArriba() {
//		mira.moverse(mira.position().up(1))
//		if (mira.position().y() < 28) {
//			mira.moverse(mira.position().up(1))
//		}
//	}
//
//	override method teclaAbajo() {
//		if (mira.position().y() > 9) {
//			mira.moverse(mira.position().down(1))
//		}
//	}
//
//	override method teclaIzquierda() {
//		if (mira.position().x() > 14) {
//			mira.moverse(mira.position().left(1))
//		}
//	}
//
//	override method teclaDerecha() {
//		if (mira.position().x() < 34) {
//			mira.moverse(mira.position().right(1))
//		}
//	}

	method enfrentados(dificultad) {
		diana.agregarPosiciones(dificultad.nivel())
		game.onTick(dificultad.velocidadSegunNivel() * 500, "mueveDiana", { diana.moverse(diana.posiciones().anyOne()) })
	}

}

object rivalFrente inherits Caballero(image = "caballero_rojo_frente.png", position = game.at(20, 9)) {

	override method moverse() {
	}

}

object diana inherits Puntero(image = "diana.png", position = game.at(29, 17)) {

	var property posiciones = []

	method agregarPosiciones(nivel) {
		(nivel*2).times({ i => self.posiciones().add(new Position(x = self.nuevaPosicionX(), y = self.nuevaPosicionY()))})
//		(1..nivel).forEach({ i => self.posiciones().add(new Position(x = self.nuevaPosicionX(), y = self.nuevaPosicionY())) })
	}

	method nuevaPosicionX() {
		return 24.randomUpTo(32).truncate(0)
	}

	method nuevaPosicionY() {
		return 14.randomUpTo(30).truncate(0)
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

