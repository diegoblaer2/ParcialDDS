package main

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Taxi {
	boolean ocupado
	boolean actualizado
	Ubicacion ubicacion
	String celular
	
	new(String celular, Ubicacion ubicacion){
		ocupado = false;
		actualizado = true;	
		this.celular = celular
		this.ubicacion = ubicacion
	}

	
	def void AceptarViaje(Viaje viaje){
		viaje.TaxiAceptaViaje(this)
		Ocupar() 
	}
	
	def void RechazarViaje(Viaje viaje){
		viaje.TaxiRechazaViaje(this)
	}	
	
	def void CancelarViaje(Viaje viaje){
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