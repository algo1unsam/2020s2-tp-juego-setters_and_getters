import punteria.*
import wollok.game.*

// max superior derecho : fila: 43 columna:30
// max superior izq : fila: 13 columna:30
// max inf izq : fila: 13 columna:0
// max inf der : fila: 43 columna:0
object up {

	method ir() {
		if (mira.position().y() < 28) {
			mira.moverse(mira.position().up(1))
			lanza.moverse(mira.position().up(1))
		}
	}

}

object down {

	method ir() {
		if (mira.position().y() > 9) {
			mira.moverse(mira.position().down(1))
			lanza.moverse(mira.position().down(1))
		}
	}

}



object left {

	method ir() {
		if (mira.position().x() > 14) {
			mira.moverse(mira.position().left(1))
			lanza.moverse(mira.position().left(1))
		} 
	}

}

object right {

	method ir() {
		if (mira.position().x() < 34) {
			
			mira.moverse(mira.position().right(1))
			lanza.moverse(mira.position().right(1))
		} 
	}

}

