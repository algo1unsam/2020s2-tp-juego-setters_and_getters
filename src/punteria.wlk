import wollok.game.*
import clasesComunes.*
import caballerosRivales.*
import resultado.*

object punteria inherits Etapa(image = "background_2.png", position = game.at(0, 0)) {

	override method setearVisual() {
		game.addVisual(self)
		rivalFrente.setearVisual()
		diana.setearVisual()
		mira.setearVisual()
		lanza.setearVisual()
		tiempo.setearVisual()
		game.onTick(3000, "corre tiempo", {tiempo.moverse(game.at(0, 0))} )
		self.enfrentados(caballerosRivales.dificultad())
	}

	override method teclaEnter() {
		caballerosRivales.siguienteEtapa(resultado)
	}

	// max superior derecho -> fila:43 | columna:30
	// max superior izq -> fila:13 | columna:30
	// max inf izq -> fila:13 | columna:0
	// max inf der -> fila:43 | columna:0
	
	
	override method teclaArriba() {
		
			if (mira.position().y() < 28) {
				mira.moverse(mira.position().up(1))
				lanza.moverse(lanza.position().up(1))
		}
	}

	override method teclaAbajo() {
		if (mira.position().y() > 9) {
			mira.moverse(mira.position().down(1))
			lanza.moverse(lanza.position().down(1))
		}
	}

	override method teclaIzquierda() {
		if (mira.position().x() > 14) {
			mira.moverse(mira.position().left(1))
			lanza.moverse(lanza.position().left(1))
		}
	}

	override method teclaDerecha() {
		if (mira.position().x() < 34) {
			mira.moverse(mira.position().right(1))
			lanza.moverse(lanza.position().right(1))
		}
	}
	
	
	method enfrentados(dificultad) {
		
		game.onTick(dificultad.velocidadSegunNivel() * 1000, "mueveDiana", { diana.moverse(new Position(x = diana.nuevaPosicionX(), y = diana.nuevaPosicionY()))})
	}
	
	//se acabo el tiempo o la mira choco con la punteria, se llama a este metodo
	method capturarPunteria(tiempo){
		
	}

}

object rivalFrente inherits Caballero(image = "caballero_rojo_frente.png", position = game.at(20, 9)) {

	override method moverse() {}
	
	override method movimiento() {}

}

object diana inherits Puntero(image = "diana.png", position = game.at(29, 17)) {

	var property posiciones = []

	method agregarPosiciones(nivel) {
		(nivel * 5).times({ i => self.posiciones().add(new Position(x = self.nuevaPosicionX(), y = self.nuevaPosicionY()))})
	}

	method nuevaPosicionX() {
		return 26.randomUpTo(30).truncate(0)
	}

	method nuevaPosicionY() {
		return 16.randomUpTo(26).truncate(0)
	}

	override method seleccion() {
	}

}

object mira inherits Puntero(image = "mira.png", position = game.at(29, 18)) {

	override method moverse(posicion) {
		self.position(posicion)
		
	}

	override method seleccion() {
	}

}


object lanza inherits Puntero(image = "lanza.png", position = mira.position().down(9).right(1)) {

	override method seleccion() {
	}

}

object tiempo inherits Puntero(image = "tiempo_5.png", position = game.at(43,20) ){
	var tiempo = 5
	override method seleccion(){}

	override method moverse(posicion) {
		if(tiempo>1){
			tiempo-=1
			self.image("tiempo_"+tiempo.toString()+".png")
		}else{
			self.image("tiempo_0.png")
			self.terminoTiempo(tiempo)
		
		}
		
	}
	method terminoTiempo(tiempop){
				game.removeTickEvent("corre tiempo")
				
		
	}
	
	method darTiempo() = tiempo
	
}

