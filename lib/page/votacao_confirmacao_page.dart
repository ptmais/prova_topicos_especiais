import 'package:flutter/material.dart';
import 'package:meu_voto/models/candidato.dart';
import 'package:meu_voto/page/votacao_sucesso_page.dart';
import 'package:meu_voto/utils/utils.dart';

class VotacaoConfirmacaoPage extends StatefulWidget {

  final Candidato candidato;

  VotacaoConfirmacaoPage({@required this.candidato});

  @override
  _VotacaoConfirmacaoPageState createState() => _VotacaoConfirmacaoPageState();
}

class _VotacaoConfirmacaoPageState extends State<VotacaoConfirmacaoPage> {

  @override
  Widget build(BuildContext context) {

    void confirmarVoto(){
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(
          builder: (context) => VotacaoSucessoPage()
        )
      );
    }

    final appBar = AppBar(
      title: Text("Confirmação da Votação"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Utils.fecharAplicacao(),
        )
      ],
    );

    final String nomeCandidato = "Candidato: " + widget.candidato.nome;
    final linhaNomeCandidato = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(nomeCandidato, style: TextStyle(fontSize: 20.0))
      ],
    );

    final botaoConfirmar = RaisedButton(
        elevation: 5.0,
        color: Theme.of(context).primaryColor,
        child: Text("Confirmar", style: new TextStyle(color: Colors.white)),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0)
        ),
        onPressed: confirmarVoto,
    );

    final linhaBotaoConfirmar = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        botaoConfirmar
      ],
    );

    final body = Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          linhaNomeCandidato,
          SizedBox(height: 20.0),
          linhaBotaoConfirmar
        ],
      )
    );

    final scaffold = Scaffold(
      appBar: appBar,
      body: body,
    );

    return scaffold;

  }

}