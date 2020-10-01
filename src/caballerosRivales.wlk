import wollok.game.*
import velocidad.*

object caballerosRivales {
	var dificultad 
	
	method comienzo(lvlDificultad){
		dificultad = lvlDificultad
		if(lvlDificultad==1){velocidad.setearVisual(lvlDificultad)}
		else if(lvlDificultad==2){velocidad.setearVisual(lvlDificultad*0.25)}
		else {velocidad.setearVisual(lvlDificultad*0.1)}
	}
	
	
}
