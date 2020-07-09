import 'package:flutter/material.dart';
import 'package:cartabaumlanus/Model/Novedad.dart';

class Novedadescard extends StatelessWidget 
{

  final Novedad novedad;

  const Novedadescard({Key key, this.novedad}) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    bool bigscreen=MediaQuery.of(context).size.width>1000;

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
           Navigator.pushNamed(context,"detailsimage",arguments: novedad);
          },
          child: ClipRRect
          (
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Hero
            (
              tag: novedad.titulo,
              child: FadeInImage
              (
                placeholder: AssetImage("assets/gifs/loading.gif"),
                fit: BoxFit.fitWidth,
                width: bigscreen ? MediaQuery.of(context).size.width/2.2 :MediaQuery.of(context).size.width  * 0.8,
                image: NetworkImage(novedad.image),
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Container
          (
            width: bigscreen ? MediaQuery.of(context).size.width/2.2 :MediaQuery.of(context).size.width  * 0.8,
            child:Column
            (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: 
              [
               Text(novedad.fecha),
               Row
               (
                 children: 
                 [
                   Text(novedad.titulo,style: TextStyle(fontWeight: FontWeight.bold)),Spacer(),Text(novedad.precio)
                 ],
               ),
               Text(novedad.descripcion)
              ],
            )
          ),
       ],
    );
  }
}