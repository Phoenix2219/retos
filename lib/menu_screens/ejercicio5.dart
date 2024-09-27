import 'package:flutter/material.dart';

class Ejercicio5 extends StatefulWidget {
  @override
  _Ejercicio5 createState() => _Ejercicio5();
}

class _Ejercicio5 extends State<Ejercicio5> {
  final TextEditingController _anios = TextEditingController();
  final TextEditingController _sueldo = TextEditingController();

  double? _total;
  double bono = 0;
  void _calcularBono() {
    int anios = int.tryParse(_anios.text) ?? 0;
    double sueldo = double.tryParse(_sueldo.text) ?? 0;

    setState(() {
      if (anios > 10) {
        bono = sueldo * 0.1;
      } else {
        bono = sueldo * 0.05;
      }
      _total = sueldo + bono;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estructura condicional doble 3'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: Column(
                children: [
                  TextField(
                    autofocus: true,
                    controller: _sueldo,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Ingrese su sueldo basico',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    autofocus: true,
                    controller: _anios,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Ingrese los años de antiguedad',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _calcularBono,
              child: Text('Calcular Bono'),
            ),
            SizedBox(height: 10),
            if (_total != null)
              Text(
                'El total es: $_total',
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}
