import 'package:flutter/material.dart';
import 'package:tester_app/HomePage.dart';
import 'package:tester_app/testes/TesteBlack.dart';
import 'package:tester_app/testes/TesteBlue.dart';
import 'package:tester_app/testes/TesteGreen.dart';
import 'package:tester_app/testes/TesteRed.dart';
import 'package:tester_app/testes/TesteWhite.dart';


class Routes {
  final routes_ = <String,WidgetBuilder>{
    "/home" : (BuildContext context) => HomePage(),
    "/teste_black" : (BuildContext context) => TesteBlack(),
    "/teste_red" : (BuildContext context) => TesteRed(),
    "/teste_blue" : (BuildContext context) => TesteBlue(),
    "/teste_green" : (BuildContext context) => TesteGreen(),
    "/teste_white" : (BuildContext context) => TesteWhite(),
  };
}
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    routes: Routes().routes_,
  ));
}