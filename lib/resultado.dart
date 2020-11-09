import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int scores;
  final void Function() restartApp;

  Resultado(this.scores, this.restartApp);

  String get scoreText {
    if (scores < 8) return 'Parabéns!';
    if (scores < 12) return 'Você é bom!';
    if (scores < 16)
      return 'Impressionante!';
    else
      return 'Nivel Jedi!';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            scoreText,
            style: TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        FlatButton(
          padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
          onPressed: restartApp,
          child: Text(
            'Reiniciar',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          textColor: Colors.white,
          color: Colors.blue,
        )
      ],
    );
  }
}
