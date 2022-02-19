import 'package:flutter/material.dart';

class Forgetpass extends StatefulWidget {
  @override
  _ForgetpassState createState() => _ForgetpassState();
}

class _ForgetpassState extends State<Forgetpass> {


  TextEditingController _controllerEmail = TextEditingController(); 

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


  void _recuperarUsuario(){
    
    String emailNovo = _controllerEmail.text; 
   
    if(emailNovo == null || emailNovo.length == 0 || !emailNovo.contains('@')){
      _errorFormulario("Preencha o seu E-mail corretamente");
      return;
    }    
        
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
                      autofocus: false,
                      controller: _controllerEmail,
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
                margin: const EdgeInsets.only(top: 23.0),
                child: Padding(
                  padding: EdgeInsets.only(left: 23, right: 23),
                  child: Container(
                    child:FlatButton(
                      onPressed: () {
                        _recuperarUsuario();
                      },
                      child: Text("Recuperar Senha",style: TextStyle(color: Colors.white),),
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
                margin: const EdgeInsets.only(top: 37.0),
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