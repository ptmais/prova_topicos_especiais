import 'dart:io';

class Utils {

  static formatarDecimal(double n){
      return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  }

  static fecharAplicacao(){
    exit(0);
  }

}