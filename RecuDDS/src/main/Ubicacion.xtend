package main

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Ubicacion {

	double latitud
	double longitud
	
	new(double lat, double lon){
		latitud = lat
		longitud = lon
	}
}