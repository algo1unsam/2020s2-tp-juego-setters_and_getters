import wollok.game.*
import personajes.*
import resultado.*

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
	var property vel = 0
	var property punteria = 0
	
	method moverse() 
	method movimiento()
	method decimePuntaje(){
		game.say(self, "Velocidad= " + vel.toString() + " Punteria= " + punteria.toString())
	}
	method decirConstantemente(){
		game.onTick(100, "decirConstante", { => self.decimePuntaje() })
	}
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

	method seteaRival(){
		rival.vel(self.velocidadSegunNivel())
		rival.punteria(self.punteriaEnemiga())
	}
}

