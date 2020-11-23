import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:gestao_projetos/HomePage.dart';
import 'package:gestao_projetos/tools/configs.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

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

  bool _loginng = false;
  TextEditingController _controllerEmailLogin = TextEditingController();
  TextEditingController _controllerSenhaLogin = TextEditingController();
  
  void _fazerLogin() async {
    setState(() {_loginng = true;});
    String _emailLogin = _controllerEmailLogin.text;
    String _senhaLogin = _controllerSenhaLogin.text;
    var _urla = new GeneralConfigs();
    var _url = _urla.url_.toString()+"login";
     
    if(_emailLogin != null && _senhaLogin != null && _emailLogin != '' && _senhaLogin != ''){
      http.Response response = await http.post(
        _url,
        headers: {"Content-type" : "application/json; charset=UTF-8"},
        body: json.encode({
          "email" : _emailLogin,
          "senha" : _senhaLogin,
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
          if(corporesposta["status"] == "usernotfound"){
            showDialog(context: context,
              builder: (context){
                return AlertDialog(
                  title:Text("Erro"),
                  content: Text("Usuário e/ou senha incorretos."),
                  actions : <Widget>[
                      FlatButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context);
                        }
                      ),
                      FlatButton(
                        child: Text("Criar conta"),
                        onPressed: () {Navigator.popAndPushNamed(context, '/createuser');}
                      ),
                  ]
                  );
            });
          }
          else if(corporesposta["status"] == "userinactived"){
            showDialog(context: context,
              builder: (context){
                return AlertDialog(
                  title:Text("Erro ao fazer login"),
                  content: Text(corporesposta["message"]),
                  actions : <Widget>[
                      FlatButton(
                        child: Text("OK"),
                        onPressed: () {Navigator.pop(context);}
                      ),
                      FlatButton(
                        child: Text("Recuperar Senha"),
                        onPressed: () {Navigator.popAndPushNamed(context, '/forgetpass');}
                      ),
                  ]
                  );
            });
          }
          else _alert("Erro ao fazer login",corporesposta["message"]);
        }
        setState(() {_loginng = false;});
      }
      else{
        _alert("Erro inesperado: "+response.statusCode.toString(),"Usuário e/ou senha incorretos");
        setState(() {_loginng = false;});
      }
      
    }
    else{
      setState(() {_loginng = false;});
      _alert("Erro ao logar","Preencha corretamente os campos.");
    }
  }

  bool isLoggedIn = false;
  
  @override
  void initState() {
    super.initState(); 
    autoLogIn();
  }

  void _salvarPreferenciaLogado() async {
    print("salvando preferencias...");
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("logado", true);
  }
  
  bool _buscandodadosiniciais = true;
  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isLoggedIn = prefs.getBool('logado');

    if (isLoggedIn != null) {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context)=>HomePage() ),
          (Route<dynamic> route) => false
        );
      });
      return;
    }
    else{
      setState(() {_buscandodadosiniciais = false;});
    }

  }
  @override
  Widget build(BuildContext context) {
    
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    FlutterStatusbarcolor.setStatusBarColor(Color(0xff2e49ad));
    // FlutterStatusbarcolor.setNavigationBarColor(Colors.blue); 

    return Scaffold(
      body: _buscandodadosiniciais ? Container(child: Text("buscando informações iniciais"),) : Container( 
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
                  padding: const EdgeInsets.only(left:12,right:12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Container(child:Text('Seja bem vindo!',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),)),]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:12,right:12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Container(child:Text('Login',style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),)),]
                  )
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
                        onTap: (){Navigator.pushNamed(context, '/forgetpass');},
                        child: Text.rich(                        
                          TextSpan(
                            text: 'Esqueceu a senha?',
                            style: TextStyle(
                              color: Color(0xffEE7B23)
                            ),
                          ),
                        )
                      ),
                      _loginng ? Container(child: Text("Aguarde..."),) : RaisedButton.icon(
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
                  onTap: (){Navigator.pushNamed(context, '/createuser'); },
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