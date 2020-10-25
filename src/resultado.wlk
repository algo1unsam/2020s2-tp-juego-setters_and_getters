import wollok.game.*
import clasesComunes.*
import caballerosRivales.*
import niveles.*
import personajes.*

object resultado  {
	
	var nivel 
	const velocidadEnemiga = rival.vel()
	const punteriaEnemiga = rival.punteria()
	var velocidadAdquirida
	var punteriaAdquirida 
	
	var resulVelocidad 
	var resulPunteria 
	
	method muestraResultado(){
		self.setearValores()
		self.setearVisual()
	}
	
	method setearValores(){
		 nivel = caballerosRivales.dificultad()
		 velocidadAdquirida = jugador.vel()
		 punteriaAdquirida = jugador.punteria()
		 resulVelocidad = self.calcularVelocidad()
		 resulPunteria = self.calcularPunteria()

	}
	method setearVisual() {
		game.addVisual(new Visual(image = "background_1.png", position = game.at(0, 0)))
		jugador.position(game.at(20, 7))
		game.addVisualCharacter(jugador)
		rival.position(game.at(4, 7))
		game.addVisualCharacter(rival)
		jugador.decirConstantemente()
		rival.decirConstantemente()
		if (nivel.consultaVictoria(resulVelocidad, resulPunteria)) {
			game.addVisual(new Visual(image = "punteria.png", position = game.at(15, 7)))
		}
		else{
			game.addVisual(new Visual(image = "diana1.png", position = game.at(15, 7)))
		}

	}
	
	method calcularVelocidad() = velocidadAdquirida > velocidadEnemiga
	method calcularPunteria() = punteriaAdquirida > punteriaEnemiga
	
	method teclaNum(nivelpapa){}
	
	method teclaEspaciadora(){}
	
	method teclaEnter(){}
	
}