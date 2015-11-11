package main

class SistemaGeografico {
	def Area ObtenerArea(Ubicacion ubicacion){
			RepoAreas.ObtenerInstancia.listadoAreas.head
	}
	
	
	def double DistanciaEntre(Ubicacion origen, Ubicacion destino){
		//formula de distancia entre dos puntos ( gracias modulo B !!! =D )
		val x1 = origen.latitud
		val y1 = origen.longitud
		val x2 = destino.latitud
		val y2 = destino.longitud
		
		val a = Math.pow(x2-x1, 2)
		val b = Math.pow(y2-y1, 2)
		Math.sqrt(a+b)
	}
}