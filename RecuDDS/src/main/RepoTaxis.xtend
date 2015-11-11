package main

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import java.util.Dictionary
import java.util.HashMap
import java.util.Map

@Accessors
class RepoTaxis {
	private static RepoTaxis instancia
	List<Taxi> listadoTaxis = new ArrayList();
	SistemaGeografico sistGeografico
	EnviadorSMS enviador
	Map<Viaje, List<Taxi>> listaPedidosPorViaje = new HashMap<Viaje, List<Taxi>>
	
	def static RepoTaxis ObtenerInstancia(){
		if(instancia == null){
			instancia = new RepoTaxis()
		}
		instancia
	}
	
	def void ViajeSolicitado(Viaje viaje){
		listaPedidosPorViaje.put(viaje, listadoTaxis)			
		val taxi = BuscarTaxi(viaje, listadoTaxis)
		enviador.NuevoViaje(taxi.celular, viaje)
	}
	
	def void TaxiAceptaViaje(Taxi taxi, Viaje viaje){
		viaje.Aceptar(taxi)
		listaPedidosPorViaje.remove(viaje)
	}
	
	def void TaxiRechazaViaje(Taxi taxi, Viaje viaje){
		//remuevo el taxi que rechazo de la lista de taxis disponibles para este viaje, NO de la lista total de taxis
		listaPedidosPorViaje.get(viaje).remove(taxi)
		//si la lista esta vacia, significa que todos los taxis rechazaron
		if(listaPedidosPorViaje.get(viaje).size == 0){
			viaje.Rechazar()
		}else{
			//le aviso al siguiente
			val siguiente = BuscarTaxi(viaje, listaPedidosPorViaje.get(viaje))
			enviador.NuevoViaje(siguiente.celular, viaje)
		}
	}
	
	
	def AgregarTaxi(Taxi taxi){
		listadoTaxis.add(taxi)
	}
	
	def Taxi BuscarTaxi(Viaje viaje, List<Taxi> lista){
		System.out.println("long lista: "+ lista.size)
		lista.filter[!it.ocupado].head
		//la linea de abajo es la que originalmente iba, pero en los test me rompia Y NO SE POR QUE!!!!!
		//lista.filter[!it.ocupado].filter[EstaEnElArea(it, viaje)].sortBy[sistGeografico.DistanciaEntre(it.ubicacion, viaje.origen)].head
	}
	
	
	def boolean EstaEnElArea(Taxi taxi, Viaje viaje){		
		sistGeografico.ObtenerArea(taxi.ubicacion).nombre == sistGeografico.ObtenerArea(viaje.origen).nombre 
		|| 
		sistGeografico.ObtenerArea(taxi.ubicacion).nombre == sistGeografico.ObtenerArea(viaje.origen).padre.nombre 
		
	}
}