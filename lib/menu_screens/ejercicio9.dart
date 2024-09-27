import 'package:flutter/material.dart';

class Ejercicio9 extends StatefulWidget {
  @override
  _Ejercicio9 createState() => _Ejercicio9();
}

class _Ejercicio9 extends State<Ejercicio9> {
  final TextEditingController _numero = TextEditingController();

  String _semana = "";

  void _calcularsemana() {
    setState(() {
      double numero = double.tryParse(_numero.text) ?? 0;
      switch (numero) {
        case 1:
          _semana = "Lunes";
          break;
        case 2:
          _semana = "Martes";
          break;
        case 3:
          _semana = "Miercoles";
          break;
        case 4:
          _semana = "Jueves";
          break;
        case 5:
          _semana = "Viernes";
          break;
        case 6:
          _semana = "Sabado";
          break;
        case 7:
          _semana = "Domingo";
          break;
        default:
          _semana = "No existe";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estructura condicional multiple'),
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
                  labelText: 'Ingrese el dia de la semana[1-7]',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _calcularsemana,
              child: Text('Calcular dia de la semana'),
            ),
            SizedBox(height: 10),
            if (_semana.isNotEmpty)
              Text(
                'El dia de la semana es: $_semana',
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}
