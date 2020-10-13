import wollok.game.*
import clasesComunes.*

object punteria inherits Visual(image = "punteria.jpg",position = game.at(0, 0)) {

	method enfrentados() {
		game.addVisual(self)
		game.addVisualCharacter(rivalFrente)
	/*game.whenCollideDo(cursor,{unaExtremidad=>cursor.una_actividad(})
	  .Cuando el cursor colsione con una extremidad del rival, le decimos al cursor
	   que haga algo.*/
	} 

}

object rivalFrente inherits Visual(image = "cabPunteria1.png", position = game.at(20, 15)){
	
	
	
}



class puntero inherits Visual {

	//const property image = "cabPunteria1.png"
	//var property position = game.at(20, 15)

	
}

