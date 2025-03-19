import 'package:flutter_gestionempleados_arbolbinario/models/Empleado.dart';

class Nodo {
  Empleado empleado;
  Nodo? izquierdo;
  Nodo? derecho;

  // Constructor
  Nodo(this.empleado);
}
