import destinos.*
import mensajeros.*

object paquete {
  var estaPago = false
  var destino = matrix
  method estaPago() {
    return estaPago
  }

  method registrarPago(unValor) {
    estaPago = true
  }

  method puedeSerEntregado(unMensajero) {
    return estaPago && destino.puedePasar(unMensajero)
  }

  method precio() {
    return 50
  }

  method registrarDestino(unDestino) {
    destino = unDestino
  }
}


object paquetito {
  var destino = matrix

  method precio() {
    return 0
  }
  
  method estaPago() {
    return true
  }

  method puedeSerEntregado(unMensajero) {
    return true
  }

  method registrarDestino(unDestino) {
    destino = unDestino
  }

}

object paquetonViajero {
  const destinos = []
  var montoPagado = 0

  method precio() {
    return 100 * destinos.size()
  }

  method registrarPago(unValor) {
    montoPagado = (montoPagado + unValor).min(self.precio())
  }

  method estaPago() {
    return montoPagado == self.precio()
  }

  method registrarDestino(unDestino) {
    destinos.add(unDestino)
  }

  method quitarDestino(unDestino) {
    destinos.remove(unDestino)
  }

  method puedeSerEntregado(unMensajero) {
    return self.estaPago() && destinos.all({destino => destino.puedePasar(unMensajero)})
  }
}