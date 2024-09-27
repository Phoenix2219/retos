import 'package:flutter/material.dart';

class LectorQr extends StatefulWidget {
  const LectorQr({super.key});

  @override
  State<LectorQr> createState() => _nameState();
}

class _nameState extends State<LectorQr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Contenido superpuesto con el botón flotante
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min, // Limitar el tamaño del contenido
              children: [
                const Text(
                  'Aprete el botón para escanear un QR',
                  style: TextStyle(fontSize: 14),
                ),
                const Icon(Icons.arrow_drop_down, size: 24),
                const SizedBox(height: 10), // Espacio entre la flecha y el botón
                FloatingActionButton(
                  foregroundColor:const Color.fromARGB(255, 0, 0, 0),
                  backgroundColor: const Color.fromARGB(255, 151, 140, 140),
                  onPressed: () {
                    // Acción al presionar el botón
                  },
                  child: const Icon(Icons.qr_code_2, size: 40),
                ),
                const SizedBox(height: 30), // Espacio para evitar que el botón quede muy cerca del borde inferior
              ],
            ),
          ),
        ],
      ),
    );
    /*return Scaffold(      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 224, 219, 219),
        onPressed: () {},
        child: const Icon(Icons.qr_code_2),
      ),
    );*/
  }
}
