package main

class Aceptado extends Estado {
	
	override CancelarDebidoAlCliente(Viaje viaje){
		viaje.estado = new Cancelado();
		viaje.enviador.ViajeCancelado(viaje.taxi.celular)
	}
	
	override CancelarDebidoAlTaxi(Viaje viaje){
		viaje.estado = new Cancelado();
		viaje.enviador.ViajeCancelado(viaje.celularCliente)
	}
	
	override Pagar(Viaje viaje){
		viaje.estado = new Pagado();
	}
	
	override Finalizar(Viaje viaje){
		viaje.estado = new Finalizado();
	}
	
	
	
}