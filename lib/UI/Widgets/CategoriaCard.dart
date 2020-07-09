import 'package:flutter/material.dart';
import 'package:cartabaumlanus/Model/Categoria.dart';


class CategoriaCard extends StatelessWidget 
{
  final Categoria categoriaMenu;

  CategoriaCard(this.categoriaMenu);

  @override
  Widget build(BuildContext context) 
  {
    return GestureDetector
    (
      onTap:()
      {
        if(categoriaMenu.name=="Tienda")
        {
          Navigator.pushNamed(context,"Tienda",arguments: categoriaMenu);
        }
        if(categoriaMenu.name=="Cervezas")
        {
          Navigator.pushNamed(context,"Cervezas",arguments: categoriaMenu);
        }
        if(categoriaMenu.name=="Novedades")
        {
          Navigator.pushNamed(context,"Novedades",arguments: categoriaMenu);
        }
        if(categoriaMenu.name!="Cervezas" && categoriaMenu.name !="Novedades" && categoriaMenu.name != "Tienda")
        {
          Navigator.pushNamed(context,"lista",arguments: categoriaMenu);
        }
        
      },
      child:Stack
      (
        children: 
        [
          Hero
          (
            tag: categoriaMenu.imagePath,
            child:Card(filepath: categoriaMenu.imagePath)
          ),
          Positioned
          (
            child:Text(categoriaMenu.name,style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold)),
            bottom: 20,
            left: 20,
          ) 
        ],
      )
    );   
  }
}

class Card extends StatelessWidget 
{
  Card({Key key,@required this.filepath,});

  final String filepath;

  @override
  Widget build(BuildContext context) 
  {
    var size=MediaQuery.of(context).size;
    double heightscreen=size.height;
    double widthscreen=size.width;

    bool bigscreen=widthscreen>1000;

    return Column
    (
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: 
      [
        Container
        (
          padding:EdgeInsets.fromLTRB(10, 0, 10, 0),
          margin: EdgeInsets.all(5),
          child: ClipRRect 
          (
            borderRadius: BorderRadius.circular(20),
            child:FadeInImage
              (
                placeholder:AssetImage("assets/gifs/loading.gif"),
                fit: BoxFit.cover,
                width:  bigscreen ? widthscreen/2.25 : widthscreen*0.75, //550 -widthscreen/3.49,
                height:  bigscreen ? heightscreen/3.876: heightscreen*0.20,//250
                image: AssetImage(filepath),
              )
          ),
        ),
      ],
    );
  }
}