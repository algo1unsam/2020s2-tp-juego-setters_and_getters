import clasesComunes.*

object nivelUno inherits Dificultad(nivel = 1){
	
	override method velocidadSegunNivel(){
		return self.nivel()
	}

}

object nivelDos inherits Dificultad(nivel = 2){
	
	override method velocidadSegunNivel(){
		return self.nivel() * 0.25
	}
}

object nivelTres inherits Dificultad(nivel = 3){
	
	override method velocidadSegunNivel(){
		return self.nivel() * 0.1
	}
}