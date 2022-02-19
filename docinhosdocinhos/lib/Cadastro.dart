import 'dart:convert';
import 'package:docinhosdocinhos/Home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

  TextEditingController _controllerNomecompleto = TextEditingController();
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

  _realizarCadastro() async {
    
    String emailusuario = _controllerEmail.text;
    String senha = _controllerNovasenha.text;
    String nomeCompleto = _controllerNomecompleto.text;
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String url = "http://192.168.0.110/0__TRASS/_CLIENTES_/DOCINHOSDOCINHOS/api/mobile/auth/cadastro";
    http.Response response;
    response = await http.post(
      url,
      headers: {
        "Content-type" : "application/json; charset=UTF-8"
      },
      body: json.encode(
        {
          "emailusuario"  : emailusuario,
          "nomeCompleto"  : nomeCompleto,
          "senha"         : senha
        }
      )
    );


    Map<String, dynamic> retorno = json.decode( response.body );
    bool success = retorno['success'];
    if(success){
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('username', emailusuario);
 
      _controllerEmail.text = "";
      _controllerNomecompleto.text = "";
      _controllerNovasenha.text = "";

      setState(() {_carregando = false;});
      Navigator.pop(context, '_verificarUsuarioLogado');
    }
    else{
      String message = retorno['message'].toString();
      _errorFormulario(message);
    }
  }

  void _cadatrarUsuario(){
    setState(() {_carregando = true;});
    String nomeCompleto = _controllerNomecompleto.text;
    String emailNovo = _controllerEmail.text;
    String novaSenha = _controllerNovasenha.text;
    if(nomeCompleto == null || nomeCompleto.length == 0 || !nomeCompleto.contains(' ')){
      _errorFormulario("Preencha o seu Nome Completo corretamente");
      return;
    }
    if(emailNovo == null || emailNovo.length == 0 || !emailNovo.contains('@')){
      _errorFormulario("Preencha o seu E-mail corretamente");
      return;
    }
    if(novaSenha == null || novaSenha.length == 0 || novaSenha.length > 6 || novaSenha.length < 6){
      _errorFormulario("Preencha a sua Nova Senha corretamente. Deve conter 6 caracteres!");
      return;
    }
    
    _realizarCadastro();
  }

  @override
  Widget build(BuildContext context) {
    
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
                      controller: _controllerNomecompleto,
                      autofocus: false,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(30, 16, 30, 16),
                        hintText: "Nome Completo",
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
                          Icons.people,
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
                      controller: _controllerEmail,
                      autofocus: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(30, 16, 30, 16),
                        hintText: "E-mail",
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
                        hintText: "Nova Senha",
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
                      onPressed: (){_cadatrarUsuario();},
                      child: Text("Cadastrar",style: TextStyle(color: Colors.white),),
                      color: Color(0xffe85e92),
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23),
                      ),
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
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.arrow_back),
                          Text("Voltar ao Login")
                        ],
                      ),
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