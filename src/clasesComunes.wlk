import wollok.game.*
import personajes.*
import resultado.*
import punteria.*

class Visual {

	var property image
	var property position

	method setearVisual() {
		game.addVisual(self)
	}
	
	method aparecerEn(x,y){
		self.position(game.at(x, y))
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
	var property velocidadAdquirida = 0
	var property punteriaAdquirida = 0

	method moverse() 
	method movimiento()
	
	method decimePuntaje(){
		game.say(self, self.puntaje() )
	}
	
	method puntaje(){
		return velocidadAdquirida.toString() + "Km/h " + punteriaAdquirida.toString()+ "Pts"
	}
	method decirConstantemente(mensaje){
		game.onTick(100, "decirConstante", { => game.say(self, mensaje ) } )
	}
	
	method callar(){
		game.removeTickEvent("decirConstante")
	}
	
	method decimeVelocidad(){
		game.say(self, velocidadAdquirida.toString() + "Km/h")
	}
	
	method decimePunteria(){
		game.say(self, punteriaAdquirida.toString()+ "Pts")
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
		rival.velocidadAdquirida(self.velocidadEnemiga())
		rival.punteriaAdquirida(self.punteriaEnemiga())
	}
	
	method consultaVictoria(resulVelocidad, resulPunteria) {
		return (resulVelocidad or resulPunteria) and (mira.huboMovimiento()==1)
	}
	
	
}

