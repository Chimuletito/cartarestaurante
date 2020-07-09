import 'package:flutter/material.dart';
import 'package:cartabaumlanus/Model/comida.dart';


class Comidacard extends StatelessWidget 
{
  final Comida comida;

  Comidacard({Key key, this.comida}); 
  @override
  Widget build(BuildContext context) 
  {
    var size=MediaQuery.of(context).size;
    double widthscreen=size.width;
    bool bigscreen=widthscreen>1000;

    return Container
    (
      child: Column
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
                  width: bigscreen ? widthscreen / 2.20 : widthscreen  * 0.8,
                  image: NetworkImage(comida.image),
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Container
            (
              width:  bigscreen ? widthscreen / 2.20 : widthscreen  * 0.8,
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
                     Spacer(),
                     Text("\$"+comida.precio.toString()),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(comida.descripcion)      
                ],
              )
            ),
            SizedBox(height: bigscreen ? 60 : 0),
         ],
      ),
    );
  }
}