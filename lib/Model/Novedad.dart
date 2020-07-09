class Novedad 
{
  var fecha;
  var fechaOrden;
  final String titulo;
  final String descripcion;
  final String image;
  final String activo;
  final String precio;

  Novedad(this.titulo,this.descripcion,this.image,this.precio,this.activo,this.fecha,this.fechaOrden);
  
  Novedad.fromMap(Map<String,dynamic> data):
    titulo=data["titulo"],
    fechaOrden=data["fechaOrden"],
    fecha=data["fecha"],
    descripcion=data['descripcion'],
    image=data["image"],
    activo=data["activo"],
    precio=data["precio"];
    

  Map<String, dynamic> toMap() {
    return {
      "descripcion" : descripcion,
      "fecha" : fecha,
      "image":image,
      "activo":activo,
      "precio":precio
    };
  }
}