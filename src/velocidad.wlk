import wollok.game.*
import clasesComunes.*
import caballerosRivales.*
import personajes.*

object velocidad {
	var hayOnTick = 0
	
	method teclaNum(nivel){
		
	}
	method setearVisual(lvlDificultad) {
		game.addVisual(new Visual(image = "background_1.png", position = game.at(0, 0)))
		game.addVisual(jugador)
		game.addVisual(rival)
		//game.addVisual(sombra)
		flecha.setearVisual(lvlDificultad)
	}

	method tomaVelocidad() {
	
			game.onTick(100, "avanzaRival", { rival.moverse()})
			game.onTick(100, "avanzaJugador", { jugador.moverse()})
			return (flecha.seleccion())

	}

	method colisionCaballeros(unaPosicion) { 
									
		game.addVisual(new Visual(image = "caballeros2.png", position = unaPosicion))
		game.removeTickEvent("avanzaJugador")
		game.removeTickEvent("avanzaRival")
		
		game.removeVisual(rival)
		game.removeVisual(jugador)
		game.addVisual(new Visual(image = "mensajePrueba.png", position = new Position(x = 15, y =0)))
	}
	
	method teclaEspaciadora(){
		if(hayOnTick == 0){
			jugador.vel(self.tomaVelocidad())
		
			hayOnTick = 1
		}	
	}
	
	method teclaEnter(){
		if(jugador.hayColision()){
			caballerosRivales.seleccionPunteria()
		}
		
	}


}



object flecha inherits Puntero(position = new Position(x = 49, y = 7), image = "flecha_velocidad.png") {

	override method moverse(posicion ) {
		if (not (self.position().y() == 22)) {
			self.position(self.position().up(1))
		} else {
			self.position(self.position().down(15))
		}
	}

	override method setearVisual(lvlDificultad) {
		game.addVisual(self)
		game.onTick(lvlDificultad * 100, "mueveFlecha", { self.moverse(0)})
	}

	override method seleccion() {
		game.removeTickEvent("mueveFlecha")
		
		if (self.position().y() >= 7 && self.position().y() < 17) {
			return 100
		} else if (self.position().y() >= 17 && self.position().y() < 22) {
			return 200
		} else {
			return 400
		}
	}

}


