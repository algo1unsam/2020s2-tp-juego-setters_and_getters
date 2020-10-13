import wollok.game.*
import velocidad.*
import punteria.*

object caballerosRivales {
	var punteriaAdquirida
	var velocidadAdquirida
	var property dificultad //obs: guardamos la dificultad porque se utiliza luego
					//en la segunda pantalla cuando hay que apuntar
					//pero como esta implementado no se guarda 1 , 2 o 3
					//sino que se guarda 1,0.5,0.3
	
	method comienzo(lvlDificultad){
		
		dificultad = lvlDificultad
		velocidad.setearVisual(lvlDificultad)
	}
	method seleccionVelocidad(){
		velocidadAdquirida = velocidad.tomaVelocidad()
		
	}
	method mecanicaPunteria(){
		game.clear()
		punteria.enfrentados()
		
		
	}
	
	
	
}
