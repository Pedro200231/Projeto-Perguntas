// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, empty_constructor_bodies, must_be_immutable

import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciarQuestionario;

  const Resultado(this.pontuacao, this.reiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao <= 15) {
      return 'Personalidade Introvertida';
    } else if (pontuacao <= 25) {
      return 'Personalidade Equilibrada.';
    } else if (pontuacao <= 35) {
      return 'Personalidade Extrovertida.';
    } else {
      return 'Personalidade Ambiciosa.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(fraseResultado,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 20, width: double.infinity),
        TextButton(
          onPressed: reiniciarQuestionario,
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          onLongPress: reiniciarQuestionario,
          child: Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 25),
          ),
        ),
      ],
    );
  }
}
