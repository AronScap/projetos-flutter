import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:gestao_projetos/CadastroPage.dart';
import 'package:gestao_projetos/EsqueciSenha.dart';
import 'package:gestao_projetos/HomePage.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context)=>HomePage() ),
                            (Route<dynamic> route) => false
                          );
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