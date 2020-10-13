import wollok.game.*
import clasesComunes.*
import caballerosRivales.*

object punteria {
//	comentario
	var property image = "background_2.png"
	const property position = game.at(0, 0)

	method enfrentados() {
		game.addVisual(self)
		game.addVisual(rival)
		game.addVisual(blanco)
		game.addVisualCharacter(cursor)
	/*game.whenCollideDo(cursor,{unaExtremidad=>cursor.una_actividad(})
	 *   .Cuando el cursor colsione con una extremidad del rival, le decimos al cursor
	 que haga algo.*/
	}

}

object cursor {

	const property image = "lanza.png"
	var property position = game.at(30, 5)

}

object rival {

	const property image = "caballero_rojo_frente.png"
	var property position = game.at(20, 9)

}

object blanco {

	var property image
//	Vpy a implementar que el blanco se coloque en una posicion random sobre el rival 
	var property position = rival.position().right(2).up(3)

	method image() {
		if (caballerosRivales.dificultad() == 1) {
			return "blanco_nivel_1.png"
		} else if (caballerosRivales.dificultad() == 0.5) {
			return "blanco_nivel_2.png"
		} else {
			return "blanco_nivel_3.png"
		}
	}

}

