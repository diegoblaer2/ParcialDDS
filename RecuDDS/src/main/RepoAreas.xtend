package main

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
class RepoAreas {
	List<Area> listadoAreas = new ArrayList();
	private static RepoAreas instancia
	
	def static RepoAreas ObtenerInstancia(){
		if(instancia == null){
			instancia = new RepoAreas()
		}
		instancia
	}
	
	def AgregarArea(Area area){
		listadoAreas.add(area)
	}
}