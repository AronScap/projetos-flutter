import 'dart:convert';
import 'package:gestao_projetos/HomePage.dart';
import 'package:gestao_projetos/tools/configs.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  TextEditingController _controllerNomeCompleto = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  TextEditingController _controllerSenhaConfirm = TextEditingController();

  var _logging = false;

  void _realizarCadastro() async {
    setState(() {_logging = true;});
    String _email = _controllerEmail.text;
    String _senha = _controllerSenha.text;
    String _senha2 = _controllerSenhaConfirm.text;
    String _nome = _controllerNomeCompleto.text;
    var _urla = new GeneralConfigs();
    var _url = _urla.url_.toString()+"createuser";
    if(_email != null && _senha != null && _nome != null && _senha2 != null && _email != '' && _senha != '' && _nome != '' && _senha2 != ''){
      if(_senha == _senha2){
        http.Response response = await http.post(
          _url,
          headers: {"Content-type" : "application/json; charset=UTF-8"},
          body: json.encode({
            "nome" : _nome,
            "email" : _email,
            "senha" : _senha,
            "senha2" : _senha2,
          })
        );
          Map<String,dynamic> corporesposta = json.decode( response.body );
        if(response.statusCode.toString() == '200'){
          if(corporesposta["status"] == "ok"){
            _salvarPreferenciaLogado();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
          }
          else{
            print(corporesposta);
            _alert("Erro ao realizar cadastro",corporesposta["message"]);
          }
          setState(() {_logging = false;});
        }
        else{
          _alert("Erro inesperado: "+response.statusCode.toString()," e/ou senha incorretos");
          setState(() {_logging = false;});
        }
      }
      else{
        _alert("Senhas não correspondem","As senhas digitadas não são iguais");
        setState(() {_logging = false;});
      }
      
    }
    else{
      setState(() {_logging = false;});
      _alert("Erro ao logar","Preencha corretamente os campos.");
    }
  }
  
  void _salvarPreferenciaLogado() async {
    print("salvando preferencias...");
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("logado", true);
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
                onPressed: () {
                  Navigator.pop(context);
                }
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
      appBar: AppBar(
        backgroundColor: Color(0xff2e49ad),
      ),
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
                  padding: const EdgeInsets.only(left:12,right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text('Falta pouco...',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:12,right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text('Cadastre-se',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),],
                  ),
                ),
                SizedBox(height: 30.0,),
                Padding(
                  padding: const EdgeInsets.only(left:12,right:12),
                  child: TextField(
                    controller: _controllerNomeCompleto,
                    decoration: InputDecoration(
                      hintText: 'Nome Completo',
                      suffixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),),
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),                
                Padding(
                  padding: const EdgeInsets.only(left:12,right:12),
                  child: TextField(
                    controller: _controllerEmail,
                    decoration: InputDecoration(
                      hintText: 'E-mail',
                      suffixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),),
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                Padding(
                  padding: const EdgeInsets.only(left:12,right:12),
                  child: TextField(
                    controller: _controllerSenha,
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
                SizedBox(height: 10.0,),
                Padding(
                  padding: const EdgeInsets.only(left:12,right:12),
                  child: TextField(
                    controller: _controllerSenhaConfirm,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Confirmar Senha',
                      suffixIcon: Icon(Icons.visibility_off),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height:30.0),
                _logging ? Container(child: Text("Aguarde..."),) : RaisedButton.icon(
                  onPressed: () { _realizarCadastro(); },
                  icon: Icon(Icons.add_box),
                  label: Text('Cadastrar'),
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