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
	
	var ganeVelocidad 
	var ganePunteria 
	var gane 
	
	method setearValores(){
		 nivel = caballerosRivales.dificultad()
		 velocidadAdquirida = caballerosRivales.velocidadAdquirida()
		 punteriaAdquirida = caballerosRivales.punteriaAdquirida()
		 ganeVelocidad = self.calcularVelocidad()
		 ganePunteria = self.calcularPunteria()
		 gane = false
	}
	
	method setearVisual() {
		
		if (nivel == 1 or nivel == 2){
			gane = ganeVelocidad or ganePunteria
		}
		else{
			gane = ganeVelocidad and ganePunteria
		}
		
		if (gane) {
			game.addVisual(new Visual(image = "victoria.png", position = game.at(0, 0)))
		}
		else{
			game.addVisual(new Visual(image = "derrota.png", position = game.at(0, 0)))
		}

	}
	
	method calcularVelocidad() = velocidadAdquirida > velocidadEnemiga
	method calcularPunteria() = punteriaAdquirida > punteriaEnemiga
	
}