import 'package:flutter/material.dart';
import 'package:cartabaumlanus/Model/comida.dart';


class Promocard extends StatelessWidget 
{
  final Comida comida;

  Promocard({Key key, this.comida}); 
  @override
  Widget build(BuildContext context) 
  {
    return Container
    ( 
      child: Row
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
                    width: (MediaQuery.of(context).size.width>1000 ? (MediaQuery.of(context).size.width/2.2)*0.85 :(MediaQuery.of(context).size.width  * 0.8)/1.75)*0.85,
                    image: NetworkImage(comida.image),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 2),
          Container
          (
            width: (MediaQuery.of(context).size.width>1000 ? MediaQuery.of(context).size.width/2.2 :MediaQuery.of(context).size.width  * 0.8)/1.75,
            child: Column
            (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: 
              [   
                Text(comida.nombre,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                Text("\$"+comida.precio.toString()),               
                SizedBox(height: 5),
                Text(comida.descripcion,maxLines: 10)      
              ],
            ),
          ),
         ],
      ),
    );
  }
}