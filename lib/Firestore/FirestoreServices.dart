import 'package:cartabaumlanus/Model/Novedad.dart';
import 'package:cartabaumlanus/Model/comida.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices
{


  Firestore _database=Firestore.instance;
  Stream<List<Comida>> getComida(String categoria) => _database.collection(categoria).orderBy("posicion").snapshots().map((snapshot) => snapshot.documents.map((doc) => Comida.fromMap(doc.data, doc.documentID)).toList());
  

  Stream<List<Novedad>> getNovedades() => _database.collection("Novedades").orderBy("fechaOrden",descending: true).snapshots().map((snapshot) => snapshot.documents.map((doc) => Novedad.fromMap(doc.data)).toList());

}