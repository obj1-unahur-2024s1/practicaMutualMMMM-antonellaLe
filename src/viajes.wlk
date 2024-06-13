import socios.*
class Viaje{
	const property lIdiomas = []
	
	method implicaEsfuerzo()
	method sirveParaBroncearse()
	method cuantosDiasLlevaLaAct()
	method esInteresante() {
		return lIdiomas.size() > 1
	}
	method esRecomendadaPara(unSocio){
		return self.esInteresante() and unSocio.leAtrae(self)
		 and not unSocio.lActvQuerealizo().contains(self)
	}
	
}
class ViajeALaPlaya inherits Viaje{
	var property largoPlaya
	
	override method implicaEsfuerzo() {return largoPlaya >= 1200}
 	override method sirveParaBroncearse() = true
	override method cuantosDiasLlevaLaAct() = largoPlaya / 500
}

class ViajeALaCiudad inherits Viaje{
	const property atracciones = 0
	
	override method implicaEsfuerzo() {
		return atracciones.between(5,8) 
	}
	override method sirveParaBroncearse() = false
	override method cuantosDiasLlevaLaAct() = atracciones / 2
	override method esInteresante(){
		return super() or atracciones == 5
	}
}

class ViajeACiudadTropical inherits ViajeALaCiudad{
	override method cuantosDiasLlevaLaAct() {
		return super() + 1
	}
	override method sirveParaBroncearse() = true
	
}

class Trekking inherits Viaje{
	var kmsDeSenderos
	var diasDeSol
	
	override method implicaEsfuerzo(){return kmsDeSenderos > 80 }
	override method cuantosDiasLlevaLaAct() = kmsDeSenderos / 50
	//hay más de 200 días de sol por año, o hay entre 100 y 200, y se recorren más de 120 kilómetros.	
	override method sirveParaBroncearse(){
		return (diasDeSol > 200 or diasDeSol.between(100,200)) and kmsDeSenderos > 120 
	}
	override method esInteresante(){
		return super() and diasDeSol > 140
	}
}

class Gimnasia inherits Viaje{
	
	//idiomas español
	override method implicaEsfuerzo() = true
	override method sirveParaBroncearse() = false
	override method cuantosDiasLlevaLaAct() = 1
	override method esRecomendadaPara(unSocio){
		return unSocio.edad().between(20,30)
	}
}
//BONUS
class TallerLiterario inherits Viaje{ //**VIAJE DEBERIA SER ACTIVIDAD*/
	const lLibros = []
	
	method idiomas() = lLibros.map({x => x.idioma()})
	override method implicaEsfuerzo() {
		return  lLibros.any({x => x.cantDePags() >= 500}) or
		self.condicionMismoAutor() and lLibros.size() > 1
		}
	override method sirveParaBroncearse() = false
	override method cuantosDiasLlevaLaAct() = lLibros.size() + 1
	override method esRecomendadaPara(unSocio) = unSocio.idiomasQueHabla().size() > 1
	
	method condicionMismoAutor() {
	const primerAutor = lLibros.map({x => x.autor()}).first()
	return lLibros.all({x => x.autor() == primerAutor})
	}
}
class Libro{
	const property idioma
	const property cantDePags
	const property autor
	
}

