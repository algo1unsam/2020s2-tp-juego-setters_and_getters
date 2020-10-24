import wollok.game.*
import clasesComunes.*
import caballerosRivales.*
import niveles.*

object resultado  {
	
	var nivel 
	const velocidadEnemiga = caballerosRivales.dificultad().velocidadEnemiga()
	const punteriaEnemiga = caballerosRivales.dificultad().punteriaEnemiga()
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
		 velocidadAdquirida = caballerosRivales.velocidadAdquirida()
		 punteriaAdquirida = caballerosRivales.punteriaAdquirida()
		 resulVelocidad = self.calcularVelocidad()
		 resulPunteria = self.calcularPunteria()

	}
	method setearVisual() {
		if (nivel.consultaVictoria(resulVelocidad, resulPunteria)) {
			game.addVisual(new Visual(image = "victoria.png", position = game.at(0, 0)))
		}
		else{
			game.addVisual(new Visual(image = "derrota.png", position = game.at(0, 0)))
		}

	}
	
	method calcularVelocidad() = velocidadAdquirida > velocidadEnemiga
	method calcularPunteria() = punteriaAdquirida > punteriaEnemiga
	
}