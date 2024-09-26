import 'package:flutter/material.dart';
import 'package:retos/models/usuario.dart';
import 'package:http/http.dart' as http;

const urlApi = '192.168.1.6:7215';

class Usuario_provider with ChangeNotifier{
  List<Usuario> usuario = [];

  Usuario_provider(){
    getUsuarios();
  }

  getUsuarios() async{
    final url = Uri.https(urlApi,'/Api/Usuario');
    final resp = await http.get(url, headers: {
      "Access-Control-Allow.Origin": "*",
      "Access-Control-Allow-Credentials": "true",
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });
    final response = usuarioFromJson(resp.body);
    usuario = response;
    notifyListeners();
  }
}