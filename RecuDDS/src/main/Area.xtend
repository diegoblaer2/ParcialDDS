package main

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Area {
	String nombre
	Area padre
	
	new(String nomb){
		nombre = nomb
	}
}