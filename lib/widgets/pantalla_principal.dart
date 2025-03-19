import 'package:flutter/material.dart';
import 'package:flutter_gestionempleados_arbolbinario/models/arbolbinario.dart';
import 'package:flutter_gestionempleados_arbolbinario/widgets/custom_button.dart';

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});

  @override
  _PantallaPrincipalState createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final Arbolbinario arbol = Arbolbinario();
  String _resultadoRecorrido = ''; // Variable para almacenar el resultado
  String _nombreRecorrido =
      ''; // Variable para almacenar el nombre del recorrido

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Empleados')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _idController,
              decoration: const InputDecoration(labelText: 'ID'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _nombreController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            const SizedBox(height: 20),
            BotonesAcciones(
              arbol: arbol,
              idController: _idController,
              nombreController: _nombreController,
              onRecorridoCompletado: (String nombre, String resultado) {
                setState(() {
                  _nombreRecorrido =
                      nombre; // Actualiza el nombre del recorrido
                  _resultadoRecorrido =
                      resultado; // Actualiza el resultado del recorrido
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Recorrido: $_nombreRecorrido\n$_resultadoRecorrido', // Muestra nombre y resultado del recorrido
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
