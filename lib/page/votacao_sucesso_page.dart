import 'dart:math';
import 'package:flutter/material.dart';
import 'package:meu_voto/models/candidato.dart';
import 'package:meu_voto/page/layout_card_candidato_estatistica.dart';
import 'package:meu_voto/page/votacao_page.dart';
import 'package:meu_voto/utils/consts.dart';
import 'package:meu_voto/utils/utils.dart';

class VotacaoSucessoPage extends StatefulWidget {
  @override
  _VotacaoSucessoPageState createState() => _VotacaoSucessoPageState();
}

class _VotacaoSucessoPageState extends State<VotacaoSucessoPage> {

  @override
  Widget build(BuildContext context) {

    final appBar = AppBar(
      title: Text("Voto realizado com sucesso"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute(
                builder: (context) => VotacaoPage()
              )
            );        
          },
        ),
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Utils.fecharAplicacao(),
        )
      ],
    );

    List<Candidato> listaEstatistica = Consts.getListaCandidato();
    listaEstatistica.add(new Candidato("Voto em branco", 0));
    listaEstatistica.add(new Candidato("Voto nulo", 0));

    var random = new Random();
    int qtdVotosTotal = 0;

    for(Candidato c in listaEstatistica){
      c.qtdVotos = random.nextInt(200);
      qtdVotosTotal += c.qtdVotos;
    }

    for(Candidato c in listaEstatistica){
      c.percentualVotos = c.qtdVotos / qtdVotosTotal * 100;
    }
  
    final body = Container(
      padding: EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: listaEstatistica.length,
        itemBuilder: (context, i){
          final item = listaEstatistica[i];
          return CardCandidatoEstatisca(candidato: item);
        }
      )
    );

    final scaffold = Scaffold(
      appBar: appBar,
      body: body,
    );

    return MaterialApp(
      home: scaffold,
      theme: new ThemeData(
        primaryColor: Theme.of(context).primaryColor,
        accentColor: Theme.of(context).accentColor
      ),
    );

  }

}