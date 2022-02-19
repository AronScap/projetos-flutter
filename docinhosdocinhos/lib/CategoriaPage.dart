import 'package:flutter/material.dart';

class CategoriaPage extends StatefulWidget {
  final String categoria;
  CategoriaPage({Key key, this.categoria}) : super(key : key);

  @override
  _CategoriaPageState createState() => _CategoriaPageState();

}

class _CategoriaPageState extends State<CategoriaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoria),
      ),
      body: Container(
        
      )
    );
  }
}