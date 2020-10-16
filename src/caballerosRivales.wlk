import wollok.game.*
import velocidad.*
import punteria.*
import movimiento.*

object caballerosRivales {
	var punteriaAdquirida
	var velocidadAdquirida
	var property dificultad //obs: guardamos la dificultad porque se utiliza luego
					//en la segunda pantalla cuando hay que apuntar
					//pero como esta implementado no se guarda 1 , 2 o 3
					//sino que se guarda 1,0.5,0.3

	method seteoTablero(){
		game.title("Caballeros Rivales")
		game.height(30)
		game.width(55)
		game.cellSize(20)
		game.boardGround("titulo0.jpg")
	}
	method seteoTeclas(){
		//Importante: consultar a los profesores si se puede quitar comportamiento a las teclas
		//despues de cierto tiempo porque pueden dar error pro ejemplo
		//si se quiere comenzar de nuevo cuando ya se esta jugando,o si se apreta velocidad
		//luego de haber comenzado el juego
		
		keyboard.num1().onPressDo{ self.comienzo(1) }
		keyboard.num2().onPressDo{ self.comienzo(2 * 0.25) }
		keyboard.num3().onPressDo{ self.comienzo(3 * 0.1) }
		keyboard.space().onPressDo{ self.seleccionVelocidad() }
		keyboard.enter().onPressDo{ self.seleccionPunteria() }
		keyboard.up().onPressDo{ up.ir()}
		keyboard.down().onPressDo{ down.ir()}
		keyboard.left().onPressDo{ left.ir()}
		keyboard.right().onPressDo{ right.ir()}
	}
	method comienzo(lvlDificultad){
			
		dificultad = lvlDificultad
		velocidad.setearVisual(lvlDificultad)
	}
	method seleccionVelocidad(){
		velocidadAdquirida = velocidad.tomaVelocidad()
		
	}
	method seleccionPunteria(){
		//game.clear()
		punteria.enfrentados(dificultad)
		
	}
	
	
	
}
