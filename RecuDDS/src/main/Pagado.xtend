package main

class Pagado extends Estado {
		
	override Finalizar(Viaje viaje){
		viaje.estado = new Finalizado();
	}
	
}