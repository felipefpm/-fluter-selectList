import 'package:curso_flutter/perguntas.dart';
import 'package:curso_flutter/resultado.dart';
import 'package:flutter/material.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _scoreTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'text': 'Qual sua cor favorita?',
      'respostas': [
        {'text': 'Preto', 'score': 10},
        {'text': 'Vermelho', 'score': 5},
        {'text': 'Azul', 'score': 3},
        {'text': 'Roxo', 'score': 1},
      ]
    },
    {
      'text': 'Qual seu animal favorito?',
      'respostas': [
        {'text': 'Cachorro', 'score': 10},
        {'text': 'Gato', 'score': 5},
        {'text': 'Papagaio', 'score': 3},
        {'text': 'Ramister', 'score': 1},
      ]
    },
    {
      'text': 'Qual seu instrutor favorito?',
      'respostas': [
        {'text': 'Felipe', 'score': 10},
        {'text': 'Marcela', 'score': 5},
        {'text': 'Fabricia', 'score': 3},
        {'text': 'Raimundo', 'score': 1},
      ]
    },
  ];

  void _responder(int score) {
    if (moreQuestions) {
      setState(() {
        _perguntaSelecionada++;
        _scoreTotal += score;
      });
    }
  }

  void _restartApp() {
    setState(() {
      _perguntaSelecionada = 0;
      _scoreTotal = 0;
    });
  }

  bool get moreQuestions {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Perguntas',
          ),
        ),
        body: moreQuestions
            ? Perguntas(
                perguntas: _perguntas,
                selectQuestion: _perguntaSelecionada,
                solution: _responder,
              )
            : Resultado(_scoreTotal, _restartApp),
      ),
    );
  }
}
