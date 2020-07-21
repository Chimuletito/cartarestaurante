import 'package:flutter/material.dart';
import 'package:cartabaumlanus/Model/Categoria.dart';
import 'package:cartabaumlanus/UI/Widgets/CategoriaCard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget
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
      appBar:PreferredSize
      (
        preferredSize: Size.fromHeight(40),
        child: AppBar
        (
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text("Menú Baum Lanús"),
        ), 
      ),
      body:Stack
      (
        children: 
        [
          Positioned.fill
          (  //
            child: Image(
              image: AssetImage('assets/imgs/bg.jpg'),
              fit : BoxFit.fill,
           ),
          ), 
          ListView
          (
            physics: BouncingScrollPhysics(),
            children: 
            [
              CategoriaList()
            ], 
          ) ,
        ],
      )
    );    
  }
}


class CategoriaList extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    var cerveza= Categoria();
    cerveza.name="Cervezas";
    cerveza.imagePath="assets/imgs/logobaum.png";

    var tentempies=Categoria();
    tentempies.name="Tentempies";
    tentempies.imagePath="assets/imgs/Tentempies.jpg";
    
    var burgers=Categoria();
    burgers.name="Burgers";
    burgers.imagePath="assets/imgs/Burgers.jpg";

    var pizzas=Categoria();
    pizzas.name="Pizzas";
    pizzas.imagePath="assets/imgs/Pizzas.jpg";

    var entrepanes=Categoria();
    entrepanes.name="Entre panes";
    entrepanes.imagePath="assets/imgs/Entrepanes.jpg";

    var principales=Categoria();
    principales.name="Principales";
    principales.imagePath="assets/imgs/Principales.jpg";

    var ensaladas=Categoria();
    ensaladas.name="Ensaladas";
    ensaladas.imagePath="assets/imgs/Ensaladas.jpg";
  
    var bebidaswithoutalcohol=Categoria();
    bebidaswithoutalcohol.name="Bebidas";
    bebidaswithoutalcohol.imagePath="assets/imgs/Bebidassinalcohol.jpg";

    Categoria novedades=Categoria();
    novedades.name="Novedades";
    novedades.imagePath="assets/imgs/Novedades.jpeg";

    Categoria tienda=Categoria();
    tienda.name="Tienda";
    tienda.imagePath="assets/imgs/Tienda.jpg";


    var tablas=Categoria();
    tablas.name="Tablas";
    tablas.imagePath="assets/imgs/Tabla.jpg";

    Categoria promos=Categoria();
    promos.name="Promos";
    promos.imagePath="assets/imgs/Promos.jpeg";


    return Column
    (
      children: 
      [
        FilaCard(primerCategoria: cerveza,segundaCategoria: tentempies),
        FilaCard(primerCategoria: burgers,segundaCategoria: pizzas),
        FilaCard(primerCategoria: entrepanes, segundaCategoria: principales),
        FilaCard(primerCategoria: tablas,segundaCategoria: ensaladas),
        FilaCard(primerCategoria: bebidaswithoutalcohol,segundaCategoria: tienda),
        FilaCard(primerCategoria: novedades, segundaCategoria: promos)
      ],
    );
  }
}

class FilaCard extends StatelessWidget 
{
  final Categoria primerCategoria;
  final Categoria segundaCategoria;

  FilaCard({Key key, this.primerCategoria, this.segundaCategoria});

  @override
  Widget build(BuildContext context) 
  {
    var mqsize=MediaQuery.of(context).size;

    if(mqsize.width>1000)
    {
      return Row
      (
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: 
        [
          CategoriaCard(primerCategoria),
          CategoriaCard(segundaCategoria)
        ],
      );
    }
    else
    {
      return Column
      (
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: 
        [
          CategoriaCard(primerCategoria),
          CategoriaCard(segundaCategoria)
        ],
      );
    }
    
    
  }
}

class CategoriaSola extends StatelessWidget 
{
  
  final Categoria categoria;

  CategoriaSola({Key key, this.categoria}) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    return Row
    (
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: 
      [
        CategoriaCard(categoria)
      ],
    );
  }
}