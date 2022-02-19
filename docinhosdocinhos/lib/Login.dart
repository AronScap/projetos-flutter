import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:docinhosdocinhos/Cadastro.dart';
import 'package:docinhosdocinhos/Forgetpass.dart';
import 'package:docinhosdocinhos/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerNovasenha = TextEditingController();
  bool _carregando = false;

  void _errorFormulario(String _message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Acho que encontramos um problema!"),
          content: new Text(_message),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _realizarLogin() async { 
    String emailusuario = _controllerEmail.text;
    String senha = _controllerNovasenha.text;

    String url = "http://192.168.0.111/0__TRASS/_CLIENTES_/DOCINHOSDOCINHOS/controle/api/mobile/auth/login";
    // String url = "http://192.168.0.110/0__TRASS/_CLIENTES_/DOCINHOSDOCINHOS/controle/api/mobile/auth/login";
    // String url = "http://192.168.0.107/0__TRASS/_CLIENTES_/DOCINHOSDOCINHOS/controle/api/mobile/auth/login";
    http.Response response;
    response = await http.post(
      url,
      headers: {
        "Content-type" : "application/json; charset=UTF-8"
      },
      body: json.encode(
        {
          "usuario": emailusuario,
          "senha" : senha
        }
      )
    );

    Map<String, dynamic> retorno = json.decode( response.body );
    if(retorno.isEmpty){
      _errorFormulario("Erro ao realizar Login!");
      setState(() {_carregando = false;});
      return;
    }
    
    bool success = retorno['success'];
    String message = retorno['message'].toString();
    if(success){
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('username', emailusuario);
 
      _controllerEmail.text = "";
      _controllerNovasenha.text = "";
      setState(() {_carregando = false;});
      Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => Home()
        )
      );
    }
    else{
      _errorFormulario(message);
      setState(() {_carregando = false;});
    }
  }

  void _logarUsuario(){
    
    setState(() {_carregando = true;});
    String emailNovo = _controllerEmail.text;
    String novaSenha = _controllerNovasenha.text;
   
    if(emailNovo == null || emailNovo.length == 0 || !emailNovo.contains('@')){
      _errorFormulario("Preencha o seu E-mail corretamente");
      setState(() {_carregando = false;});
      return;
    }
    if(novaSenha == null || novaSenha.length == 0 || novaSenha.length > 6 || novaSenha.length < 6){
      _errorFormulario("Preencha a sua Senha corretamente. Deve conter 6 caracteres!");
      setState(() {_carregando = false;});
      return;
    }
    
    _realizarLogin();
        
  }

  _verificarUsuarioLogado() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userId = prefs.getString('username');

    if (userId != null) {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => Home()
      ));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verificarUsuarioLogado();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container( 
                height: 300.0,
                color: Colors.transparent,
                child: new Container(
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/fundologin.png"),
                      fit: BoxFit.fill,
                    ),
                  )
                ),
              ),  
              Container(
                margin: const EdgeInsets.only(left: 23.0, right: 23.0),
                child: Padding(
                  padding: EdgeInsets.only(top: 52),
                  child: Container(
                    child: TextField(
                      controller: _controllerEmail,
                      autofocus: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(30, 16, 30, 16),
                        hintText: "E-mail",
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xffe85e92), width: 1.78),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(17.23)
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffe85e92), width: 1.78),
                        ),  
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Color(0xffe85e92),
                        ),
                      ),
                    )
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 23.0, right: 23.0),
                child: Padding(
                  padding: EdgeInsets.only(top: 23),
                  child: Container(
                    child: TextField(
                      autofocus: false,
                      controller: _controllerNovasenha,
                      maxLength: 6,
                      maxLengthEnforced: true,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(30, 16, 30, 16),
                        hintText: "Senha",
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xffe85e92), width: 1.78),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(17.23),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffe85e92), width: 1.78),
                        ),
                        prefixIcon: const Icon(
                          Icons.vpn_key,
                          color: Color(0xffe85e92),
                        ),
                      ),
                    )
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 23.0),
                child: Padding(
                  padding: EdgeInsets.only(left: 23, right: 23),
                  child: Container(
                    child:FlatButton(
                      onPressed: () {
                        _logarUsuario();
                      },
                      child: Text("Entrar",style: TextStyle(color: Colors.white),),
                      color: Color(0xffe85e92),
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23),
                      ),
                    ),
                  ),
                ),
              ),
              

              _carregando ? Padding(
                padding: EdgeInsets.only(top: 20),
                child:Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                )
              ) : Container(),

              Container(
                margin: const EdgeInsets.only(top: 13.0),
                child: Padding(
                  padding: EdgeInsets.only(left: 23, right: 23),
                  child: Container(
                    child:FlatButton(
                      onPressed: () {
                        Navigator.push(context, 
                          MaterialPageRoute(
                            builder: (context) => Forgetpass()
                          )
                        );
                      },
                      child: Text("Esqueci minha senha"),
                       
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                       
                    ),
                  ),
                ),
              ),
              
              Container(
                margin: const EdgeInsets.only(top: 13.0),
                child: Padding(
                  padding: EdgeInsets.only(left: 23, right: 23),
                  child: Container(
                    child:FlatButton(
                      onPressed: () async {
                        var f = await Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Cadastro()
                        ));
                        if(f == '_verificarUsuarioLogado')_verificarUsuarioLogado();
                      },
                      child: Text("Não tem conta? Cadastre-se"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23),
                      ),
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                      color: Color(0xffeeeeee),
                    ),
                  ),
                ),
              ),
            
            ],
          ),
        ) 
        
      )
    );
  }
}