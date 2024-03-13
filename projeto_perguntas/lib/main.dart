// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, must_be_immutable, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
    'texto': 'Qual atividade você prefere em um dia ensolarado?',
    'respostas': [
      {'texto': 'Praticar esportes ao ar livre', 'pontuacao': 10},
      {'texto': 'Fazer um piquenique no parque', 'pontuacao': 7},
      {'texto': 'Ir à praia e relaxar', 'pontuacao': 5},
      {'texto': 'Ficar em casa lendo ou assistindo filmes', 'pontuacao': 3},
    ]
  },
  {
    'texto': 'O que você faz em situações de estresse?',
    'respostas': [
      {'texto': 'Busco soluções práticas e resolvo o problema', 'pontuacao': 10},
      {'texto': 'Converso com amigos ou familiares', 'pontuacao': 7},
      {'texto': 'Faço exercícios de relaxamento, como meditação', 'pontuacao': 5},
      {'texto': 'Me isolo por um tempo até me sentir melhor', 'pontuacao': 3},
    ]
  },
  {
    'texto': 'Qual desses descreve melhor sua abordagem em relação a novas experiências?',
    'respostas': [
      {'texto': 'Estou sempre pronto para experimentar coisas novas', 'pontuacao': 10},
      {'texto': 'Gosto de planejar com cuidado antes de tentar algo novo', 'pontuacao': 7},
      {'texto': 'Prefiro ficar na zona de conforto, mas às vezes tento algo diferente', 'pontuacao': 5},
      {'texto': 'Tenho dificuldade em sair da rotina e experimentar coisas novas', 'pontuacao': 3},
    ]
  },
  {
    'texto': 'O que te motiva mais em seus objetivos?',
    'respostas': [
      {'texto': 'A sensação de realização e conquista', 'pontuacao': 10},
      {'texto': 'O reconhecimento e apoio das pessoas próximas', 'pontuacao': 7},
      {'texto': 'A busca por autoconhecimento e crescimento pessoal', 'pontuacao': 5},
      {'texto': 'Manter a estabilidade e segurança na vida', 'pontuacao': 3},
    ]
  },
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  final resultado = 'Parabéns!';

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    /* for (var textoResp in respostas) {
      widgets.add(Resposta(textoResp, _responder));
    } */

    return MaterialApp(
      theme: ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.blue)),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text('Perguntas', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold))),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
