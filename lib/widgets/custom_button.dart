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
        ElevatedButton.icon(
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
          icon: const Icon(
            Icons.save,
            color: Color.fromRGBO(243, 243, 242, 1),
          ), // Icono dorado
          label: const Text(
            'Guardar',
            style: TextStyle(color: Colors.amber), // Letras doradas
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1F2124), // Fondo del botón
            side: const BorderSide(
              color: Color.fromARGB(255, 219, 218, 130), // Borde blanco
              width: 1, // Ancho del borde
            ),
          ),
        ),
        const SizedBox(height: 15),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                String resultado =
                    arbol.preorden(); // Obtener resultado del recorrido
                onRecorridoCompletado(
                  'Preorden',
                  resultado,
                ); // Actualizar estado con nombre y resultado
              },
              icon: const Icon(
                Icons.list,
                color: Color.fromRGBO(248, 246, 239, 1),
              ), // Icono dorado
              label: const Text(
                'Preorden',
                style: TextStyle(color: Colors.amber), // Letras doradas
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1F2124), // Fondo del botón
                side: const BorderSide(
                  color: Color.fromARGB(255, 219, 218, 130), // Borde blanco
                  width: 1, // Ancho del borde
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                String resultado =
                    arbol.inorden(); // Obtener resultado del recorrido
                onRecorridoCompletado(
                  'Inorden',
                  resultado,
                ); // Actualizar estado con nombre y resultado
              },
              icon: const Icon(
                Icons.list,
                color: Color.fromARGB(255, 253, 250, 240),
              ), // Icono dorado
              label: const Text(
                'Inorden',
                style: TextStyle(color: Colors.amber), // Letras doradas
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1F2124), // Fondo del botón
                side: const BorderSide(
                  color: Color.fromARGB(255, 219, 218, 130), // Borde blanco
                  width: 1, // Ancho del borde
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                String resultado =
                    arbol.postorden(); // Obtener resultado del recorrido
                onRecorridoCompletado(
                  'Postorden',
                  resultado,
                ); // Actualizar estado con nombre y resultado
              },
              icon: const Icon(
                Icons.list,
                color: Color.fromARGB(255, 238, 233, 220),
              ), // Icono dorado
              label: const Text(
                'Postorden',
                style: TextStyle(color: Colors.amber), // Letras doradas
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1F2124), // Fondo del botón
                side: const BorderSide(
                  color: Color.fromARGB(255, 219, 218, 130), // Borde blanco
                  width: 1, // Ancho del borde
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(
          color: Color.fromARGB(255, 255, 255, 255), // Línea de división dorada
          thickness: 1,
        ), // El Divider debe estar dentro del árbol de widgets
      ],
    );
  }
}
