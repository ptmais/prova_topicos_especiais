import 'package:meu_voto/models/candidato.dart';

class Consts {

  static getListaCandidato(){
    List<Candidato> listaCandidato = [
      new Candidato("Papai Noel", 10),
      new Candidato("Saci", 20),
      new Candidato("Cascão", 30)
    ];

    return listaCandidato;
  }

}