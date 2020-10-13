import velocidad.*
import wollok.game.*

class Visual {
	var property image
	var property position
}

class Caballero inherits Visual{
	
	method moverse() 
	method movimiento()

}


class Puntero inherits Visual{
	method seleccion()
	method setearVisual(lvlDificultad)
	method moverse(posicion)

}
