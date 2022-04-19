import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geoudea/models/Appointment.dart';

class AppointBloc{
  CollectionReference meetings =
  FirebaseFirestore.instance.collection("meetings");
  FirebaseAuth auth =FirebaseAuth.instance;

  Future<dynamic> getMeetingsByUid(String uid) async {
    return meetings.where('uid', isEqualTo: uid).get().then((value) {
      var pets =
      value.docs.map((e) => AppointmentClass.fromJsonMap(e.data() as Map<String,dynamic>)).toList();
      if(pets.isNotEmpty){
        return pets;
      }else{
        print("nada");
        return null;
      }

    }).catchError(
            (error) =>  null);
  }
  Future addMeeting(AppointmentClass meeting)async{

    return await meetings.doc(meeting.uid).set({
      "name":meeting.name,
      "owner":auth.currentUser?.uid,
      "uid":meeting.uid,
      "startTime": meeting.startTime!.hour.toString() + ":" + meeting.startTime!.minute.toString().padLeft(2, '0'),
      "endTime": meeting.endTime!.hour.toString() + ":" + meeting.endTime!.minute.toString().padLeft(2, '0'),

    }).then((value) {
      return meeting;
    });
  }
}