import 'package:flutter/material.dart';
import 'package:gestao_projetos/LoginPage.dart';
import 'package:gestao_projetos/tools/Projeto.dart';
import 'package:gestao_projetos/tools/configs.dart';
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
      var x = _projetos.removeAt(oldIndex);
      _projetos.insert(newIndex,x);
    });
  }
  

  var present = 0;
  var perPage = 15;
  var _nomeusario = "";
  var _emailusuario = "";
  var _firstaccess = false;


  List<Projeto> _projetos = [
    Projeto("01 1"),
    Projeto("02Projeto 2"),
    Projeto("03Projeto teste"),
    Projeto("04Projeto teste2"),
    Projeto("05Projeto 1"),
    Projeto("06Projeto 2"),
    Projeto("07Projeto teste"),
    Projeto("08Projeto teste2"),
    Projeto("09Projeto 1"),
    Projeto("010Projeto 2"),
    Projeto("011Projeto teste"),
    Projeto("012Projeto teste2"),
    Projeto("013Projeto 1"),
    Projeto("014Projeto 2"),
    Projeto("015Projeto teste"),
  ];
  Future<Map> _getlista() async {
    var _urla = new GeneralConfigs();
    var _url = _urla.url_.toString() + "getprojects";
    http.Response response = await http.get(_url,headers: {"Content-type" : "application/json; charset=UTF-8"} );
    print(response.body);
    return json.decode(response.body);
  }
  void _getmoreprojetos(){    
    print("More Projects...");
    setState(() {
        _projetos.addAll(
          [
            Projeto("1 1"),
            Projeto("2Projeto 2"),
            Projeto("3Projeto teste"),
            Projeto("4Projeto teste2"),
            Projeto("5Projeto 1"),
            Projeto("6Projeto 2"),
            Projeto("7Projeto teste"),
            Projeto("8Projeto teste2"),
            Projeto("9Projeto 1"),
            Projeto("10Projeto 2"),
            Projeto("11Projeto teste"),
            Projeto("12Projeto teste2"),
            Projeto("13Projeto 1"),
            Projeto("14Projeto 2"),
            Projeto("15Projeto teste"),
          ]
        );  
    });
    
  }
  bool isLoggedIn = false;
  @override
  void initState() {
    super.initState(); 
    autoLogIn();
    // _getlista();
  }
  // void _salvarPreferenciaLogado() async {
  //   print("salvando preferencias...");
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setBool("logado", true);
  // }
  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isLoggedIn = prefs.getBool('logado');
    final String _tokenuserlogado = prefs.getString('tokenuserlogado');
    print("auto login home...");

    var _urla = new GeneralConfigs();
    var _url = _urla.url_.toString() + "getinfosuser";
    http.Response response = await http.post(_url,headers: {"Content-type" : "application/json; charset=UTF-8"},body: json.encode({"token" : _tokenuserlogado.toString() }));
    Map<String,dynamic> corporesposta = json.decode( response.body );
    print(corporesposta);
    if(response.statusCode.toString() == '200'){
      if(corporesposta["status"] == "ok"){
        setState(() {
          _nomeusario = corporesposta["nomecompleto"];
          _emailusuario = corporesposta["email"];
          _firstaccess = corporesposta["firstaccessuser"];
          prefs.setBool('logado', true);
          prefs.setString('tokenuserlogado', corporesposta["novotoken"]);
        });
      }
      else _alert("Erro ao cadastrar informações do usuário",corporesposta["message"]);
    }
    else _alert("Erro inesperado: "+response.statusCode.toString(),"Não foi possível carregar informações do usuário");    
    

    if (isLoggedIn == null) {
      setState(() {Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>LoginPage() ),(Route<dynamic> route) => false);});
      return;
    }
  }

  var _newprojectspin = false;
  TextEditingController _controllertituloprojeto = TextEditingController();
  void _newProject() async {
    setState(() {_newprojectspin = true;});
    String _titulo = _controllertituloprojeto.text;
    var _urla = new GeneralConfigs();
    var _url = _urla.url_.toString() + "newproject";
    if(_titulo != null && _titulo != ''){
      http.Response response = await http.post(
        _url,
        headers: {"Content-type" : "application/json; charset=UTF-8"},
        body: json.encode({"nome" : _titulo})
      );
      Map<String,dynamic> corporesposta = json.decode( response.body );
      if(response.statusCode.toString() == '200'){
        if(corporesposta["status"] == "ok"){
          print("Projeto cadastrado");
        }
        else _alert("Erro ao cadastrar projeto",corporesposta["message"]);
        setState(() {_newprojectspin = false;});
      }
      else{
        _alert("Erro inesperado: "+response.statusCode.toString(),"Não foi possível cadastrar projeto");
        setState(() {_newprojectspin = false;});
      }      
    }
    else{
      setState(() {_newprojectspin = false;});
      _alert("Erro ao cadastrar projeto","Preencha corretamente os campos.");
    }
  }
  void _alert(var _title, var _text){
    showDialog(context: context,
      builder: (context){
        return AlertDialog(
          title:Text(_title),
          content: Text(_text),
          actions : <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {Navigator.pop(context);}
              )
          ]
          );
    });
  }
  
  void _delPreferenciaLogado() async {
    print("Excluindo preferencias...");
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('logado');
    prefs.remove('tokenuserlogado');
  }
  void _logOut(){
    _delPreferenciaLogado();
    setState(() {Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>LoginPage() ),(Route<dynamic> route) => false);});
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus Projetos"),
        backgroundColor: Color(0xff391ccb),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.help,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
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
                            "MGP - Minha Gestão Pessoal",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top:32),
                            child:Text(
                              _nomeusario,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            )
                          ),
                          Container(child:Text(
                            _emailusuario,
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
              onTap: () {Navigator.pushNamed(context, '/home');},
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
                decoration: InputDecoration(labelText: "Nome do projeto:",),
                controller: _controllertituloprojeto,
              ),
              actions: [
                _newprojectspin ? Container() : FlatButton(
                  onPressed: (){Navigator.pop(context);},
                  child: Text("Cancelar")
                ),
                _newprojectspin ? Container(child:Text("Aguarde...")) : FlatButton(
                  onPressed: (){_newProject();},
                  child: Text("Salvar")
                )
              ],
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        child: Column(
          children: [
            _firstaccess ? Container(
              child: Center(child:Text("Olá, seja bem vindo!")),
            ) : Container(),
            Expanded(
              child:   FutureBuilder<Map>(
                future: _getlista(),
                builder: (context,snapshot){
                  String result;
                  switch( snapshot.connectionState ){
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      result = "0";
                      break;
                    case ConnectionState.active:
                    case ConnectionState.done:
                      if(snapshot.hasError)result = "1";
                      else{
                        print(snapshot.data);
                        result = "Resultado: "+snapshot.data["titulo"];
                      }
                      break;
                  }
                  // if(result == "0") return Center(child:CircularProgressIndicator() );
                  // else if(result == "1") return Center(child:Text("Erro ao carregar projetos! Tente novamente mais tarde!"));
                  // else 
                  return NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) { 
                        _getmoreprojetos();
                        print("Carregando...");
                      }
                    },
                    child:RefreshIndicator(
                      onRefresh: (){return _getlista();},
                      child:Padding(
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: _projetos.length > 0 ? ReorderableListView(
                          children: _projetos.map((index){
                            return Card(
                              key: ObjectKey(index),
                              child: ListTile(
                                key: ObjectKey(index),
                                leading: Icon(Icons.content_paste),
                                title: Text('${index.titulo.toString()}'),
                                subtitle: Text("Projeto ${index.hashCode.toString()}"),
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
                      )
                    )
                  );
                }
              )
            )
          ],
        ),
      )
    );
  }
}
