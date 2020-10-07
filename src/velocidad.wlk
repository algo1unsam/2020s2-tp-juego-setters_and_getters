import wollok.game.*

object velocidad {

	var rival = new Caballero(image = "prueba_1.png", position = game.at(0, 7), esRival = true)
	var jugador = new Caballero(image = "prueba_2.png", position = game.at(35, 7), esRival = false)

	method setearVisual(lvlDificultad) {
		game.addVisual(new Pantalla(image = "escVel01b.jpg", position = game.at(0, 0)))
		game.addVisual(jugador)
		game.addVisual(rival)
		puntero.setearVisual(lvlDificultad)
	}

	method tomaVelocidad() {
		game.onTick(100, "avanzaRival", { rival.avanzar()})
		game.onTick(100, "avanzaJugador", { jugador.avanzar()})
		return (puntero.seleccion())
	}

	method comparoPosiciones() { // /La posicion en X de 'jugador' es la positiva, sino la resta me da (-)
		return (jugador.position().x() - rival.position().x())
	}

	method imageColision(unaPosicion) { // /Cuando se alcanza la distancia minima entre ellos, cambiamos la pantalla
		const pantallaColision = new Pantalla(image = "caballeros2.png", position = unaPosicion)
		game.addVisual(pantallaColision)
		game.removeVisual(rival)
		game.removeVisual(jugador)
	}

}

//naye:las pantalals se podrian implementar como clases,y que vamos a usar varias
//y todas tendrian lo mismo, nombre del archivo y posicion
//no se me ocurren muchos lugares donde implementar clases...
class Pantalla {

	var property image
	var property position

}

class Caballero {

	var property image
	var property position
	var esRival

	method avanzar() {
		if (velocidad.comparoPosiciones() < 1) {
			velocidad.imageColision(self.position())
		} else {
			if (esRival) {
				self.position(self.position().right(1))
			} else {
				self.position(self.position().left(1))
			}
		}
	}

}

object puntero {

	var property position = new Position(x = 49, y = 7)
	var property image = "flecha.png"

	method moverse( ) {
		if (not (self.position().y() == 22)) {
			self.position(self.position().up(1))
		} else {
			self.position(self.position().down(15))
		}
	}

	method setearVisual(lvlDificultad) {
		game.addVisual(self)
		game.onTick(lvlDificultad * 100, "mueveFlecha", { self.moverse()})
	}

	method seleccion() {
		game.removeTickEvent("mueveFlecha")
		if (self.position().y() >= 7 && self.position().y() < 17) {
			game.say(self, "mi velocidad es 100")
			return 100
		} else if (self.position().y() >= 17 && self.position().y() < 22) {
			game.say(self, "mi velocidad es 200")
			return 200
		} else {
			game.say(self, "mi velocidad es 300")
			return 400
		}
	}

}

