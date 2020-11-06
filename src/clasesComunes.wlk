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
	var property velocidadAdquirida = 0
	var property punteriaAdquirida = 0
	
	method moverse() 
	method movimiento()
	method decimePuntaje(){
		game.say(self, "Velocidad= " + velocidadAdquirida.toString() + " Punteria= " + punteriaAdquirida.toString())
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
		rival.velocidadAdquirida(self.velocidadEnemiga())
		rival.punteriaAdquirida(self.punteriaEnemiga())
	}
	
	method consultaVictoria(resulVelocidad, resulPunteria) {
		return resulVelocidad or resulPunteria
	}
	
	 method adjudicaPunteria(time){
		
		if(time != 0){
			jugador.punteriaAdquirida(time*100) //al ser nivel 1 , gana todo el puntaje del enemigo
		}else{
			jugador.punteriaAdquirida(time ) //punteria 0
		}
		
	}
}

