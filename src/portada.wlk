
import caballerosRivales.*


object portada {
	
	method comienzo(lvlDificultad){
	
		caballerosRivales.dificultad(lvlDificultad) 
		//velocidad.setearVisual(lvlDificultad.velocidadSegunNivel())
		
	}
	method tecla1(){
		self.comienzo(1)
	}
	
}
