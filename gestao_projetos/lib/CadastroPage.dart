import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
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
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Cadastre-se',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
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
                SizedBox(height:10.0),
                RaisedButton.icon(
                  onPressed: () { Navigator.pop(context); },
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