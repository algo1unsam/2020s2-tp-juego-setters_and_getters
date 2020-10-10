import wollok.game.*
import clasesComunes.*

object punteria {

	var property image = "punteria.jpg"
	var property position = game.at(0, 0)

	method enfrentados() {
		game.addVisual(self)
		game.addVisualCharacter(cursor)
	/*game.whenCollideDo(cursor,{unaExtremidad=>cursor.una_actividad(})
	  .Cuando el cursor colsione con una extremidad del rival, le decimos al cursor
	   que haga algo.*/
	} 

}

object cursor {

	const property image = "personaje.png"
	var property position = game.at(20, 15)

	
}

