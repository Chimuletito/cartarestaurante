import 'package:flutter/material.dart';
import 'package:cartabaumlanus/Model/comida.dart';

class FullScreenImage extends StatelessWidget 
{
  final Comida comida;

  FullScreenImage({Key key,this.comida}) ;

  @override
  Widget build(BuildContext context) 
  {
    Comida comida=ModalRoute.of(context).settings.arguments;

    return Scaffold
    (
      backgroundColor: Colors.black87,
      body: Hero
      (
        tag: comida.nombre,
        child: GestureDetector
        (
          child: Container
          (
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.network(comida.image),
          ),
          onTap: (){Navigator.pop(context);}
        ),
      ),
    );
  }
}