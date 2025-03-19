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
            ),
          ],
        ),
      ),
    );
  }
}
