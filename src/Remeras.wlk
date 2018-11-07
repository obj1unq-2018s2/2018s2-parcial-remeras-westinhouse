class Remera {
	//Es el modelo de remera clásico, lisa y sin detalles.
	
	const property color = "Blanco" // Es un string que indica el color de la remera.
	const property talle = "32"		// Es un número que indica el talle de la remera.
	const coloresBasicos = ["Blanco", "Negro", "Gris"]
	
	

	method esDeColorBasico(){
	//Devuelve un booleano indicando si el color de la remera es básico.
		
		return coloresBasicos.any {colorRemera => colorRemera == color}
	}
	
	
	method esTalleEstandar(){
	//Devuelve un booleano indicando si el talle de la remera está entre el 32 y el 40.	
		
		return talle.between(32, 40)
	}
	
	
	method precioPorTalle(){
	//Devuelve el costo de la remera según el talle.
		
		if(self.esTalleEstandar()){	return 80 }
		
		else { return 100}
	}
	
	
	method adicionalPorColor(){
	/*
	 * Devuelve la suma adicional a pagar según el color de la remera.
	 * Si esta es de un color básico, no paga ningún adicional.
	 * Caso contrario, paga un 10% más al costo total de la remera.
	 */
		
		if(self.esDeColorBasico()){ return 0}
		
		else { return self.precioPorTalle() * 10/100}
	}
	
	
	method costo() {
		return self.precioPorTalle() + self.adicionalPorColor()
	}
	
	
	method descuentoPorPedido(){
	// Devuelve un numero que indica el porcentaje de descuento que se hace en caso de pedir un lote de este tipo de remeras.
		
		return 10 / 100
	}
	
}



class Remera_Bordada inherits Remera {
	// Modelo que representa a una remera bordada.
	
	const property bordado = ["Rojo", "Amarillo", "etc"] 
	/*
	 * Lista de colores que constituyen el bordado. 
	 * Cabe destacar que esta lista no podra estar vacía. Si yo instancio a una remera bordada,
	 * necesariamente le estare pasando al menos un color de bordado.
	 */
	
	method costoPorBordado(){
	// Retorna un número que indica el monto adicional por el bordado
		
		if(bordado.size() <= 2){ return 20}
		else{ return bordado.size() * 10}
	}
	
	override method costo(){
		return super() + self.costoPorBordado()
	}
	
	override method descuentoPorPedido(){
		return 2 / 100
	}
}




class Remera_Sublimada inherits Remera {
	// Modelo que representa a una remera sublimada.
	
	const  anchoSublimado = 10 // Numero que representa el ancho del sublimado, en cm
	const  altoSublimado  = 10 // Numero que representa el alto del sublimado, en cm
	
	const adicionalPorCopyright = 0 // Numero que representa el costo impuesto por la empresa dueña de la imagen que se quiere sublimar.
	const comercioTieneConvenio = false 
	/*
	 * Booleano que indica si la sucursal que encarga la confeccion de la remera
	 * tiene un convenio con la empresa dueña de la imagen que se quiere sublimar,
	 * (en caso de que dicha imagen tenga copyright).
	 */ 
	
	
	method costoPorSublimado(){
	// Devuelve un numero que indica el costo del sublimado.		
	
		return anchoSublimado * altoSublimado * 0.5
	}
	
	
	override method costo(){
		return super() + self.costoPorSublimado() + adicionalPorCopyright
	}
	
	override method descuentoPorPedido(){
		if(comercioTieneConvenio){ return 20 / 100 }
		
		else{ return super() }
	}
	
	
}
