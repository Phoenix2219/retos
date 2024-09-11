import 'package:flutter/material.dart';

class Ejercicio2 extends StatefulWidget{
  @override
  _Ejercicio2 createState() => _Ejercicio2();
}

class _Ejercicio2 extends State<Ejercicio2> {
  final TextEditingController _edad = TextEditingController();
  final TextEditingController _precio = TextEditingController();

  double? _total;
  double _descuento=0;

  void _calcularEntrada() {
    
    int edad = int.tryParse(_edad.text) ?? 0;
    double precio = double.tryParse(_precio.text) ?? 0;
    setState(() {      
      if(edad<10){
        _descuento = 0.25*precio;
      }
      _total = precio-_descuento;
    }); 
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estructura condicional simple'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(          
              autofocus: true,
              controller: _edad,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ingrese su edad',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _precio,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
              labelText: 'Ingrese el precio de la entrada',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularEntrada,
              child: Text('Calcular Descuento'),
            ),
            SizedBox(height: 20),
            if (_total != null)
              Text(
                'El descuento es: $_descuento \n'
                'El total a pagar es: $_total',
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}