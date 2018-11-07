import Remeras.*
import Comercio_Y_Sucursales.*

class Pedido {
	
	var property cantidad = 0 // Es un número que indica la cantidad de remeras.
	var property tipoRemera = new Remera() // Recibe una Remera de cualquier tipo.
	var property sucursal = new Sucursal() // Recibe la sucursal que genera el pedido.
	
	
	method precioBase(){
	// Retorna el costo base del pedido
		return tipoRemera.costo() * cantidad
	}
	
	method descuento(){
		return tipoRemera.descuentoPorPedido()		
	}
	
	
	method aplicaDescuento(){
	// Devuelve un booleano indicando si se cumple la cantidad minima de remeras que pide la sucursal para aplicar descuento
	
	return cantidad >= sucursal.cantidadMinimaParaAplicarDescuento()
	
	}
	
	
	method precioTotal(){
	// Devuelve el precio total del pedido, teniendo en cuenta si se aplica un descuento.
		
		if(self.aplicaDescuento()){ 
			return self.precioBase() * self.descuento()
		}
		else { return self.precioBase()}
	} 
	
	
	
}
