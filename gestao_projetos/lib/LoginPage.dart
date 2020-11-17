import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:gestao_projetos/CadastroPage.dart';
import 'package:gestao_projetos/EsqueciSenha.dart';
import 'package:gestao_projetos/HomePage.dart';
import 'package:http/http.dart' as http;


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _controllerEmailLogin = TextEditingController();
  TextEditingController _controllerSenhaLogin = TextEditingController();

  void _fazerLogin() async {
    String _emailLogin = _controllerEmailLogin.text;
    String _senhaLogin = _controllerSenhaLogin.text;
    const _url = "http://trass.com.br/api/index.php/";
     
    if(_emailLogin != null && _senhaLogin != null && _emailLogin != '' && _senhaLogin != ''){
      http.Response response = await http.post(
        _url + "login",
        headers: {
          "Content-type" : "application/json; charset=UTF-8"
        },
        body: json.encode({
          "email" : _emailLogin,
          "senha" : _senhaLogin,
        })
      );
      print("Response: + ${response.body}");
      if(response.statusCode == '200'){
        var corporesposta = json.decode( response.body.toString() );
        print(corporesposta);
        if(corporesposta.status == "ok"){
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context)=>HomePage() ),
            (Route<dynamic> route) => false
          );
        }
        else{
          showDialog(context: context,
            builder: (context){
              return AlertDialog(
                title:Text("Erro"),
                content: Text(corporesposta),
                actions : <Widget>[
                    FlatButton(
                      child: Text("OK"),
                          onPressed: () {
                            Navigator.pop(context);
                    }
                  )
                ]
              );
          });
        }
      }
      else{
        print("Response: + ${response.statusCode}");
        
      }
      
    }
    else{
      showDialog(context: context,
        builder: (context){
          return AlertDialog(
            title:Text("Erro"),
            content: Text("Login e/ou Senha inválido(s)"),
            actions : <Widget>[
                FlatButton(
                   child: Text("OK"),
                      onPressed: () {
                        Navigator.pop(context);
                }
               )
            ]
           );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    FlutterStatusbarcolor.setStatusBarColor(Color(0xff2e49ad));
    // FlutterStatusbarcolor.setNavigationBarColor(Colors.blue); 

    return Scaffold(
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
                    children: [
                      Text('Login',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                SizedBox(height: 10.0,),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: _controllerEmailLogin,
                    decoration: InputDecoration(
                      hintText: 'E-mail',
                      suffixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 0.0,),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: _controllerSenhaLogin,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Senha',
                      suffixIcon: Icon(Icons.visibility_off),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0,),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EsqueciSenha()),
                          );
                        },
                        child: Text.rich(                        
                          TextSpan(
                            text: 'Esqueceu a senha?',
                            style: TextStyle(
                              color: Color(0xffEE7B23)
                            ),
                          ),
                        )
                      ),
                      RaisedButton.icon(
                        onPressed: () {
                          _fazerLogin();
                        },
                        icon: Icon(Icons.login),
                        label: Text('Entrar'),
                        textColor: Colors.white,
                        color: Color(0xff1e286a),
                      ), 
                    ],
                  ),
                ),
                SizedBox(height:10.0),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CadastroPage()),
                    );

                  },
                  child: Text.rich(
                    TextSpan(
                      text: 'Ainda não possui conta? ',
                      children: [
                        TextSpan(
                          text: 'Cadastre-se',
                          style: TextStyle(
                            color: Color(0xffEE7B23)
                          ),
                        ),
                      ]
                    ),
                  ),
                ),


              ],
            ),
          ),
        )
      )
    );
  }
}