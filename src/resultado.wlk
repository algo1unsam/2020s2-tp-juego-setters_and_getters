import wollok.game.*
import clasesComunes.*
import caballerosRivales.*
import niveles.*

object resultado  {
	
	const nivel = caballerosRivales.dificultad().nivel()
	var velocidadEnemiga = caballerosRivales.dificultad().velocidadEnemiga()
	var punteriaEnemiga = caballerosRivales.dificultad().punteriaEnemiga()
	
	const velocidadAdquirida = caballerosRivales.velocidadAdquirida()
	const punteriaAdquirida = caballerosRivales.punteriaAdquirida()
	
	const ganeVelocidad = self.calcularVelocidad()
	const ganePunteria = self.calcularPunteria()
	var gane = false
	
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