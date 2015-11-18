package main

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Taxi {
	boolean ocupado
	boolean actualizado
	Ubicacion ubicacion
	String celular
	EnviadorSMS enviador
	
	new(String celular, Ubicacion ubicacion){
		ocupado = false;
		actualizado = true;	
		this.celular = celular
		this.ubicacion = ubicacion
	}

	
	def void AceptarViaje(Viaje viaje){
		enviador.ViajeAceptado(viaje.celularCliente)
		viaje.TaxiAceptaViaje(this)
		Ocupar() 
	}
	
	def void RechazarViaje(Viaje viaje){
		//aca no le envio ningun sms porque este taxi pudo haber rechazado pero otro lo acepto
		viaje.TaxiRechazaViaje(this)
	}	
	
	def void CancelarViaje(Viaje viaje){
		enviador.ViajeCancelado(viaje.celularCliente)
		viaje.CancelarDebidoAlTaxi()
		Desocupar()
	}
	
	def void FinalizarViaje(Viaje viaje){
		viaje.Finalizar()
		Desocupar()		
	}
		
	def void Ocupar(){
		ocupado = true
	}
	
	def void Desocupar(){
		ocupado = false
	}
}
