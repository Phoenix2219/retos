import 'package:flutter/material.dart';

class Ejercicio7 extends StatefulWidget {
  @override
  _Ejercicio7 createState() => _Ejercicio7();
}

class _Ejercicio7 extends State<Ejercicio7> {
  final TextEditingController _consumo = TextEditingController();

  double? _pago;

  void _calcularimporte() {
    setState(() {
      double consumo = double.tryParse(_consumo.text) ?? 0;
      if (consumo < 100) {
        _pago = consumo;
      } else if (consumo <= 500) {
        _pago = 1.5 * consumo;
      } else {
        _pago = 2 * consumo;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estructura condicional anidada 2'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: TextField(
                controller: _consumo,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Ingrese consumo',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _calcularimporte,
              child: Text('Calcular importe'),
            ),
            SizedBox(height: 10),
            if (_pago != null)
              Text(
                'El importe a pagar es: $_pago',
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}
