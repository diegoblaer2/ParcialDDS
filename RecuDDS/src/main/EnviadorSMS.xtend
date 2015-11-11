package main

interface EnviadorSMS {
	def void NuevoViaje(String celularTaxi, Viaje viaje)
	def void ViajeAceptado(String celular)
	def void ViajeRechazado(String celular)
	def void ViajeCancelado(String celular)
}