import Remeras.*
import Pedidos.*


// PARTE C

class Comercio {
	// Modelo que representa un Comercio.
	
	var property pedidos = [] // Lista de Pedido. Por defecto está vacía.
	var property sucursales= [] // Lista de Sucursal. Por defecto esta vacía.
	
// PUNTO 1)
	
	method registrarPedido(pedido){
	// Agrega un pedido a la lista de pedidos del comercio.
		pedidos.add(pedido)
	}
	
	
// PUNTO 2
	
	method totalFacturado(){
		return sucursales.sum { sucursal => sucursal.totalFacturado()}
	}
	
	
	
// PUNTO 3

	method pedidosDeSucursal(sucursalIndicada){
	// Devuelve la lista de pedidos de la sucursal indicada.
		
		var sucursalABuscar = sucursales.filter { sucursal => sucursal == sucursalIndicada}
		return sucursalABuscar.pedidos()
	}
	
	
	method totalFacturadoEnSucursal(sucursal){
	// Devuelve un numero que indica el total facturado por la sucursal indicada.
	
		return sucursal.totalFacturado()
	}
	
	
	
// PUNTO 4
	
	method pedidosSegunColor(color){
	// Devuelve los pedidos hechos del color específicado.
	
		return pedidos.filter { pedido => pedido.tipoRemera().color() == color}
	}
	
	
	method cantidadPedidosDeColor(color){
		return self.pedidosSegunColor(color).size()
	}
	
	
// PUNTO 5
	
	method pedidoMasCaro(){
	// Devuelve el pedido más caro recibido por el comercio.
	
		return pedidos.max { pedido => pedido.precioTotal()}
	}
	
	
// PUNTO 6

	method tallesSolicitados(){
	// Devuelve el conjunto de talles de los se han solicitado pedidos.
		
		return pedidos.map { pedido => pedido.tipoRemera().talle()}.asSet()
	}
	
	method tallesNoSolicitados(){
	// Devuelve el conjunto de talles de los que no se han solicitado pedidos.
	
		var talles = new Range(32, 48).asSet()
		
		return talles.difference(self.tallesSolicitados())
	}
	
// PUNTO 7

	method sucursalQueMasFacturo(){
	// Devuelve la sucursal que mas facturo.
	
		return sucursales.max { sucursal => sucursal.totalFacturado()}
	}
	
// PUNTO 8
	
	method sucursalesQueVendieronTodosLosTalels(){
	// Devuelve una lista de Sucursal en la que cada sucursal vendio remeras de todos los talles.
		return sucursales.filter { sucursal => sucursal.vendioRemerasDeTodosLosTalles()}
	}
	
}








class Sucursal {
	// Modelo que representa una sucursal del Comercio.
	
	var property pedidos = [] // Lista de Pedido. Por defecto está vacía.
	var property cantidadMinimaParaAplicarDescuento = 5
	/*
	 * Numero que indica la cantidad de remeras minimas para aplicar descuento.
	 * Cada Sucursal define esta cantidad individualmente.
	 */
	 
	 
	 method agregarPedido(pedido){
	// Agrega un pedido a la lista de pedidos del comercio.
		pedidos.add(pedido)
	}
	 
	 
	 method totalFacturado(){
	 	return pedidos.sum { pedido => pedido.precioTotal()}
	 }
	 
	 
	 method tallesSolicitados(){
	// Devuelve el conjunto de talles de los se han solicitado pedidos.
		
		return pedidos.map { pedido => pedido.tipoRemera().talle()}.asSet()
	}
	 
	 
	 method vendioRemerasDeTodosLosTalles(){
	 // Devuelve un booleano indicando si la sucursal vendio remeras de todos los talles
	 	var talles = new Range (32, 48).asSet()
	 	
	 	return self.tallesSolicitados() == talles
	 		 	
	 }
	 
}
