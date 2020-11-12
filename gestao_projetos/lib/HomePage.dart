import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


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
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.content_paste_outlined),
              title: Text('Meus Projetos'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sair'),
              onTap: () {
                Navigator.pop(context);
              },
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
