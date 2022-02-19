import 'dart:convert';

import 'package:docinhosdocinhos/classes/ProdutoCombinamComVoce.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Pedido extends StatefulWidget {
  @override
  _PedidoState createState() => _PedidoState();
}



class _PedidoState extends State<Pedido> {
  List<ProdutoCombinamComVoce> listaProdutos = [];
  String _url = "http://192.168.0.111/0__TRASS/_CLIENTES_/DOCINHOSDOCINHOS/controle/api/mobile/";
  List<TextEditingController> _controllers = new List();

  _getProdutos() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String username = prefs.getString('username');

    String url = _url+"produtosservicos/produtosvenda";
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
          
          listaProdutos.add(produto);
        });
      }
    }
  }
   
  _gettotalprice() {
    print(_controllers[0].text.toString());
  }
  @override
  void initState() {
    super.initState();

    _getProdutos();
  }
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seu pedido"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 12,right: 12),
                        width: MediaQuery.of(context).size.width - 180,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Produto"),
                          ],
                        ),
                      ),
                      Container( 
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(),
                        child: Text("Qtd"),
                        width: 70,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(7),),
            Container(
              decoration: BoxDecoration(
                color: Color(0xffdedede),
              ),
              width: MediaQuery.of(context).size.width,
              height: 2,
            ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: listaProdutos.length,
                itemBuilder: (BuildContext context, int index) {
                  _controllers.add(new TextEditingController());
                  ProdutoCombinamComVoce produto = listaProdutos[index];
                  return Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 12),
                              child: Image.network(
                                produto.foto.toString(),
                                fit: BoxFit.cover,
                              ),
                              height: 80,
                              width: 100,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 12,right: 12),
                              width: MediaQuery.of(context).size.width - 180,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(produto.titulo.toString()),
                                  Text(produto.valor.toString(),style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ),
                            Container( 
                              padding: EdgeInsets.only(right: 12),
                              child: TextField(
                                onEditingComplete: _gettotalprice,
                                controller: _controllers[index],
                                textAlignVertical: TextAlignVertical.center,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "0",                         
                                ),
                              ),
                              width: 70,
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              Container(
                padding: EdgeInsets.only(top: 54,right: 23),
                alignment: Alignment.bottomRight,
                child: Text("Valor Total: R\$ 123,32"),
              )
            ],
          )
        )
      )
    );
  }
}