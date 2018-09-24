import 'dart:async';
import 'package:flutter/material.dart';
import 'package:meu_voto/page/votacao_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 5), irPaginaVotacao);
  }

  void irPaginaVotacao(){
    Navigator.pushReplacement(
      context, 
      new MaterialPageRoute(
        builder: (context) => VotacaoPage()
      )
    );
  }  

  @override
  Widget build(BuildContext context) {

    final apresentacaoSplash = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 50.0,
            child: Icon(
              Icons.adb,
              color: Colors.red,
              size: 50.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
          Text(
            "Votação", 
            style: TextStyle(
              color: Colors.white, 
              fontSize: 25.0,
              fontWeight: FontWeight.bold
            )
          )
        ],
      )
    );

    final progressoSplash = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Theme(
          data: Theme.of(context).copyWith(accentColor: Colors.yellow),
          child: CircularProgressIndicator(),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.0)
        ),
        Text(
          "Aguarde um momento...",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0  
          )
        )
      ],
    );

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.red,
                  Colors.red[400]
                ]
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    child: apresentacaoSplash,
                  )
                ),
                Expanded(
                  flex: 1,
                  child: progressoSplash,
                )
              ],
            ),
          )
        ],
      )
    );

  }

}