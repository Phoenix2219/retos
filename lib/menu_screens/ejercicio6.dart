import 'package:flutter/material.dart';
import 'dart:math';

class Ejercicio6 extends StatefulWidget {
  @override
  _Ejercicio6 createState() => _Ejercicio6();
}

class _Ejercicio6 extends State<Ejercicio6> {
  final TextEditingController _number = TextEditingController();

  int _randomNumber = 0;
  String _numero = "";

  void _verificarnumero() {
    int min = -1000;
    int max = 1000;
    _randomNumber = min + Random().nextInt(max - min + 1);
    setState(() {
      _number.text = _randomNumber.toString();
      if (_randomNumber == 0) {
        _numero = "Cero";
      } else if (_randomNumber < 0) {
        _numero = "Negativo";
      } else {
        _numero = "Positivo";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estructura condicional anidada'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: TextField(
                enabled: false,
                controller: _number,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Ingrese numero',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _verificarnumero,
              child: Text('Verificar número'),
            ),
            SizedBox(height: 10),
            if (_numero.isNotEmpty)
              Text(
                'El número es $_numero',
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}
