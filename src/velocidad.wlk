import wollok.game.*
import clasesComunes.*
import caballerosRivales.*

object velocidad {

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
		caballerosRivales.velocidadAdquirida(self.tomaVelocidad())
	}
	method teclaEnter(){
		if(jugador.hayColision()){
			caballerosRivales.seleccionPunteria()
		}
		
	}


}

object jugador inherits Caballero(image = "caballero_azul.png", position = game.at(30, 7)){
	
	override method moverse(){
		 if (self.hayColision() ) {
		 	
			velocidad.colisionCaballeros(self.position())
		} else {
			
			self.position(self.movimiento())}
	}
	
	override method movimiento(){
		return self.position().left(1)
	}
	
	method hayColision(){
		return  self.position().x()-1 == rival.position().x()
	}
}



object rival inherits Caballero(image = "caballero_rojo.png", position = game.at(0, 2)){
	
	override method movimiento(){
		
		return self.position().right(1)
	}
	override method moverse(){
			
			self.position(self.movimiento())
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
			//game.say(self, "mi velocidad es 100")
			return 100
		} else if (self.position().y() >= 17 && self.position().y() < 22) {
			//game.say(self, "mi velocidad es 200")
			return 200
		} else {
			//game.say(self, "mi velocidad es 400")
			return 400
		}
	}

}


