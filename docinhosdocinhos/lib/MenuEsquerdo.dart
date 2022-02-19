import 'package:docinhosdocinhos/Parceiros.dart';
import 'package:docinhosdocinhos/Sobre.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuEsquerdo extends StatefulWidget {
  @override
  _MenuEsquerdoState createState() => _MenuEsquerdoState();
}

class _MenuEsquerdoState extends State<MenuEsquerdo> {
  _sairDoSistema() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', null);
    prefs.setString('token', null);

    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container(
                child: Image.asset('assets/images/logo.png'),
              ),
              decoration: BoxDecoration(
                color: Color(0xffe85e92),
              ),
            ),
            FlatButton(
              onPressed: () => {Navigator.pop(context)}, 
              padding: EdgeInsets.only(bottom: 12, top:12.0,left: 22),
              child: Row( // Replace with a Row for horizontal icon + text
                children: <Widget>[
                  Icon(Icons.home),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child:Text("Página Inicial")
                  )
                ],
              ),
            ),
            FlatButton(
              onPressed: () => {}, 
              padding: EdgeInsets.only(bottom: 12, top:12.0,left: 22),
              child: Row( // Replace with a Row for horizontal icon + text
                children: <Widget>[
                  Icon(Icons.person),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child:Text("Meu perfil")
                  )
                ],
              ),
            ),
            FlatButton(
              onPressed: () => {}, 
              padding: EdgeInsets.only(bottom: 12, top:12.0,left: 22),
              child: Row( // Replace with a Row for horizontal icon + text
                children: <Widget>[
                  Icon(Icons.shopping_cart),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child:Text("Faça seu pedido")
                  )
                ],
              ),
            ),
            FlatButton(
              onPressed: () => {}, 
              padding: EdgeInsets.only(bottom: 12, top:12.0,left: 22),
              child: Row( // Replace with a Row for horizontal icon + text
                children: <Widget>[
                  Icon(Icons.local_activity),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child:Text("Sorteios")
                  )
                ],
              ),
            ),
            FlatButton(
              onPressed: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Parceiros()))
              }, 
              padding: EdgeInsets.only(bottom: 12, top:12.0,left: 22),
              child: Row( // Replace with a Row for horizontal icon + text
                children: <Widget>[
                  Icon(Icons.star_border),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child:Text("Parceiros")
                  )
                ],
              ),
            ),
            FlatButton(
              onPressed: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Sobre()))
              }, 
              padding: EdgeInsets.only(bottom: 12, top:12.0,left: 22),
              child: Row( // Replace with a Row for horizontal icon + text
                children: <Widget>[
                  Icon(Icons.info_outline),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child:Text("Sobre")
                  )
                ],
              ),
            ),
            FlatButton(
              onPressed: () => {
                Navigator.pop(context),
                _sairDoSistema()
              }, 
              padding: EdgeInsets.only(bottom: 12, top:12.0,left: 22),
              child: Row( // Replace with a Row for horizontal icon + text
                children: <Widget>[
                  Icon(Icons.exit_to_app),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child:Text("Sair")
                  )
                ],
              ),
            ),
          ],
        ),
      );
  }
}