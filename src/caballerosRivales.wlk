import wollok.game.*
import clasesComunes.*
import niveles.*
import portada.*
import velocidad.*
import punteria.*
import personajes.*
import resultado.*

object caballerosRivales {

//	El juego se divide en 4 etapas:
//	- portada
//	- velocidad
//	- punteria
//	- resultado
//	Estas se definieron como instancias de la clase 'Etapa',
//	teniendo metodos para el seteo de teclas y pantalla segun corresponda
//	Se inicializa el juego con la etapa 'portada'
	var property etapa = portada
//	En la etapa 'portada' se elige la dificultad del juego, este valor se guarda en var 'dificultad'
	var property dificultad
	const sonidoGeneral = game.sound("general.wav")

	method seteoTablero() {
		game.title("Caballeros Rivales")
		game.height(30)
		game.width(55)
		game.cellSize(20)
		etapa.setearVisual()
		sonidoGeneral.shouldLoop(true) // Hago que se repita
		game.schedule(100, { sonidoGeneral.play()})
	// En la etapa 'portada' se setea el nivel de dificultad del rival y se elije pasar a la etapa velocidad
	}

	method seteoTeclas() {
//		Seteo de las teclas depende del objeto al que apunte etapa
		keyboard.num1().onPressDo{ etapa.teclaNum(nivelUno)}
		keyboard.num2().onPressDo{ etapa.teclaNum(nivelDos)}
		keyboard.num3().onPressDo{ etapa.teclaNum(nivelTres)}
		keyboard.space().onPressDo{ etapa.teclaEspaciadora()}
		keyboard.enter().onPressDo{ etapa.teclaEnter()}
		keyboard.up().onPressDo{ etapa.teclaArriba()}
		keyboard.down().onPressDo{ etapa.teclaAbajo()}
		keyboard.left().onPressDo{ etapa.teclaIzquierda()}
		keyboard.right().onPressDo{ etapa.teclaDerecha()}
		keyboard.num0().onPressDo{ game.stop()}
	}

	method siguienteEtapa(nuevaEtapa) {
		game.sound("siguiente.wav").play()
		etapa = nuevaEtapa
		etapa.setearVisual()
	}

	method detenerSonidoGeneral() {
		sonidoGeneral.pause()
	}

	method resumeSonidoGeneral() {
		sonidoGeneral.resume()
	}

}
