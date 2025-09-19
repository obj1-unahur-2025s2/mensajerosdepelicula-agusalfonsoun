import mensajeros.*
import paquetes.*
import destinos.*

object empresa {
  const empleados = []
  const paquetesPendientes = [] 
  const paquetesEnviados = [] 

  method enviarPaquete(unPaquete) {
    if (self.algunMensajeroPuedeEntregar(unPaquete)) {
      paquetesEnviados.add(unPaquete)
    } else {
      paquetesPendientes.add(unPaquete)
    }
  }

  method contratar(unMensajero) {
    empleados.add(unMensajero)
  }

  method despedir(unMensajero) {
    empleados.remove(unMensajero)
  }

  method despedirATodos() {
    empleados.clear()
  }

  method esGrandeLaMensajeria() {
    return empleados.size() > 2
  }

  method sePuedeEntregarPorPrimerEmpleado(unPaquete) {
    return if (! empleados.isEmpty()) {
      unPaquete.puedeSerEntregado(empleados.first())
    } else {
      false
    }
  }

  method pesoUltimoMensajero() {
    return empleados.last().peso()
  }

  method algunMensajeroPuedeEntregar(unPaquete) {
    return empleados.any({ mensajero => unPaquete.puedeSerEntregado(mensajero)})
  }

  method todosLosQuePuedenLlevar(unPaquete) {
    return empleados.filter({m => unPaquete.puedeSerEntregado(m)})
  }

  method tieneSobrepeso() {
    return (empleados.sum({m => m.peso()}) / empleados.size()) > 500
  }

  method facturacion() {
    return paquetesEnviados.sum({p => p.precio()})
  }

  method enviar(conjuntoDePaquetes) {
    conjuntoDePaquetes.forEach({p => self.enviarPaquete(p)})
  }

  method enviarPaquetePendienteMasCaro() {
    if (self.algunMensajeroPuedeEntregar(self.paquetePendienteMasCaro())) {
      self.enviarPaquete(self.paquetePendienteMasCaro())
      paquetesPendientes.remove(self.paquetePendienteMasCaro())
    }
  }

  method paquetePendienteMasCaro() {
    return paquetesPendientes.max({p => p.precio()})
  }
}