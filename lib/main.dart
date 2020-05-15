import 'package:first/models/datamodel.dart';
import 'package:flutter/material.dart';
import './HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expances",
        
      theme: ThemeData(
        fontFamily: 'Roboto',
        // primarySwatch: colorCustom,
        primaryColor: Color(0xff4b28ec),
        accentColor: Color(0xff4b28ec),
        textTheme: TextTheme(
          title: TextStyle(color: Colors.white)
        ),
      ),
      home: HomePage(),
    );
  }
}


