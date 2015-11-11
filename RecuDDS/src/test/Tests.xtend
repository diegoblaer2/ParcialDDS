package test
import main.Taxi
import static org.mockito.Mockito.*
import main.Ubicacion
import main.Area
import org.junit.Before
import main.RepoAreas
import org.junit.Test
import main.EnviadorSMS
import main.RepoTaxis
import main.Viaje

class Tests {
	Taxi taxi1
	Taxi taxi2
	Ubicacion canning
	Ubicacion obelisco
	Ubicacion plazaFlores
	Area capital
	Area bsas
	String celularCliente
	Viaje viaje
	
	@Before
	def void Seteo() {
		capital = new Area("capital")
		bsas = new Area("bsas")
		capital.padre = bsas
		RepoAreas.ObtenerInstancia.AgregarArea(capital)
		RepoAreas.ObtenerInstancia.AgregarArea(bsas)
		
		
		obelisco = new Ubicacion(1000, 1000)
		plazaFlores = new Ubicacion(1200, 1200)
		canning = new Ubicacion(3000, 3000)
		
		taxi1 = new Taxi("1231231", canning);
		taxi2 = new Taxi("3333333", obelisco);
		RepoTaxis.ObtenerInstancia.AgregarTaxi(taxi1)
		RepoTaxis.ObtenerInstancia.AgregarTaxi(taxi2)
		
		celularCliente = "1512312312"
		
		viaje = new Viaje(celularCliente, canning, obelisco)		
	}
	
	@Test
	def void usuarioSolicitaTaxiYSeEnviaMensajeAlTaxi() {
		val mock = mock(typeof(EnviadorSMS))
	    RepoTaxis.ObtenerInstancia.enviador = mock
	    viaje.enviador = mock
	    RepoTaxis.ObtenerInstancia.ViajeSolicitado(viaje)
	    verify(mock, times(1)).NuevoViaje(taxi1.celular, viaje)
	    		
	}
	
	
	@Test
	def void elTaxiAceptaElViaje() {
		val mock = mock(typeof(EnviadorSMS))
	    RepoTaxis.ObtenerInstancia.enviador = mock
	    viaje.enviador = mock
	    RepoTaxis.ObtenerInstancia.ViajeSolicitado(viaje)
	    taxi1.AceptarViaje(viaje)
	    
	    verify(mock, times(1)).NuevoViaje(taxi1.celular, viaje)
	    verify(mock, times(1)).ViajeAceptado(celularCliente)
	    		
	}
	
	@Test
	def void seSolicitaUnViajeYRechazanTodos() {
		val mock = mock(typeof(EnviadorSMS))
	    RepoTaxis.ObtenerInstancia.enviador = mock
	    viaje.enviador = mock
	    RepoTaxis.ObtenerInstancia.ViajeSolicitado(viaje)
	    taxi1.RechazarViaje(viaje)
	    taxi2.RechazarViaje(viaje)
	     
	    verify(mock, times(1)).ViajeRechazado(celularCliente)
	}
}