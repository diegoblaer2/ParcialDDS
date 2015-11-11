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
		RepoTaxis.ObtenerInstancia().TaxiAceptaViaje(this, viaje)
		Ocupar() 
	}
	
	def void RechazarViaje(Viaje viaje){
		RepoTaxis.ObtenerInstancia().TaxiRechazaViaje(this, viaje)
		//no rechazo el viaje todavia porque pueden haber otros taxis que acepten
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