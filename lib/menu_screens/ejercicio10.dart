import 'package:flutter/material.dart';

class Ejercicio10 extends StatefulWidget {
  @override
  _Ejercicio10 createState() => _Ejercicio10();
}

class _Ejercicio10 extends State<Ejercicio10> {
  final TextEditingController _numero = TextEditingController();

  String _rango = "";

  void _calcularrango() {
    setState(() {
      double numero = double.tryParse(_numero.text) ?? 0;
      switch (numero) {
        case 0:
        case 1:
        case 2:
        case 3:
          _rango = "CORRECTO, el numero se encuentra entre : 0 y 3";
          break;
        case 4:
        case 5:
        case 6:
        case 7:
          _rango = "CORRECTO, el numero se encuentra entre : 4 y 7";
          break;
        case 8:
        case 9:
        case 10:
          _rango = "CORRECTO, el numero se encuentra entre : 8 y 10";
          break;
        default:
          _rango = "ERROR, ingreso un valor fuera del rango indicado";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estructura condicional multiple 2'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: TextField(
                controller: _numero,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Ingrese un número',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _calcularrango,
              child: Text('Calcular rango de números'),
            ),
            SizedBox(height: 10),
            if (_rango.isNotEmpty)
              Text(
                '$_rango',
                style: TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}
