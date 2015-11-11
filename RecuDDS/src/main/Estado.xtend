package main

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Estado {
	
	def Aceptar(Viaje viaje){
		throw new TransicionEstadoException();
	}
	
	def Rechazar(Viaje viaje){
		throw new TransicionEstadoException();
	}
	
	def Solicitar(Viaje viaje, Taxi taxi){
		throw new TransicionEstadoException();
	}
	
	def Finalizar(Viaje viaje){
		throw new TransicionEstadoException();
	}
	
	def Pagar(Viaje viaje){
		throw new TransicionEstadoException();
	}
	
	def CancelarDebidoAlTaxi(Viaje viaje){
		//el que cancelo fue el taxi
		throw new TransicionEstadoException();
	}
	
	def CancelarDebidoAlCliente(Viaje viaje){
		//el que cancelo fue el cliente
		throw new TransicionEstadoException();
	}	
}