import 'package:flutter/material.dart';
import 'package:cartabaumlanus/Model/comida.dart';


class Cervezacard extends StatelessWidget 
{
  final Comida comida;

  Cervezacard({Key key, this.comida}); 
  @override
  Widget build(BuildContext context) 
  {
    var size=MediaQuery.of(context).size;
    double widthscreen=size.width;
    bool bigscreen=widthscreen>1000;
    
    return Column
    (
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: 
      [
        GestureDetector
        (
          onTap: ()
          {
           Navigator.pushNamed(context,"detailsimage",arguments: comida);
          },
          child: ClipRRect
          (
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Hero
            (
              tag: comida.nombre,
              child: FadeInImage
              (
                placeholder: AssetImage("assets/gifs/loading.gif"),
                fit: BoxFit.fitWidth,
                width: bigscreen ? widthscreen/2.25 : widthscreen  * 0.8,
                image: NetworkImage(comida.image),
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Container
          (
            width: bigscreen ? widthscreen/2.25 : widthscreen  * 0.8,
            child:Column
            (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: 
              [
                Text(comida.nombre,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                SizedBox(height: 5),
                Text(comida.descripcion),    
                SizedBox(height: 5),  
                Text(comida.precio.toString()),
              ],
            )
          ),
          SizedBox(height: bigscreen ? 60 : 0),
       ],
    );
  }
}