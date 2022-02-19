import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:http/http.dart' as http;

class Produto extends StatefulWidget {
  final String produtoID;
  Produto({Key key, this.produtoID}): super(key: key);

  @override
  _ProdutoState createState() => _ProdutoState();

}

class _ProdutoState extends State<Produto> {

  // ProdutoCompleto _produto;
  String _url = "http://192.168.0.111/0__TRASS/_CLIENTES_/DOCINHOSDOCINHOS/controle/api/mobile/";
  
  String _nomedoproduto = ""; 
  String _descricaoproduto = "";
  String _tempromocao = "";
  String _valordeproduto = "";
  String _valorparaproduto = "";
  String _precoproduto = "";
  String _expiracaoproduto = "";
  String _percentualpromocao = "";
  var listimages = [NetworkImage("")]; 



  _getCombinamcomvoce() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String username = prefs.getString('username');

    String url = _url+"produtosservicos/produto/" + widget.produtoID;
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
    if(success){ 
      for(var product in retorno['dados'] ){
 
        setState(() {
          _nomedoproduto = product["titulo"].toString();
          listimages.removeAt(0);
          for (var foto in product["fotos"]) {
            print(foto["foto"].toString());
            if(foto["foto"] != null)listimages.add(NetworkImage(foto["foto"].toString()));
          }
          
          _descricaoproduto = product["description"].toString();
          _tempromocao = product["tempromocao"].toString();
          _valordeproduto = product["valorde"].toString();
          _valorparaproduto = product["valorpara"].toString();
          _precoproduto = product["valor"].toString();
          _expiracaoproduto = product["datavalidade"].toString();
          _percentualpromocao = product["percentualpromocao"].toString();
        });
      }
    }
  }



  
  @override
  void initState() {
    super.initState();

    _getCombinamcomvoce();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    setState(() {
      listimages = [NetworkImage("")]; 
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(_nomedoproduto),),
      body: SingleChildScrollView(
        child: Column(
          
          children: <Widget>[
            SizedBox(
              height: 350.0,
              width: MediaQuery.of(context).size.width,
              child: Carousel(
                images: listimages,
                dotSize: 4,
                dotSpacing: 10,
                dotBgColor: Colors.transparent,
                boxFit: BoxFit.cover,
                autoplayDuration: Duration(seconds: 15),
              )
            ),
 
            
            Container(
              padding: EdgeInsets.all(26),
              alignment: Alignment.topLeft,
              child: Text(
                _nomedoproduto,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17
                ),
              )
            ),

            Container(
              padding: EdgeInsets.only(left:26,right: 26,bottom: 26),
              alignment: Alignment.topLeft,
              child: Text(
                _descricaoproduto,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey
                ),
              )
            ),

            
            _tempromocao == '0' ? Container(
              padding: EdgeInsets.all(26),
              alignment: Alignment.topLeft,
              child: Row(
                children: <Widget>[
                  Text(
                    "Valor: ",
                    style: TextStyle( 
                      fontSize: 15.7
                    ),
                  ),

                  Text(
                    _precoproduto,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.green
                    ),
                  ),
                ],
              )
            ) : 
            Container(
              padding: EdgeInsets.only(left:26,right: 26,bottom: 17),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.info_outline,
                          color: Colors.white,
                        ),
                        Text(
                          " Este produto está em promoção!",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        )
                      ],
                    ),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color(0xffDB7093),
                      borderRadius: BorderRadius.all(Radius.circular(7))
                    ),
                  ),
                  
                  Padding(padding: EdgeInsets.only(top: 17)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "Valor de: ",
                                style: TextStyle( 
                                  fontSize: 14,
                                  decoration: TextDecoration.lineThrough
                                ),
                              ),
                              Text(
                                _valordeproduto,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.redAccent
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "Valor atual: ",
                                style: TextStyle( 
                                  fontSize: 14
                                ),
                              ),

                              Text(
                                _valorparaproduto,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.green
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Color(0xffDB7093),
                          borderRadius: BorderRadius.all(Radius.circular(7))
                        ),
                        child:Text(
                          _percentualpromocao+" Off",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      )
                    ],
                  ),

                  Padding(padding: EdgeInsets.only(top: 17)),
                  Container(
                    alignment: Alignment.center,
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Expira em: ",
                          style: TextStyle( 
                          ),
                        ),
                        Text(
                          _expiracaoproduto,
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color(0xffededed),
                      borderRadius: BorderRadius.all(Radius.circular(7))
                    ),
                  ),
                  
                   
                  
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}