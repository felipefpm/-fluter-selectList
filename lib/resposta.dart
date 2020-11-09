import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String text;
  final void Function() onSelected;

  Resposta(this.text, this.onSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: onSelected,
        child: Text(text),
      ),
    );
  }
}
