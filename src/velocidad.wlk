import wollok.game.*

object velocidad {
	
	method setearVisual(){
		
		game.addVisual(primerPantalla)
	}
	
	
}

object primerPantalla{

	method image() = "escVel01b.jpg"
	method position() = game.at(0, 0)
}


