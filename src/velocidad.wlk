import wollok.game.*
import clasesComunes.*


object velocidad {

	var rival = new Caballero(image = "caballero_rojo.png", position = game.at(0, 2), esRival = true)
	var jugador = new Caballero(image = "caballero_azul.png", position = game.at(30, 7), esRival = false)
	var puntero = new Puntero(position = new Position(x = 49, y = 7), image = "flecha_velocidad.png")
	
	method setearVisual(lvlDificultad) {
		game.addVisual(new Visual(image = "background_1.png", position = game.at(0, 0)))
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

	method imageColision(unaPosicion) { // /Cuando se alcanza la distancia minima entre ellos, agregamos la imagen de los caballeros
										//chocando,en ese momento se agrega el mensaje para continuar a la siguiente pantalla
		
		game.addVisual(new Visual(image = "caballeros2.png", position = unaPosicion))
		game.removeTickEvent("avanzaRival")
		game.removeTickEvent("avanzaJugador")
		game.removeVisual(rival)
		game.removeVisual(jugador)
		game.addVisual(new Visual(image = "mensajePrueba.png", position = new Position(x = 15, y =0)))
	}
	

}



class Caballero inherits Visual{

	var esRival //clase rival podria heredar caballero y sobre escribir avanazar? (preg si vale la pena)

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

class Puntero inherits Visual {

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
			game.say(self, "mi velocidad es 400")
			return 400
		}
	}

}

