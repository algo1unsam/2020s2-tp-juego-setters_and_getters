import wollok.game.*
import clasesComunes.*

object punteria {

	var property  image = "punteria.jpg"
	var property position = game.at(0,0)

	
	method enfrentados(){
		game.addVisual(self)
	}
}
