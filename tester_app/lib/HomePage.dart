import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 100.0,),
          FlatButton(
            child: Text("VERMELHO",style: TextStyle(fontSize: 20.0, color: Colors.green),),
            onPressed: () {Navigator.pushNamed(context, '/teste_red');},
          ),
          FlatButton(
            child: Text("VERDE",style: TextStyle(fontSize: 20.0, color: Colors.green),),
            onPressed: () {Navigator.pushNamed(context, '/teste_green');},
          ),
          FlatButton(
            child: Text("AZUL",style: TextStyle(fontSize: 20.0, color: Colors.green),),
            onPressed: () {Navigator.pushNamed(context, '/teste_blue');},
          ),
          FlatButton(
            child: Text("PRETO",style: TextStyle(fontSize: 20.0, color: Colors.green),),
            onPressed: () {Navigator.pushNamed(context, '/teste_black');},
          ),
          FlatButton(
            child: Text("BRANCO",style: TextStyle(fontSize: 20.0, color: Colors.green),),
            onPressed: () {Navigator.pushNamed(context, '/teste_white');},
          ),

        ],
      )
    );
  }
}