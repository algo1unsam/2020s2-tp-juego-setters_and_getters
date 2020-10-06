import wollok.game.*

object velocidad {
	
	method setearVisual(lvlDificultad) {
		game.addVisual(new Pantalla(image = "escVel01b.jpg",position= game.at(0, 0) ))
		puntero.setearVisual(lvlDificultad)
		
	}
	method tomaVelocidad(){
		return (puntero.seleccion())
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

	var property  image = "flecha.png"

	method moverse( ) {
		if (not (self.position().y() == 22)) {
			self.position(self.position().up(1))
		} else {
			self.position(self.position().down(15))
		}
	}
	method setearVisual(lvlDificultad){
		game.addVisual(self)
		game.onTick(lvlDificultad * 100, "mueveFlecha", { self.moverse()})
	}
	
	method seleccion(){
		game.removeTickEvent( "mueveFlecha")
		
		if (self.position().y()>=7 && self.position().y()<17 ){
			game.say(self, "mi velocidad es 100")
			return 100
		}else if (self.position().y()>=17 && self.position().y()<22 ){
			game.say(self, "mi velocidad es 200")
			return 200
		}else{
			game.say(self, "mi velocidad es 300")
			return 400
		}
		
	}

}

