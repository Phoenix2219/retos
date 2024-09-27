import 'package:flutter/material.dart';

class InputDecorations{
  static InputDecoration inputDecoration({
    required String hintText,
    required String labelText,
    required Icon icono,
    IconButton? suffixIcon,
  }){
    return InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey)
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey, width: 2
        )
      ),
      hintText: hintText,
      labelText: labelText,
      icon: icono,
      suffixIcon: suffixIcon,
    );
  }

}