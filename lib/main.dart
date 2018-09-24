import 'package:flutter/material.dart';
import 'package:meu_voto/page/splash_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.redAccent
      ),
      home: new SplashPage()
    );
  }

}