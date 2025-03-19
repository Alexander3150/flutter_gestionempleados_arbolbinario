import 'package:flutter/material.dart';
import 'package:flutter_gestionempleados_arbolbinario/models/arbolbinario.dart';

class BotonesAcciones extends StatelessWidget {
  final Arbolbinario arbol;
  final TextEditingController idController;
  final TextEditingController nombreController;
  final Function(String, String)
  onRecorridoCompletado; // Callback para pasar nombre y resultado

  const BotonesAcciones({
    super.key,
    required this.arbol,
    required this.idController,
    required this.nombreController,
    required this.onRecorridoCompletado,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            int id = int.tryParse(idController.text) ?? 0;
            String nombre = nombreController.text;
            if (id != 0 && nombre.isNotEmpty) {
              bool exito = arbol.insertar(id, nombre);
              idController.clear();
              nombreController.clear();

              if (exito) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Empleado agregado')),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('ID ya en uso, el empleado no fue agregado'),
                  ),
                );
              }
            }
          },
          child: const Text('Guardar'),
        ),
        ElevatedButton(
          onPressed: () {
            String resultado =
                arbol.preorden(); // Obtener resultado del recorrido
            onRecorridoCompletado(
              'Preorden',
              resultado,
            ); // Actualizar estado con nombre y resultado
          },
          child: const Text('Mostrar Preorden'),
        ),
        ElevatedButton(
          onPressed: () {
            String resultado =
                arbol.inorden(); // Obtener resultado del recorrido
            onRecorridoCompletado(
              'Inorden',
              resultado,
            ); // Actualizar estado con nombre y resultado
          },
          child: const Text('Mostrar Inorden'),
        ),
        ElevatedButton(
          onPressed: () {
            String resultado =
                arbol.postorden(); // Obtener resultado del recorrido
            onRecorridoCompletado(
              'Postorden',
              resultado,
            ); // Actualizar estado con nombre y resultado
          },
          child: const Text('Mostrar Postorden'),
        ),
      ],
    );
  }
}
