import 'package:cartabaumlanus/UI/Screens/cervezaspage.dart';
import 'package:cartabaumlanus/UI/Screens/fullscreenimage.dart';
import 'package:cartabaumlanus/UI/Screens/novedadespage.dart';
import 'package:cartabaumlanus/UI/Screens/promospage.dart';
import 'package:cartabaumlanus/UI/Screens/tiendapage.dart';
import 'package:flutter/material.dart';
import 'package:cartabaumlanus/UI/Screens/descriptionpage.dart';
import 'package:cartabaumlanus/UI/Screens/homepage.dart';


Map<String, WidgetBuilder> getApplicationsRoutes()
{
  return <String, WidgetBuilder>
  {
    "menu" : (BuildContext context) => HomePage(), 
    "Promos":(BuildContext context) => Promospage(),
    "lista" : (BuildContext context) => Description(),
    "detailsimage":(BuildContext context) => FullScreenImage(),
    "Cervezas":(BuildContext context) => Cervezaspage(),
    "Novedades":(BuildContext context)=> NovedadesPage(),
    "Tienda":(BuildContext context) => Tiendapage(),
  };
}