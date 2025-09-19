object bici {
  method peso() {
    return 5
  }
}

object camion {
  var acoplados = 1
  method peso() {
    return 500 * 1.max(acoplados)
  }

  method cambiarAcoplados(cantidadAcoplados) {
    acoplados = cantidadAcoplados
  }
}
