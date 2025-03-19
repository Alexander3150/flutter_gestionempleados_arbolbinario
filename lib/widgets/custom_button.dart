import 'package:flutter/material.dart';
import 'package:flutter_gestionempleados_arbolbinario/models/arbolbinario.dart';

class BotonesAcciones extends StatelessWidget {
  final Arbolbinario arbol;
  final TextEditingController idController;
  final TextEditingController nombreController;

  const BotonesAcciones({
    super.key,
    required this.arbol,
    required this.idController,
    required this.nombreController,
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
          onPressed: () => arbol.preorden(),
          child: const Text('Mostrar Preorden'),
        ),
        ElevatedButton(
          onPressed: () => arbol.inorden(),
          child: const Text('Mostrar Inorden'),
        ),
        ElevatedButton(
          onPressed: () => arbol.postorden(),
          child: const Text('Mostrar Postorden'),
        ),
      ],
    );
  }
}
