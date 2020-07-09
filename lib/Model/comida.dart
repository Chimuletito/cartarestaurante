class Comida 
{
  final String nombre;
  final String descripcion;
  final String image;
  final String activo;
  final int precio;

  Comida(this.nombre,this.descripcion,this.image,this.precio,this.activo);
  
  Comida.fromMap(Map<String,dynamic> data, String id):
    nombre=id,
    descripcion=data['descripcion'],
    image=data["image"],
    activo=data["activo"],
    precio=data["precio"];
    

  Map<String, dynamic> toMap() {
    return {
      "descripcion" : descripcion,
      "image":image,
      "activo":activo,
      "precio":precio
    };
  }
}