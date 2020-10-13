import wollok.game.*
import velocidad.*
import punteria.*


object caballerosRivales {
	var punteriaAdquirida
	var velocidadAdquirida
	var dificultad //obs: guardamos la dificultad porque se utiliza luego
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
		keyboard.num1().onPressDo{ self.comienzo(1) }
		keyboard.num2().onPressDo{ self.comienzo(2 * 0.25) }
		keyboard.num3().onPressDo{ self.comienzo(3 * 0.1) }
		keyboard.space().onPressDo{ self.seleccionVelocidad() }
		keyboard.enter().onPressDo{ self.mecanicaPunteria() }
	}
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
