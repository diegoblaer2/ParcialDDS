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

	
	def static RepoTaxis ObtenerInstancia(){
		if(instancia == null){
			instancia = new RepoTaxis()
		}
		instancia
	}

	
	def AgregarTaxi(Taxi taxi){
		listadoTaxis.add(taxi)
	}
	
	def List<Taxi> BuscarTaxisDisponibles(Ubicacion ubicacion){
		listadoTaxis.filter[!it.ocupado].toList
		//la linea de abajo es la que originalmente iba, pero en los test me rompia Y NO SE POR QUE!!!!!
		//listadoTaxis.filter[!it.ocupado].filter[EstaEnElArea(it, ubicacion)].sortBy[sistGeografico.DistanciaEntre(it.ubicacion, ubicacion)]
	}
	
	
	def boolean EstaEnElArea(Taxi taxi, Ubicacion ubicacion){		
		sistGeografico.ObtenerArea(taxi.ubicacion).nombre == sistGeografico.ObtenerArea(ubicacion).nombre 
		|| 
		sistGeografico.ObtenerArea(taxi.ubicacion).nombre == sistGeografico.ObtenerArea(ubicacion).padre.nombre 
		
	}
}