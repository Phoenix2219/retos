import 'package:flutter/material.dart';

class Ejercicio4 extends StatefulWidget {
  @override
  _Ejercicio4 createState() => _Ejercicio4();
}

class _Ejercicio4 extends State<Ejercicio4> {
  final TextEditingController _nota1 = TextEditingController();
  final TextEditingController _nota2 = TextEditingController();
  final TextEditingController _nota3 = TextEditingController();
  final TextEditingController _nota4 = TextEditingController();

  double _promedio = 0;
  String _calificacion = "";

  void _calcularPromedio() {
    int nota1 = int.tryParse(_nota1.text) ?? 0;
    int nota2 = int.tryParse(_nota2.text) ?? 0;
    int nota3 = int.tryParse(_nota3.text) ?? 0;
    int nota4 = int.tryParse(_nota4.text) ?? 0;

    setState(() {
      _promedio = (nota1 + nota2 + nota3 + nota4) / 4;

      if (_promedio >= 11.5) {
        _calificacion = "APROBADO";
      } else {
        _calificacion = "DESAPROBADO";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estructura condicional doble 2'),
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
                    controller: _nota1,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Ingrese su nota 1',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    autofocus: true,
                    controller: _nota2,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Ingrese su nota 2',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    autofocus: true,
                    controller: _nota3,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Ingrese su nota 3',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    autofocus: true,
                    controller: _nota4,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Ingrese su nota 4',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _calcularPromedio,
              child: Text('Calcular promedio'),
            ),
            SizedBox(height: 10),
            if (_calificacion.isNotEmpty)
              Text(
                'Usted se encuentra $_calificacion \n'
                'Su resultado final es: $_promedio',
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}
