import 'package:flutter/material.dart';

class Ejercicio3 extends StatefulWidget {
  @override
  _Ejercicio3 createState() => _Ejercicio3();
}

class _Ejercicio3 extends State<Ejercicio3> {
  final TextEditingController _edad = TextEditingController();

  String _condicion = "";

  void _calcularEdad() {
    int edad = int.tryParse(_edad.text) ?? 0;
    setState(() {
      if (edad < 18) {
        _condicion = "menor";
      } else {
        _condicion = "mayor";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estructura condicional doble 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: TextField(
                autofocus: true,
                controller: _edad,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Ingrese su edad',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _calcularEdad,
              child: Text('Calcular edad'),
            ),
            SizedBox(height: 10),
            if (_condicion.isNotEmpty)
              Text(
                'Persona $_condicion de edad',
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}
