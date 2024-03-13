// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  String texto;
  final void Function() quandoSelecionado;  

  Resposta(this.texto, this.quandoSelecionado);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            )
          ),
          
        ),
        onPressed: quandoSelecionado,
        child: Text(texto)
      ),
    );
  }
}