import wollok.game.*

object velocidad {

	method setearVisual(lvlDificultad) {
		game.addVisual(new Pantalla(image = "escVel01b.jpg",position= game.at(0, 0) ))
		game.addVisual(puntero)
		game.onTick(lvlDificultad * 100, "mueveFlecha", { puntero.moverse()})
	}

}

//naye:las pantalals se podrian implementar como clases,y que vamos a usar varias
//y todas tendrian lo mismo, nombre del archivo y posicion
//no se me ocurren muchos lugares donde implementar clases...
class Pantalla {

	var property image

	var property position 

}

object puntero {

	var property position = new Position(x = 49, y = 7)

	method image() = "flecha.png"

	method moverse( ) {
		if (not (self.position().y() == 22)) {
			self.position(self.position().up(1))
		} else {
			self.position(self.position().down(15))
		}
	}
	
	method seleccion(){
		
	}

}

