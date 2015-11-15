package main

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
class Viaje {
	Taxi taxi
	double costo
	Estado estado
	Ubicacion origen
	Ubicacion destino
	String celularCliente
	EnviadorSMS enviador;
	List<Taxi> taxisDisponibles = new ArrayList();
	
	new(String contacto, Ubicacion ori, Ubicacion dest){
		taxi = null;
		costo = 0;
		estado = null;
		origen = ori
		destino = dest
		celularCliente = contacto
		estado = new Solicitado()
		taxisDisponibles = RepoTaxis.ObtenerInstancia.BuscarTaxisDisponibles(origen)
	}

	def SolicitarTaxi(){		
		if(taxisDisponibles.size == 0)
			estado.Rechazar(this)
		else
			enviador.NuevoViaje(taxisDisponibles.head.celular, this)
			
	}

	def void TaxiAceptaViaje(Taxi taxiQueAcepto){
		System.out.println("aceptado")		
		enviador.ViajeAceptado(celularCliente)
		taxi = taxiQueAcepto
		estado.Aceptar(this);
	}
	
	def void TaxiRechazaViaje(Taxi taxi){
		taxisDisponibles.remove(taxi)
		SolicitarTaxi()
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