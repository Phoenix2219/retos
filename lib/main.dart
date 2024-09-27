import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retos/menu_screens/home.dart';
import 'package:retos/login/login_screen.dart';
import 'package:retos/providers/usuario_provider.dart';

void main(){
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Agregar mas clases provider
    return MultiProvider(
      
      //Para llamar al provider desde otro archivo
      providers: [
        ChangeNotifierProvider(create: (_) => Usuario_provider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RETOS',
        routes: {
          'login': (_) => LoginScreen(),
          'home': (_) => Home(),
        },
        initialRoute: 'login',
      ),
    );
  }
}