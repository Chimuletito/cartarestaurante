import 'package:flutter/material.dart';
import 'package:cartabaumlanus/Model/comida.dart';


class Tiendacard extends StatelessWidget 
{
  final Comida comida;

  Tiendacard({Key key, this.comida}); 
  @override
  Widget build(BuildContext context) 
  {
    return Row
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
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
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
                  width: (MediaQuery.of(context).size.width>1000 ? MediaQuery.of(context).size.width/2.2 :MediaQuery.of(context).size.width  * 0.8)/1.75,
                  image: NetworkImage(comida.image),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Container
          (
            margin: EdgeInsets.only(left:5),
            width: (MediaQuery.of(context).size.width>1000 ? MediaQuery.of(context).size.width/2.2 :MediaQuery.of(context).size.width  * 0.8),
            child:Column
            (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: 
              [       
                SizedBox(height: 45),  
                Text(comida.nombre,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                Text("\$"+comida.precio.toString()),               
                SizedBox(height: 5),
                Text(comida.descripcion)      
              ],
            )
          ),
       ],
    );
  }
}