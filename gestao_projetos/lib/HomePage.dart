import 'package:flutter/material.dart';
import 'package:gestao_projetos/LoginPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  void _updateitems (int oldIndex,int  newIndex){
    setState(() {
      if(newIndex > oldIndex)newIndex-=1;
      var x = items.removeAt(oldIndex);
      items.insert(newIndex,x);
    });
  }
  List items = [];

  void _getlista() async {
    
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
  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isLoggedIn = prefs.getBool('logado');

    if (isLoggedIn == null) {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context)=>LoginPage() ),
          (Route<dynamic> route) => false
        );
      });
      return;
    }

  }

  
  void _delPreferenciaLogado() async {
    print("Excluindo preferencias...");
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('logado');
  }
  void _logOut(){
    _delPreferenciaLogado();
    setState(() {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context)=>LoginPage() ),
        (Route<dynamic> route) => false
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus Projetos"),
        backgroundColor: Color(0xff391ccb),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 160.0, 
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xff391ccb),
                ),
                child: Row(                
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Gestão de Projetos Pessoais",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top:32),
                            child:Text(
                              'Aron Scapinello Selhorst',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            )
                          ),
                          Container(child:Text(
                            'aronscapinello@gmail.com',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Perfil'),
              onTap: () {Navigator.pushNamed(context, '/profile');},
            ),
            ListTile(
              leading: Icon(Icons.content_paste_outlined),
              title: Text('Meus Projetos'),
              onTap: () {
                Navigator.pop(context);
                // setState(() {
                //   Navigator.of(context).pushAndRemoveUntil(
                //     MaterialPageRoute(builder: (context)=>LoginPage() ),
                //     (Route<dynamic> route) => false
                //   );
                // }); 
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
              onTap: () {Navigator.pushNamed(context, '/settings');},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sair'),
              onTap: () {_logOut();},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return showDialog(context: context, child:
            AlertDialog(
              title: Text("Insira o nome do seu projeto."),
              content: TextField(
                decoration: InputDecoration(
                  labelText: "Nome do projeto:",
                ),
                onChanged: (text){
                  print(text);
                },
              ),
              actions: [
                FlatButton(
                  onPressed: (){Navigator.pop(context);},
                  child: Text("Cancelar")
                ),
                FlatButton(
                  onPressed: (){
                    
                  },
                  child: Text("Salvar")
                )
              ],
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10,right: 10),
        child: items.length > 0 ? ReorderableListView(
          children: items.map((index){
            return Card(
              key: ObjectKey(index),
              child: ListTile(
                key: ObjectKey(index),
                leading: Icon(Icons.content_paste),
                title: Text('One-line with leading widget'),
                subtitle: Text("Projeto ${index}"),
                trailing: Icon(Icons.electric_moped_sharp),
              )
            );
          }).toList(),
          onReorder: _updateitems,
        ) : Container(
          padding: EdgeInsets.only(top: 20),
          child:Center( 
            child: Text(
              "Nenhum projeto criado ainda!",
              textAlign: TextAlign.center,
            )
          )
        ),
      ),
    );
  }
}
