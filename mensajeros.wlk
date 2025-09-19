import vehiculos.*

object roberto {
  var vehiculo = bici
  method peso() {
    return 90 + vehiculo.peso()
  }
  method puedeLlamar() {return false}

  method cambiarVehiculo(unVehiculo) {
    vehiculo = unVehiculo
  }

}

object chuckNorris {
  method peso() {
    return 80
  }

  method puedeLlamar() {return true}
}

object neo {
  var tieneCredito = false
  method peso() {return 0}

  method puedeLlamar() {
    return tieneCredito
  }

  method cargarCredito() {
    tieneCredito = true
  }
}