import 'dart:convert';

import 'package:docinhosdocinhos/CategoriaPage.dart';
import 'package:docinhosdocinhos/MenuEsquerdo.dart';
import 'package:docinhosdocinhos/Pedido.dart';
import 'package:docinhosdocinhos/Produto.dart';
import 'package:docinhosdocinhos/Sobre.dart';
import 'package:docinhosdocinhos/classes/ProdutoCombinamComVoce.dart';
import 'package:docinhosdocinhos/classes/ProdutoPromocao.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> itensMenu = ['Configurações','Sobre','Sair'];
  List<ProdutoCombinamComVoce> listaCombinamcomvoce = [];
  List<ProdutoPromocao> listaPromocao = [];
  List<String> categorias = [];
  String _url = "http://192.168.0.111/0__TRASS/_CLIENTES_/DOCINHOSDOCINHOS/controle/api/mobile/";

  _sairDoSistema() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', null);

    Navigator.pop(context);
  }

  _escolhaMenuItem (String escolha) {

    switch(escolha){
      case 'Sair':
        _sairDoSistema();
        break;
      
      case 'Sobre':
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => Sobre()

        ));
        break;
      
      case 'Configurações':
        
        break;
    }

  }

  _getCombinamcomvoce() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String username = prefs.getString('username');

    String url = _url+"produtosservicos/combinamcomvoce";
    http.Response response;
    response = await http.post(
      url,
      headers: {
        "Content-type" : "application/json; charset=UTF-8"
      },
      body: json.encode(
        {
          "usuarioemail" : username
        }
      )
    );

    Map<String, dynamic> retorno = json.decode( response.body );

    bool success = retorno['success'];
    String message = retorno['message'].toString();

    if(success){
      // print("RETORNO COMBINAM COM VOCE: " + response.body.toString());
      
      for(var product in retorno['dados'] ){

        ProdutoCombinamComVoce produto = ProdutoCombinamComVoce(
          product["titulo"].toString(), 
          product["valor"].toString(), 
          product["categoria"], 
          product["foto"].toString(),
          product["produtoID"].toString()
        );
        setState(() {
          listaCombinamcomvoce.add(produto);
        });
      }
    }
  }
   
  _getpromocoes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String username = prefs.getString('username');

    String url = _url+"produtosservicos/promocoes";
    http.Response response;
    response = await http.post(
      url,
      headers: {
        "Content-type" : "application/json; charset=UTF-8"
      },
      body: json.encode(
        {
          "usuarioemail" : username
        }
      )
    );

    Map<String, dynamic> retorno = json.decode( response.body );

    bool success = retorno['success'];
    String message = retorno['message'].toString();

      // print("RETORNO COMBINAM COM VOCE: " + response.body.toString());
    if(success){
      for(var product in retorno['dados'] ){
        ProdutoPromocao produto = ProdutoPromocao(
          product["titulo"].toString(), 
          product["valorde"].toString(), 
          product["valorpara"].toString(), 
          product["categoria"].toString(), 
          product["foto"].toString(),
          product["produtoID"].toString(),
          product["percentpromocao"].toString()
        );
        setState(() {          
          listaPromocao.add(produto);
        });
      }
    }
  }
   
  _getCategorias() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String username = prefs.getString('username');

    String url = _url+"produtosservicos/categorias";
    http.Response response;
    response = await http.post(
      url,
      headers: {
        "Content-type" : "application/json; charset=UTF-8"
      },
      body: json.encode(
        {
          "usuarioemail" : username
        }
      )
    );

    Map<String, dynamic> retorno = json.decode( response.body );

    bool success = retorno['success'];
    // String message = retorno['message'].toString();

    if(success){
      for(var product in retorno['dados'] ){
        setState(() {
          categorias.add(product["nome"].toString());
        });
      }
    }
  }
  
  @override
  void initState() {
    super.initState();

    _getCombinamcomvoce();
    _getCategorias();
    _getpromocoes();
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () { Scaffold.of(context).openDrawer(); },
                tooltip:  "Clique para abrir o menu", 
              );
            },
          ),

          automaticallyImplyLeading: false,
          backgroundColor: Color(0xffe85e92),
          actions: <Widget>[
            Icon(Icons.search),
            PopupMenuButton(
              onSelected: _escolhaMenuItem,
              itemBuilder: (context){
                return itensMenu.map((String item){
                  return PopupMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              /* Categorias */
              SizedBox(
                height: 120.0,
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categorias.length,
                  itemBuilder: (BuildContext context, int index) {

                    String categoria = categorias[index];

                    return GestureDetector(
                      onTap: () {
                        print('Clicked on URL by GestureDetector Widget');
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => CategoriaPage(categoria:categoria.toString())
                        )
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 6,right: 6),
                        child:
                          Container(
                            child:   Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Color(0xfffa6e79), Color(0xffdb4587)]
                                    ),
                                    borderRadius: BorderRadius.circular(12)
                                  ),
                                  height: 85,
                                  width: MediaQuery.of(context).size.width / 1.8,
                                  child: Center(
                                    child: AutoSizeText(
                                      categoria.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                    ),
    
                                  ),
                                ),
                                
                              ],
                            ),
                          ),
                      ),
                    );
                  } 
                ),
              ),
              
              Padding(padding: EdgeInsets.only(top: 20),),
              /* Promoções */
              Container(
                padding: EdgeInsets.only(left: 16,bottom: 6),
                alignment: Alignment.centerLeft,
                child:Text(
                  "Promoções",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(
                height: 350.0,
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: listaPromocao.length,
                  itemBuilder: (BuildContext context, int index) {
                    ProdutoPromocao produto = listaPromocao[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Produto(produtoID:produto.produtoID)
                        ));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 12),
                        child:
                          Container(
                            child: Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0) )
                                      ),
                                      child: Image.network(
                                        produto.foto.toString(),
                                        fit: BoxFit.cover,
                                      ),
                                      height: 195,
                                      width: MediaQuery.of(context).size.width / 1.5,
                                    ),
                                    
                                    Container(
                                      width: MediaQuery.of(context).size.width / 1.5,
                                      height: 155,
                                      padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: Color(0xffeeeeee),
                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.0), bottomRight: Radius.circular(12.0)),

                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(produto.categoria.toString(),
                                            style: TextStyle(
                                              fontSize: 13
                                            ),
                                          ),
                                          Padding(padding: EdgeInsets.only(top: 12),),
                                          AutoSizeText(
                                            produto.titulo.toString(),
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 2,
                                          ),

                                          Padding(padding: EdgeInsets.only(top: 17),),
                                          Text("De: "+produto.valorde.toString(),
                                            style: TextStyle(
                                              fontSize: 13.5,
                                              color: Colors.redAccent,
                                            ),
                                          ),
                                          Text("Por: "+produto.valorpara.toString(),
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.green
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                
                              ],
                            ),
                          ),
                      ),
                    );
                  }
                ),
              ),
                
              /* Faça seu pedido */
              Padding(
                padding: EdgeInsets.only(top: 24,bottom: 24,left: 12,right: 12),
                child: GestureDetector(
                  onTap: () {
                    print('Clicked on URL by GestureDetector Widget FAÇA SEU PEDIDO');
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Pedido()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Color(0xffdb4587), Color(0xfffa6e79)]
                      ),
                      borderRadius: new BorderRadius.only(
                        topLeft:  const  Radius.circular(12.0),
                        topRight: const  Radius.circular(12.0),
                        bottomLeft: const  Radius.circular(12.0),
                        bottomRight: const  Radius.circular(12.0),
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 16,bottom: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Faça seu pedido!',
                              style: TextStyle(
                                fontSize: 21.3,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 12),
                              child: Icon(Icons.shopping_cart,color: Colors.white,)
                            ),
                          ],
                        )
                          
                      ),
                    ),
                  ),
                ),
              ),

              /* Produtos */
              Container(
                padding: EdgeInsets.only(left: 16,bottom: 6),
                alignment: Alignment.centerLeft,
                child:Text(
                  "Combinam com você",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(
                height: 350.0,
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: listaCombinamcomvoce.length,
                  itemBuilder: (BuildContext context, int index) {
                    ProdutoCombinamComVoce produto = listaCombinamcomvoce[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Produto(produtoID:produto.produtoID)
                        ));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 12),
                        child:
                          Container(
                            child:   Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0) )
                                      ),
                                      child: Image.network(
                                        produto.foto.toString(),
                                        fit: BoxFit.cover,
                                      ),
                                      height: 195,
                                      width: MediaQuery.of(context).size.width / 1.5,
                                    ),
                                    
                                    Container(
                                      width: MediaQuery.of(context).size.width / 1.5,
                                      height: 135,
                                      padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: Color(0xffeeeeee),
                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.0), bottomRight: Radius.circular(12.0)),

                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(produto.categoria,
                                            style: TextStyle(
                                              fontSize: 13
                                            ),
                                          ),
                                          Padding(padding: EdgeInsets.only(top: 12),),
                                          AutoSizeText(
                                            produto.titulo,
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 2,
                                          ),
    
                                          Padding(padding: EdgeInsets.only(top: 12),),
                                          Text(produto.valor,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.green
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                
                              ],
                            ),
                          ),
                      ),
                    );
                  }
                ),
              ),
                

              /* redes sociais */
              Padding(padding: EdgeInsets.only(top: 20),),
              Container(
                padding: EdgeInsets.only(left: 16,bottom: 6),
                alignment: Alignment.centerLeft,
                child:Text(
                  "Siga nossas redes sociais",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: GestureDetector(
                              child: Image.network(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Instagram_logo_2016.svg/768px-Instagram_logo_2016.svg.png',
                                height: 45,  
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 12),
                            child: GestureDetector(
                              child: Text("@docinhosdocinhos"),
                              onTap: (){},
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: GestureDetector(
                              child: Image.network(
                                'http://1.bp.blogspot.com/-XiLOdfhlkWM/VQLP0EKDrVI/AAAAAAAAXwM/tvzCwhKdxw4/s1600/F_icon.svg.png',
                                height: 45,  
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 12),
                            child: GestureDetector(
                              child: Text("@docinhosdocinhoschapeco"),
                              onTap: (){},
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(top: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: GestureDetector(
                              child: Image.network(
                                'https://images.vexels.com/media/users/3/130187/isolated/preview/5e8d2205ecc8cde3235581fc5ecfa430-email-outline-icon-by-vexels.png',
                                height: 45,  
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 12),
                            child: GestureDetector(
                              child: Text("contato@docinhosdocinhos.com.br"),
                              onTap: (){},
                            ),
                          )
                        ],
                      ),
                    ),

                  ],
                )
              ),

            ],
          )
        ),
        drawer: MenuEsquerdo(),  
      )
    );
  }
}