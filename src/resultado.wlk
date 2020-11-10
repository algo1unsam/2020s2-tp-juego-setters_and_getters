import wollok.game.*
import clasesComunes.*
import caballerosRivales.*
import niveles.*
import personajes.*
import portada.*
import carteles.*
object resultado inherits Etapa(image = "FondoResultado.jpg", position = game.at(0, 0)){
	
	var property habilitoEnter = 0
	
	override method teclaEnter() {
			if(habilitoEnter == 1){
            game.removeVisual(jugador)
            game.removeVisual(rival)
            jugadorInvisible.callar()
            rivalInvisible.callar()
            game.removeVisual(jugadorInvisible)
            game.removeVisual(rivalInvisible)
            game.removeVisual(mensajeResultado)
            game.removeVisual(mensajeEnter)
            game.removeVisual(self) 
            caballerosRivales.resumeSonidoGeneral()
            game.removeVisual(portada)
            habilitoEnter = 0
            caballerosRivales.siguienteEtapa(portada)
		}
    }
	
	override method setearVisual() {
		game.addVisual(self) //Coloco el fondo de pantalla
		
		jugador.aparecerEn(38,9)
		rival.aparecerEn(6, 9)
		
		//Los objetos invisibles son usados para que los dialogos salgan de la boca del caballero 
		jugadorInvisible.aparecerEn(43,13)
		rivalInvisible.aparecerEn(9, 13)
		
		//Demoro a que los caballeros digan su puntaje
		game.schedule(600, {jugadorInvisible.decirConstantemente(jugador.puntaje())})
		game.schedule(600, {rivalInvisible.decirConstantemente(rival.puntaje())})
		
		game.schedule(2000, {mensajeEnter.aparecerEn(23, 1) habilitoEnter = 1})
		
		caballerosRivales.detenerSonidoGeneral() //Detengo la musica para que se reconozca el sonido del resultado

		//Le pido a CaballerosRivales que segun la dificultad elegida decida si gano o pierdo
		if (caballerosRivales.dificultad().consultaVictoria(self.ganoEnVelocidad(), self.ganoEnPunteria())) {
				
			mensajeResultado.image("victoria.png")		
			mensajeResultado.setearVisual()
			//game.addVisual(new Visual(image = "victoria.png", position = game.at(17, 18)))
			game.sound("victoria.wav").play()
		} else {
			mensajeResultado.image("derrota.png")		
			mensajeResultado.setearVisual()
			//game.addVisual(new Visual(image = "derrota.png", position = game.at(17, 18)))
			game.sound("derrota.wav").play()
		}
	}
	
	//---------COMPARACIONES DE VICTORIA-----------
	method ganoEnVelocidad() = jugador.velocidadAdquirida() > rival.velocidadAdquirida()
	method ganoEnPunteria() = jugador.punteriaAdquirida() > rival.punteriaAdquirida()
	//---------------------------------------------

}

