import 'package:flutter/material.dart';
import 'package:meu_voto/models/candidato.dart';
import 'package:meu_voto/utils/utils.dart';

class CardCandidatoEstatisca extends StatelessWidget {

  final Candidato candidato;

  CardCandidatoEstatisca({@required this.candidato});

  @override
  Widget build(BuildContext context) {
  
    final cardLinha = Row(
      children: <Widget>[
        Divider(height: 10.0, color: Colors.red),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(candidato.nome, textAlign: TextAlign.left, style: TextStyle(fontSize: 16.0)),
          )
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(candidato.qtdVotos.toString() + " Votos", textAlign: TextAlign.center, style: TextStyle(fontSize: 10.0)),
                SizedBox(width: 5.0),
                Icon(
                  Icons.star,
                  size: 12.0,
                  color: Colors.yellow,
                )
              ],
            ),   
            Row(
              children: <Widget>[
                Text(Utils.formatarDecimal(candidato.percentualVotos) + "%", textAlign: TextAlign.center, style: TextStyle(fontSize: 10.0)),
                SizedBox(width: 5.0),
                Icon(
                  Icons.child_care,
                  size: 12.0,
                  color: Colors.yellowAccent,
                )
              ],
            )           
          ],
        )
      ],
    );

    final card = Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: cardLinha
    );

    return card;

  }

}