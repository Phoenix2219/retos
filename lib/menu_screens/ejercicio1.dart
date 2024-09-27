import 'package:flutter/material.dart';

class Ejercicio1 extends StatefulWidget {
  @override
  _Ejercicio1 createState() => _Ejercicio1();
}

class _Ejercicio1 extends State<Ejercicio1> {
  final TextEditingController _lado = TextEditingController();
  double? _area;

  void _calcularArea() {
    setState(() {
      double side = double.tryParse(_lado.text) ?? 0;
      _area = side * side;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calcular el área cuadrada'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(right: 30,left: 30),
              child: TextField(
                autofocus: true,
                controller: _lado,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Ingrese el lado del cuadrado',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _calcularArea,
              child: Text('Calcular Area'),
            ),
            SizedBox(height: 20),
            if (_area != null)
              Text(
                'El área del cuadrado es: $_area',
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}
