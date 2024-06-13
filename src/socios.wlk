import viajes.*

class Socio{
	const  property lActvQuerealizo = []
	var  maxDeActv 
	var property edad
	const property idiomasQueHabla = []
	
	method esAdoradorDelSol() = lActvQuerealizo.all({x => x.sirveParaBroncearse()})
	method actvsForzadas() = lActvQuerealizo.filter({x => x.implicaEsfuerzo()})
	method sumaUna(actividad){
		if(lActvQuerealizo.size() == maxDeActv){
			self.error("Excede el maximo de actividades")
		}
		lActvQuerealizo.add(actividad)
	}
	method leAtrae(unaActividad)
	
}

class Tranquilo inherits Socio{
	override method leAtrae(unaActividad){
		return unaActividad.cuantosDiasLlevaLaAct() >= 4
	}
}

class Coherente inherits Socio{
	override method leAtrae(unaActividad){
		return self.esAdoradorDelSol()and (unaActividad.sirveParaBroncearse() or unaActividad.implicaEsfuerzo())
	}
}

class Relajado inherits Socio{
	override method leAtrae(unaActividad){
		return unaActividad.lIdiomas().contains({x => x.idiomasQueHabla()})
	}
}