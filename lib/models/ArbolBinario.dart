import 'package:flutter_gestionempleados_arbolbinario/models/Empleado.dart';
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

  // Método para insertar un empleado en el árbol
  bool insertar(int id, String nombre) {
    if (_buscarNodo(raiz, id) != null) {
      // ID ya existe, no se inserta
      return false;
    }

    Empleado nuevoEmpleado = Empleado(id, nombre);
    Nodo nuevoNodo = Nodo(nuevoEmpleado);

    if (raiz == null) {
      raiz = nuevoNodo;
    } else {
      _insertarNodo(raiz, nuevoNodo);
    }
    return true; //Empleado guardado con exito
  }

  // Crear una lista para almacenar el recorido
  String preorden() {
    List<String> resultado = [];
    _preorden(raiz, resultado);
    return resultado.join("  -> ");
  }

  // Recorido preorden Raiz- Izquierda-Derecha
  void _preorden(Nodo? nodo, List<String> resultado) {
    if (nodo != null) {
      resultado.add('${nodo.empleado.id}: ${nodo.empleado.nombre}');
      // Jalar los datos de la izquierda y derecha
      _preorden(nodo.izquierdo, resultado);
      _preorden(nodo.derecho, resultado);
    }
  }

  // Crear una lista para almacenar el recorido
  String inorden() {
    List<String> resultado = [];
    _inorden(raiz, resultado);
    return resultado.join("  -> ");
  }

  // Recorido inorder izquierda - raiz - derecha
  void _inorden(Nodo? nodo, List<String> resultado) {
    if (nodo != null) {
      _inorden(nodo.izquierdo, resultado);
      resultado.add('${nodo.empleado.id}: ${nodo.empleado.nombre}');
      _inorden(nodo.derecho, resultado);
    }
  }

  // Crear una lista para almacenar el recorido
  String postorden() {
    List<String> resultado = [];
    _postorden(raiz, resultado);
    return resultado.join("  -> ");
  }

  // Recorido postorden Izquierda - Derecha- Raiz
  void _postorden(Nodo? nodo, resultado) {
    if (nodo != null) {
      _postorden(nodo.izquierdo, resultado);
      _postorden(nodo.derecho, resultado);
      resultado.add('${nodo.empleado.id}: ${nodo.empleado.nombre}');
    }
  }
}
