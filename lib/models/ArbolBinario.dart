import 'package:flutter_gestionempleados_arbolbinario/models/Nodo.dart';

class Arbolbinario {
  Nodo? raiz;

  // Metodos
  //Metodo para insertar un nuevo nodo
  void _insertarNodo(Nodo? nodo, Nodo nuevoNodo) {
    if (nodo == null) return;

    // Compara el ID del nodo actual co el ID del nuevo nodo para ver que subarbol se guarda
    if (nuevoNodo.empleado.id < nodo.empleado.id) {
      if (nodo.izquierdo == null) {
        nodo.izquierdo = nuevoNodo; // Guardar en subarbol izquierdo
      } else {
        _insertarNodo(nodo.izquierdo, nuevoNodo); // Nodo hijo
      }
    } else {
      if (nodo.derecho == null) {
        nodo.derecho = nuevoNodo; //Guardar en subarbol Derecho
      } else {
        _insertarNodo(nodo.derecho, nuevoNodo); //Nodo hijo
      }
    }
  }

  // Buscar por ID
  Nodo? _buscarNodo(Nodo? nodo, int id) {
    // Si el nodo actual es nulo, significa que el nodo retornar
    if (nodo == null) return null;

    //Si se encuetna un nodo con el ID buscado se retorna
    if (id == nodo.empleado.id) {
      return nodo;
    } else if (id < nodo.empleado.id) {
      // Si es menor se busca en el subarbol izquierdo
      return _buscarNodo(nodo.izquierdo, id);
    } else {
      // Caso contrario se busca en el subarbol derecho
      return _buscarNodo(nodo.derecho, id);
    }
  }
}
