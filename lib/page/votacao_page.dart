import 'package:flutter/material.dart';
import 'package:meu_voto/models/candidato.dart';
import 'package:meu_voto/page/votacao_confirmacao_page.dart';
import 'package:meu_voto/utils/consts.dart';
import 'package:meu_voto/utils/utils.dart';

class VotacaoPage extends StatefulWidget {
  @override
  _VotacaoPageState createState() => _VotacaoPageState();
}

class _VotacaoPageState extends State<VotacaoPage> {

  final tfNumeroVotoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    void limparCampos(){
      setState(() {
        tfNumeroVotoController.text = "";
      });
    }

    void votarBranco(){
      Candidato candidato = new Candidato("Voto em branco", 0);
      Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context) => VotacaoConfirmacaoPage(candidato: candidato)
        )
      );
    }

    void votarNormal(){
      if(_formKey.currentState.validate()){
        int numeroDigitado = int.parse(this.tfNumeroVotoController.text);
        final listaCandidato = Consts.getListaCandidato().where((Candidato c) => c.numero == numeroDigitado);
        Candidato candidato = new Candidato("Voto nulo", 0);

        if(listaCandidato.isNotEmpty){
          candidato = listaCandidato.first;
        }

        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => VotacaoConfirmacaoPage(candidato: candidato)
          )
        );
      }
    }

    final appBar = AppBar(
      title: Text("Votação"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Utils.fecharAplicacao(),
        )
      ],
    );

    final tfNumeroVoto = TextFormField(
      autofocus: false,
      decoration: new InputDecoration(
        labelText: "Informe o número do candidato"
      ),
      keyboardType: TextInputType.number,
      controller: tfNumeroVotoController,
      validator: (value) => value.isEmpty ? "Campo obrigatório" : null,
    );

    final form = Form(
      key: _formKey,
      child: tfNumeroVoto,
    );

    final botaoLimpar = RaisedButton(
        elevation: 5.0,
        child: Text("Limpar", style: new TextStyle(color: Colors.white)),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0)
        ),
        onPressed: limparCampos,
        color: Colors.black26,
    );

    final botaoBranco = RaisedButton(
        elevation: 5.0,
        child: Text("Branco", style: new TextStyle(color: Colors.white)),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0)
        ),
        onPressed: votarBranco,
        color: Colors.black87,
    );

    final botaoVotar = RaisedButton(
        elevation: 5.0,
        color: Theme.of(context).primaryColor,
        child: Text("Votar", style: new TextStyle(color: Colors.white)),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0)
        ),
        onPressed: votarNormal,
    );

    final listaBotao = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        botaoLimpar,
        Padding(
          padding: EdgeInsets.only(right: 8.0),
        ),
        botaoBranco,
        Padding(
          padding: EdgeInsets.only(right: 8.0),
        ),
        botaoVotar
      ]
    );

    final body = Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.white,
      child: Column(children: <Widget>[
        form,
        SizedBox(height: 20.0),
        listaBotao
      ]),
    );

    final scaffold = Scaffold(
      appBar: appBar,
      body: body,
    );

    limparCampos();

    return scaffold;
  }
  
}