import wollok.game.*
import clasesComunes.*
import caballerosRivales.*
import movimiento.*

object punteria inherits Visual(image = "background_2.png", position = game.at(0, 0)) {

	method enfrentados(dificultad) {
		game.addVisual(self)
		game.addVisual(rivalFrente)
		puntero.setearVisual(dificultad)
		mira.setearVisual(dificultad)
		lanza.setearVisual(dificultad)
		game.onTick(dificultad.velocidadSegunNivel()*500 , "blanco", {puntero.moverse(puntero.position() )})
		//game.addVisualCharacter(prueba)
		
	}

}

object rivalFrente inherits Caballero(image = "caballero_rojo_frente.png", position = game.at(20, 9)) {


	override method moverse() {
	}

	override method movimiento() {
	}

}

object puntero inherits Puntero(image = "diana1.png", position = game.at(29, 17)) {
	//esto de las posiciones se puede modelar en un objeto
	
	 var indice = 0
	 
	override method seleccion() {
	}

	override method setearVisual(lvlDificultad) {
		game.addVisual(self)
	}

	override method moverse(posicion) {
		
		if(indice == 3){
			self.position(game.at(29, 17))
			indice = 0
		}else{
			self.position(posiciones.darPosicionRelativa(posicion))
			indice++
		}
	}

}

object mira inherits Puntero(image = "punteria.png", position = game.at(29, 18)) {

	override method setearVisual(lvlDificultad) {
		game.addVisual(self)
	}

	override method moverse(posicion) {
		
		self.position(posicion)
		
	}

	override method seleccion() {
	}

}



object lanza inherits Puntero(image = "lanza.png", position = mira.position().down(9).right(1)) {

	override method setearVisual(lvlDificultad) {
		game.addVisual(self)
	}

	override method moverse(posicion) {
		self.position(mira.position().down(9).right(1))
	}

	override method seleccion() {}

}

object posiciones {
	//[izq/ izq-arriba /arriba/arriba-der 
	// der/der-abajo /abajo/abajo-izq]
	
	//var posic = [new Position(x=-1,y=0),new Position(x=-1,y=1),new Position(x=0,y=1),new Position(x=1,y=1)
	//	,new Position(x=1,y=0),new Position(x=1,y=-1),new Position(x=0,y=-1),new Position(x=-1,y=-1)]
	
	var posic = [new Position(x=-3,y=0),new Position(x=0,y=3),new Position(x=3,y=0),new Position(x=0,y=-3)]
	var indice = 0
	
	method darPosicionRelativa(posicion){
		if(indice<3){
			indice++
		}else{
			indice = 0
			
		}
		return new Position(x= posicion.x()+posic.get(indice).x(),y = posicion.y()+posic.get(indice).y())
		
	}
}
object prueba inherits Visual(image = "prueba.png", position = game.at(0,0)){
	
}
