import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:retos/menu_screens/lector_qr.dart';
import 'ejercicio1.dart';
import 'ejercicio2.dart';
import 'ejercicio3.dart';
import 'ejercicio4.dart';
import 'ejercicio5.dart';
import 'ejercicio6.dart';
import 'ejercicio7.dart';
import 'ejercicio8.dart';
import 'ejercicio9.dart';
import 'ejercicio10.dart';

class Home extends StatefulWidget {
  HomeState createState() => HomeState();
}

class HomeState extends State<Home>{
  int _selectDrawerItem = 0;
  _getDrawerItemWidget(int pos){
    switch(pos){
      case 0: return Ejercicio1();
      case 1: return Ejercicio2();
      case 2: return Ejercicio3();
      case 3: return Ejercicio4();
      case 4: return Ejercicio5();
      case 5: return Ejercicio6();
      case 6: return Ejercicio7();
      case 7: return Ejercicio8();
      case 8: return Ejercicio9();
      case 9: return Ejercicio10();
      case 10: return const LectorQr();
    }
  }

  _onSelectItem(int pos){
    Navigator.of(context).pop();
    setState(() {
      _selectDrawerItem = pos;  
    });    
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RETOS'),
      ),
      drawer: Drawer(    
        backgroundColor: Colors.white,   
        child: ListView( 
          children: <Widget>[    
            /*OTRO DISEÑO DE CABECERA
              AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,              
              child: UserAccountsDrawerHeader(
                accountName: const Text('Prueba'), 
                accountEmail: const Text('a@a.a'),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: const Text('P', style: TextStyle(fontSize: 40.0, color: Colors.black),),
                  ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade600, Color.fromRGBO(84, 88, 83, 1)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),*/
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 12, 12, 11),Color.fromRGBO(84, 88, 83, 1),],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/user_profile.png'),
                    radius: 40,
                  ).animate().fadeIn(delay: 500.ms), // Animación al cargar
                  const SizedBox(height: 10),
                  const Text(
                    'Bienvenido',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ).animate().slideY(delay: 800.ms), // Animación de deslizamiento
                ],
              ),
            ),
            _buildAnimatedListTile(
              text: 'Ejercicio 1',
              icon: Icons.star,
              color: Color.fromRGBO(84, 88, 83, 1),
              selected: (0 == _selectDrawerItem),
              onTap: (){                
                _onSelectItem(0);
              },
            ),
            _buildAnimatedListTile(
              text: 'Ejercicio 2',
              icon: Icons.star,
              color: Color.fromRGBO(84, 88, 83, 1),
              selected: (1 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(1);
              }
            ),
            _buildAnimatedListTile(
              text: 'Ejercicio 3',
              icon: Icons.star,
              color: Color.fromRGBO(84, 88, 83, 1),
              selected: (2 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(2);
              }
            ),
            _buildAnimatedListTile(
              text: 'Ejercicio 4',
              icon: Icons.star,
              color: Color.fromRGBO(84, 88, 83, 1),
              selected: (3 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(3);
              }
            ),
            _buildAnimatedListTile(
              text: 'Ejercicio 5',
              icon: Icons.star,
              color: Color.fromRGBO(84, 88, 83, 1),
              selected: (4 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(4);
              }
            ),
            _buildAnimatedListTile(
              text: 'Ejercicio 6',
              icon: Icons.star,
              color: Color.fromRGBO(84, 88, 83, 1),
              selected: (5 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(5);
              }
            ),
            _buildAnimatedListTile(
              text: 'Ejercicio 7',
              icon: Icons.star,
              color: Color.fromRGBO(84, 88, 83, 1),
              selected: (6 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(6);
              }
            ),
            _buildAnimatedListTile(
              text: 'Ejercicio 8',
              icon: Icons.star,
              color: Color.fromRGBO(84, 88, 83, 1),
              selected: (7 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(7);
              }
            ),
            _buildAnimatedListTile(
              text: 'Ejercicio 9',
              icon: Icons.star,
              color: Color.fromRGBO(84, 88, 83, 1),
              selected: (8 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(8);
              }
            ),
            _buildAnimatedListTile(
              text: 'Ejercicio 10',
              icon: Icons.star,
              color: Color.fromRGBO(84, 88, 83, 1),
              selected: (9 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(9);
              }
            ),
            _buildAnimatedListTile(
              text: 'Lector qr',
              icon: Icons.star,
              color: Color.fromRGBO(84, 88, 83, 1),
              selected: (10 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(10);
              },
            ),
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectDrawerItem),
    );
  }

  Widget _buildAnimatedListTile({
    required IconData icon,
    required String text,
    required Color color,
    required bool selected,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.blue.shade100, // Efecto ripple al tocar
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(text),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey), // Flecha interactiva
      ),
    ).animate().scaleXY(delay: 200.ms, duration: 400.ms); // Animación de escalado al cargar
  }
}