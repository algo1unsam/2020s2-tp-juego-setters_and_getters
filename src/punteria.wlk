import wollok.game.*
import clasesComunes.*
import caballerosRivales.*
import resultado.*
import personajes.*

object punteria inherits Etapa(image = "background_2.png", position = game.at(0, 0)) {

	const sonidoReloj = game.sound("reloj.wav")
	var finPantalla = 0

	override method setearVisual() {
		game.addVisual(self)
		rivalFrente.setearVisual()
		diana.setearVisual()
		mira.setearVisual()
		lanza.setearVisual()
		tiempo.setearVisual()
		game.onTick(3000, "corre tiempo", { tiempo.moverse(game.at(0, 0))})
		self.enfrentados(caballerosRivales.dificultad())
		sonidoReloj.shouldLoop(true) // Hago que se repita
		sonidoReloj.play()
	}

	override method teclaEnter() {
		if (finPantalla == 1) {
			if (tiempo.darTiempo() != 1) { // Esta desfazado 1 segundo
				jugadorInvisible.callar()
				game.removeVisual(jugadorInvisible)
			}
			caballerosRivales.siguienteEtapa(resultado)
		}
	}

	// max superior derecho -> fila:43 | columna:30
	// max superior izq -> fila:13 | columna:30
	// max inf izq -> fila:13 | columna:0
	// max inf der -> fila:43 | columna:0
	override method teclaArriba() {
		if (finPantalla == 0) {
			if (mira.position().y() < 28) {
				game.sound("tecla.wav").play()
				mira.moverse(mira.position().up(1))
				lanza.moverse(lanza.position().up(1))
			} else {
				game.sound("mov_invalido.wav").play()
			}
		}
	}

	override method teclaAbajo() {
		if (finPantalla == 0) {
			if (mira.position().y() > 9) {
				game.sound("tecla.wav").play()
				mira.moverse(mira.position().down(1))
				lanza.moverse(lanza.position().down(1))
			} else {
				game.sound("mov_invalido.wav").play()
			}
		}
	}

	override method teclaIzquierda() {
		if (finPantalla == 0) {
			if (mira.position().x() > 14) {
				game.sound("tecla.wav").play()
				mira.moverse(mira.position().left(1))
				lanza.moverse(lanza.position().left(1))
			} else {
				game.sound("mov_invalido.wav").play()
			}
		}
	}

	override method teclaDerecha() {
		if (finPantalla == 0) {
			if (mira.position().x() < 34) {
				game.sound("tecla.wav").play()
				mira.moverse(mira.position().right(1))
				lanza.moverse(lanza.position().right(1))
			} else {
				game.sound("mov_invalido.wav").play()
			}
		}
	}

	method enfrentados(dificultad) {
		game.onTick(dificultad.velocidadSegunNivel() * 1000, "mueveDiana", { diana.moverse(new Position(x = diana.nuevaPosicionX(), y = diana.nuevaPosicionY()))})
	}

	// se acabo el tiempo o la mira choco con la punteria, se llama a este metodo
	// si tiempo es 0 , quiere decir que no alcanzo la mira a tiempo, no debe recibir ningun punto
	method capturarPunteria(time) {
		finPantalla = 1
		tiempo.terminoTiempo() // remuevo el ontick
		sonidoReloj.stop()
		if (time == 0) {
			game.sound("gong.wav").play()
		} else {
			game.sound("golpe.wav").play()
		}
		game.removeTickEvent("mueveDiana")
		caballerosRivales.dificultad().adjudicaPunteria(time)
		game.addVisual(new Visual(image = "mensajeEnter.png", position = new Position(x = 13, y = 10)))
	}

}

object rivalFrente inherits Caballero(image = "caballero_rojo_frente.png", position = game.at(20, 9)) {

	override method moverse() {
	}

	override method movimiento() {
	}

}

object diana inherits Puntero(image = "diana.png", position = game.at(29, 17)) {

	var property posiciones = []

	method agregarPosiciones(nivel) {
		(nivel * 5).times({ i => self.posiciones().add(new Position(x = self.nuevaPosicionX(), y = self.nuevaPosicionY()))})
	}

	method nuevaPosicionX() {
		return 26.randomUpTo(30).truncate(0)
	}

	method nuevaPosicionY() {
		return 16.randomUpTo(26).truncate(0)
	}

	override method seleccion() {
	}

}

object mira inherits Puntero(image = "mira.png", position = game.at(29, 18)) {

	override method moverse(posicion) {
		self.position(posicion)
		self.seleccion()
	}

	override method seleccion() {
		if (self.position() == diana.position()) {
			// hay colision con la mira, llamamos a la punteria y le pasamos el tiempo
			// para determinar la cantidad de puntos que obtiene
			jugadorInvisible.aparecerEn(30, 20)
			jugadorInvisible.decirConstantemente("Me pegaste " + (tiempo.darTiempo() * 100).toString() + "!")
			diana.image("dianaApuntada.png")
			diana.position(diana.position().down(1))
			diana.position(diana.position().left(2))
			punteria.capturarPunteria(tiempo.darTiempo())
		}
	}

}

object lanza inherits Puntero(image = "lanza.png", position = mira.position().down(9).right(1)) {

	override method seleccion() {
	}

}

object tiempo inherits Puntero(image = "tiempo_5.png", position = game.at(43, 20)) {

	var tiempo = 5

	override method seleccion() {
	}

	override method moverse(posicion) {
		if (tiempo > 1) {
			tiempo -= 1
			self.image("tiempo_" + tiempo.toString() + ".png")
		} else {
			self.image("tiempo_0.png")
			punteria.capturarPunteria(0) // Se le terminó el tiempo al usuario y le doy puntaje 0
		}
	}

	method terminoTiempo() {
		game.removeTickEvent("corre tiempo")
	}

	method darTiempo() = tiempo

}

