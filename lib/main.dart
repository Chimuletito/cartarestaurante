import 'package:cartabaumlanus/UI/Screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:cartabaumlanus/Routes/routes.dart';

void main() 
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp
    (
      title: "Carta Baum Lanús",
      theme: ThemeData
      (
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: getApplicationsRoutes(),
      home: Scaffold
      (
        body: HomePage()
      )
    );
  }
}