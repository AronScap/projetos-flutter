import 'package:flutter/material.dart';
import 'package:gestao_projetos/CadastroPage.dart';
import 'package:gestao_projetos/EsqueciSenha.dart';
import 'package:gestao_projetos/HomePage.dart';
import 'package:gestao_projetos/LoginPage.dart';
import 'package:gestao_projetos/MeusProjetos.dart';
import 'package:gestao_projetos/ProfilePage.dart';
import 'package:gestao_projetos/SettingsPage.dart';


class Routes {
  final routes_ = <String,WidgetBuilder>{
    "/login" : (BuildContext context) => LoginPage(),
    "/home" : (BuildContext context) => MeusProjetos(),
    "/forgetpass" : (BuildContext context) => EsqueciSenha(),
    "/createuser" : (BuildContext context) => CadastroPage(),
    "/profile" : (BuildContext context) => ProfilePage(),
    "/settings" : (BuildContext context) => SettingsPage(),
  };
}
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
    routes: Routes().routes_,
  ));
}