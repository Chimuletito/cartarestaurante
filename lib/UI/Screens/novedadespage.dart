import 'package:flutter/material.dart';
import 'package:cartabaumlanus/Model/Novedad.dart';
import 'package:cartabaumlanus/UI/Widgets/novedadescard.dart';
import 'package:cartabaumlanus/Firestore/FirestoreServices.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';



class NovedadesPage extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      backgroundColor: Color(0xFFFFFF),
      floatingActionButton: FloatingActionButton
      (
        child: Icon(FontAwesomeIcons.whatsapp),
        elevation: 1,
        onPressed: ()
        {
          launch("https://wa.me/5491138141940");
        },
        backgroundColor: Colors.green,
      ),
      body:Column
      (
        children: 
        [
          AppBarCustom
          (),
          SizedBox(height: 30),
          Expanded
          (
            child: StreamBuilder
            (
              stream: FirestoreServices().getNovedades(),
              builder: (BuildContext context,AsyncSnapshot<List<Novedad>> snapshot)
              {
                if(!snapshot.hasData || snapshot.hasError)
                {
                  return Center(child: CircularProgressIndicator());
                }
                else
                {        
                  if(MediaQuery.of(context).size.width>1000)
                  {      
                    return StaggeredGridView.countBuilder
                    (
                      primary: false,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      crossAxisCount: 4,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) => Center(child: Novedadescard(novedad: snapshot.data[index])),
                      staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                    );
                  }
                  else
                  {
                    return Expanded
                    (
                      child: ListView
                      (
                        physics: BouncingScrollPhysics(),
                        children: 
                        [
                          ListView.separated
                          (
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, int index) => Center(child: Novedadescard(novedad: snapshot.data[index]),), 
                            separatorBuilder: (context, index) => SizedBox(height: 45), 
                            itemCount: snapshot.data.length
                          ),
                          SizedBox(height: 120)
                        ],
                      ),
                    );
                    
                  } 
                }
              },
            ),
          ),
        ],
      )
    );
  }
}

class AppBarCustom extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
   var size=MediaQuery.of(context).size;
    return Stack
    (
      alignment: Alignment(0,0),
      children: 
      [
        
        Hero
        (
          tag: "assets/imgs/Locro.jpg",
          child: ClipRRect 
          (
            borderRadius: BorderRadius.circular(0),
            child:Stack
            (
              children: 
              [
                Image
                (
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                  height: size.height/5.5,
                  image: AssetImage("assets/imgs/Locro.jpg"),
                ),
              ],
            )
          ),
        ),
        Row
        (
          children: 
          [
            IconButton(icon: Icon(FontAwesomeIcons.arrowLeft),color: Colors.white,iconSize: 35,onPressed: (){Navigator.pushNamed(context,"menu");}),
            Row
            (
              children: 
              [
                SizedBox(width: 30),
                Container(margin: EdgeInsets.all(10),child: Text("Novedades",style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold))),
              ],
            )
          ],
        )
      ],
    );
  }
}