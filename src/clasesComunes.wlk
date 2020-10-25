import wollok.game.*
import velocidad.*

class Visual {

	var property image
	var property position

	method setearVisual() {
		game.addVisual(self)
	}

}

class Etapa inherits Visual {

	method teclaNum(nivel){}

	method teclaEspaciadora(){}

	method teclaEnter(){}
	
	method teclaArriba(){}
	
	method teclaAbajo(){}
	
	method teclaIzquierda(){}
	
	method teclaDerecha(){}

}

class Caballero inherits Visual {

	method moverse(){}
}

class Puntero inherits Visual {

	method seleccion()

	method moverse(posicion) {
		self.position(posicion)
	}

}

class Dificultad {

	var nivel

	method nivel() = nivel

	method velocidadSegunNivel()

	method velocidadEnemiga() {
		return nivel * 100
	}

	method punteriaEnemiga() {
		return nivel * 100
	}

}

