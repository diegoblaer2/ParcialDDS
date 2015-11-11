package main

class Solicitado extends Estado {
	
	override Rechazar(Viaje viaje){
		viaje.estado = new Rechazado()
		viaje.enviador.ViajeRechazado(viaje.celularCliente)
	}
	
	override Aceptar(Viaje viaje){
		viaje.estado = new Aceptado()
		viaje.enviador.ViajeAceptado(viaje.celularCliente)
	}
	
	override CancelarDebidoAlCliente(Viaje viaje){
		viaje.estado = new Cancelado()
		viaje.enviador.ViajeAceptado(viaje.taxi.celular)
	}
}