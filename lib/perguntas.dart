import 'package:curso_flutter/questao.dart';
import 'package:curso_flutter/resposta.dart';
import 'package:flutter/material.dart';

class Perguntas extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int selectQuestion;
  final void Function(int) solution;

  Perguntas({
    @required this.perguntas,
    @required this.selectQuestion,
    @required this.solution,
  });

  bool get moreQuestions {
    return selectQuestion < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas =
        moreQuestions ? perguntas[selectQuestion]['respostas'] : null;

    return Column(
      children: <Widget>[
        Questao(
          perguntas[selectQuestion]['text'],
        ),
        ...respostas.map((r) {
          return Resposta(
            r['text'],
            () => solution(r['score']),
          );
        }).toList(),
      ],
    );
  }
}
