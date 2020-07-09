import 'package:flutter/material.dart';
import 'package:cartabaumlanus/Model/comida.dart';


class Cervezacard extends StatelessWidget 
{
  final Comida comida;

  Cervezacard({Key key, this.comida}); 
  @override
  Widget build(BuildContext context) 
  {
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
                //height:bigscreen ? mqsize.height/2 :MediaQuery.of(context).size.height/5,
                width: MediaQuery.of(context).size.width>1000 ? MediaQuery.of(context).size.width/2.25 :MediaQuery.of(context).size.width  * 0.8,
                image: NetworkImage(comida.image),
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Container
          (
            width: MediaQuery.of(context).size.width>1000 ? MediaQuery.of(context).size.width/2.25 :MediaQuery.of(context).size.width  * 0.8,
            child:Column
            (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: 
              [
                Row
                (
                  children: 
                  [
                   Text(comida.nombre,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                
                  ],
                ),
                SizedBox(height: 5),
                Text(comida.descripcion),    
                SizedBox(height: 5),  
                Text(comida.precio.toString()),
              ],
            )
          ),
       ],
    );
  }
}