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
      backgroundColor: const Color(0xFF1F2124), // Fondo de color #1F2124
      appBar: AppBar(
        title: const Text(
          'Registro de Empleados',
          style: TextStyle(
            color: Colors.amber, // Letras doradas
            fontFamily: 'CorsainOne', // Fuente Corsain One
            fontWeight: FontWeight.bold, // Negrita
          ),
        ),
        backgroundColor: const Color(0xFF1F2124), // Fondo del AppBar
      ), // Falta la coma aquí
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Center(
              child: Text(
                'Bienvenido',
                style: TextStyle(
                  color: Colors.amber, // Letras doradas
                  fontFamily: 'CorsainOne', // Fuente Corsain One
                  fontWeight: FontWeight.bold, // Negrita
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _idController,
              decoration: const InputDecoration(
                labelText: 'ID',
                labelStyle: TextStyle(color: Colors.amber), // Letras doradas
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber), // Borde dorado
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber), // Borde dorado
                ),
              ),
              style: const TextStyle(color: Colors.amber), // Letras doradas
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _nombreController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                labelStyle: TextStyle(color: Colors.amber), // Letras doradas
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber), // Borde dorado
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber), // Borde dorado
                ),
              ),
              style: const TextStyle(color: Colors.amber), // Letras doradas
            ),
            const SizedBox(height: 25),

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
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  'Recorrido: $_nombreRecorrido\n$_resultadoRecorrido', // Muestra nombre y resultado del recorrido
                  style: const TextStyle(
                    color: Colors.amber, // Letras doradas
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
