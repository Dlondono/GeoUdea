import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geoudea/models/Appointment.dart';

class RecoBloc{

  CollectionReference recomendaciones =
  FirebaseFirestore.instance.collection("recomendaciones");
  FirebaseAuth auth =FirebaseAuth.instance;

  Future addReco(String title,String description)async{

    return await recomendaciones.doc().set({
      "title":title,
      "owner":auth.currentUser?.uid,
      "description":description
    }).then((value) {

    });
  }
  Future<dynamic> getRecomendaciones() async {
    return recomendaciones.get().then((value) {
      List<Recomendaciones> recomendaciones =
      value.docs.map((e) => Recomendaciones.fromJsonMap(e.data() as Map<String,dynamic>)).toList();
      if(recomendaciones.isNotEmpty){
        return recomendaciones;
      }else{
        return "a";
      }

    }).catchError(

            (error) =>  print(error));
  }
}