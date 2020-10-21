import wollok.game.*
import velocidad.*
import punteria.*
import movimiento.*
import clasesComunes.*

object caballerosRivales {
	var property etapa = 1
	var property punteriaAdquirida = 0
	var property velocidadAdquirida
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
		
		keyboard.num1().onPressDo{ self.comienzo(nivelUno) }
		keyboard.num1().onPressDo{ etapa.apretaronLaTecla1(nivelUno) }
		keyboard.num2().onPressDo{ self.comienzo(nivelDos) }
		keyboard.num3().onPressDo{ self.comienzo(nivelTres) }
		keyboard.space().onPressDo{ self.seleccionVelocidad() }
		keyboard.enter().onPressDo{ self.seleccionPunteria() }
		keyboard.up().onPressDo{ up.ir()}
		keyboard.down().onPressDo{ down.ir()}
		keyboard.left().onPressDo{ left.ir()}
		keyboard.right().onPressDo{ right.ir()}
	}
	method comienzo(lvlDificultad){
		
		if (self.etapa()==1) {
		dificultad = lvlDificultad
		velocidad.setearVisual(lvlDificultad.velocidadSegunNivel())
		self.etapa(2)
		}
	}
	method seleccionVelocidad(){
		if (self.etapa()==2) {
		velocidadAdquirida = velocidad.tomaVelocidad()
		self.etapa(3)
		}				
	}
	method seleccionPunteria(){

		if (self.etapa()==3 and jugador.hayColision()) {
			//game.clear()
			punteria.enfrentados(dificultad)
		}

	}
	
	//velocidad.setearVisual(lvlDificultad.velocidadSegunNivel())
	//method apretaronLaTecla1(nivel) { }
	
	
}

object nivelUno inherits Dificultad(nivel = 1){
	
	override method velocidadSegunNivel(){
		return self.nivel()
	}

	
}

object nivelDos inherits Dificultad(nivel = 2){
	
	override method velocidadSegunNivel(){
		return self.nivel() * 0.25
	}
}

object nivelTres inherits Dificultad(nivel = 3){
	
	override method velocidadSegunNivel(){
		return self.nivel() * 0.1
	}
}