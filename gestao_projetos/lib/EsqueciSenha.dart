import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:gestao_projetos/tools/configs.dart';
import 'package:http/http.dart' as http;

class EsqueciSenha extends StatefulWidget {
  @override
  _EsqueciSenhaState createState() => _EsqueciSenhaState();
}

class _EsqueciSenhaState extends State<EsqueciSenha> {
  bool _logging = false;
  TextEditingController _controllerEmail = TextEditingController();
  void _recuperarSenha() async {
    setState(() {_logging = true;});
    String _emailLogin = _controllerEmail.text;
    var _urla = new GeneralConfigs();
    var _url = _urla.url_.toString() + "forgetpass";
    if(_emailLogin != null && _emailLogin != ''){
      http.Response response = await http.post(
        _url,
        headers: {"Content-type" : "application/json; charset=UTF-8"},
        body: json.encode({"email" : _emailLogin})
      );
      Map<String,dynamic> corporesposta = json.decode( response.body );
      if(response.statusCode.toString() == '200'){
        if(corporesposta["status"] == "ok"){
          showDialog(context: context,
            builder: (context){
              return AlertDialog(
                title:Text("Verifique seu e-mail"),
                content: Text("Foi enviado para seu e-mail uma nova senha, com ela poderá acessar o sistema novamente!"),
                actions : <Widget>[
                    FlatButton(
                      child: Text("Entendi"),
                      onPressed: () {Navigator.popAndPushNamed(context, '/login');}
                    ),
                ]
              );
            }
          );
        }
        else{
          print(corporesposta);
          if(corporesposta["status"] == "usernotexists" || corporesposta["status"] == "invalidemail"){
            showDialog(context: context,
              builder: (context){
                return AlertDialog(
                  title:Text("Erro"),
                  content: Text(corporesposta["message"]),
                  actions : <Widget>[
                      FlatButton(
                        child: Text("Não"),
                        onPressed: () {Navigator.pop(context);}
                      ),
                      FlatButton(
                        child: Text("Criar conta"),
                        onPressed: () {Navigator.popAndPushNamed(context, '/createuser');}
                      ),
                  ]
                  );
            });
          }
          else _alert("Erro ao alterar senha",corporesposta["message"]);
        }
        setState(() {_logging = false;});
      }
      else{
        _alert("Erro inesperado: "+response.statusCode.toString(),"Usuário e/ou senha incorretos");
        setState(() {_logging = false;});
      }
      
    }
    else{
      setState(() {_logging = false;});
      _alert("Erro ao logar","Preencha corretamente os campos.");
    }
  }

  void _alert(var _title, var _text){
    showDialog(context: context,
      builder: (context){
        return AlertDialog(
          title:Text(_title),
          content: Text(_text),
          actions : <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {Navigator.pop(context);}
              )
          ]
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    FlutterStatusbarcolor.setStatusBarColor(Color(0xff2e49ad));
    
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xff2e49ad),),
      body: Container( 
        child: Container(
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: width,
                  child: Image.asset('images/login.png',fit: BoxFit.fitWidth,),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('Esqueci minha senha',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),],
                  ),
                ),
                SizedBox(height: 10.0,),
                SizedBox(height: 10.0,),
                Text('Digite seu e-mail cadastrado para criar uma nova senha',style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: _controllerEmail,
                    decoration: InputDecoration(
                      hintText: 'E-mail',
                      suffixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height:10.0),
                _logging ? Container(child: Text("Aguarde..."),) : RaisedButton.icon(
                  onPressed: () { _recuperarSenha(); },
                  icon: Icon(Icons.email),
                  label: Text('Enviar'),
                  textColor: Colors.white,
                  color: Color(0xff1e286a),
                ), 
                SizedBox(height:10.0),

              ],
            ),
          ),
        )
      )
    );
  }
}