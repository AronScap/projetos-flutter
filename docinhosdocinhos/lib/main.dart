import 'package:docinhosdocinhos/Login.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(    
    home: Login(),
    theme: ThemeData(
      primaryColor: Color(0xffe85e92)
    ),
    debugShowCheckedModeBanner: false,
  ));
}