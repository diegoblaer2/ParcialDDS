package main

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Viaje {
	Taxi taxi
	double costo
	Estado estado
	Ubicacion origen
	Ubicacion destino
	String celularCliente
	EnviadorSMS enviador;
	
	
	new(String contacto, Ubicacion ori, Ubicacion dest){
		taxi = null;
		costo = 0;
		estado = null;
		origen = ori
		destino = dest
		celularCliente = contacto
		estado = new Solicitado()
	}

	def void Aceptar(Taxi taxiQueAcepto){
		taxi = taxiQueAcepto
		estado.Aceptar(this);
	}
	
	def void Rechazar(){
		estado.Rechazar(this);
	}
	def void Finalizar(){
		estado.Finalizar(this);	
	}
	def void CancelarDebidoAlCliente(){
		estado.CancelarDebidoAlCliente(this) //el cliente fue quien cancelo el taxi
	}
	
	def void CancelarDebidoAlTaxi(){
		estado.CancelarDebidoAlTaxi(this) //el cliente fue quien cancelo el taxi
	}
	
	def void Pagar(){
		estado.Pagar(this);
	}
}