import 'package:flutter/material.dart';

class Sobre extends StatefulWidget {
  @override
  _SobreState createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre"),
        backgroundColor: Color(0xffe85e92),
      ),
      body: Container(
        child: Text("Sobre"),
      ),
    );

  }
}