import 'package:flutter/material.dart';

class Ejercicio8 extends StatefulWidget{
  @override
  _Ejercicio8 createState() => _Ejercicio8();
}

class _Ejercicio8 extends State<Ejercicio8> {
  
  final TextEditingController _nota = TextEditingController();

  String _letranota="";

  void _calcularnota() {
                        
    setState(() {
      double nota = double.tryParse(_nota.text) ?? 0;
      if(nota<=5){
        _letranota = "E";
      }else if(nota<=10.5){
        _letranota = "D";
      }else if(nota<=13){
        _letranota = "C";
      }else if(nota<=17){
        _letranota = "B";
      }else{
        _letranota = "A";
      }
    }); 
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estructura condicional anidada 3'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(          
              controller: _nota,
              keyboardType: TextInputType.number,                     
              decoration: InputDecoration(
                labelText: 'Ingrese nota',
                border: OutlineInputBorder(),
              ),
              
            ),
            ElevatedButton(
              onPressed: _calcularnota,
              child: Text('Calcular nota'),
            ),  
            SizedBox(height: 20),          
            if (_letranota.isNotEmpty)
              Text(
                'Su nota es: $_letranota',
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}