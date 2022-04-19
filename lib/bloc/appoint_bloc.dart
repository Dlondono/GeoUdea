import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geoudea/models/Appointment.dart';

class AppointBloc{
  CollectionReference meetings =
  FirebaseFirestore.instance.collection("meetings");
  FirebaseAuth auth =FirebaseAuth.instance;

  Future<dynamic> getMeetingsByUid(String uid) async {
    return meetings.where('uid', isEqualTo: uid).get().then((value) {
      List<AppointmentClass> meetings =
      value.docs.map((e) => AppointmentClass.fromJsonMap(e.data() as Map<String,dynamic>)).toList();
      if(meetings.isNotEmpty){
        return meetings;
      }else{
        return "a";
      }

    }).catchError(

            (error) =>  print(error));
  }
  Future addMeeting(AppointmentClass meeting)async{

    return await meetings.doc().set({
      "name":meeting.name,
      "owner":auth.currentUser?.uid,
      "uid":meeting.uid,
      "startTime": meeting.startTime!,
      "endTime": meeting.endTime!,
      "selectedDays":meeting.selectedDays
    }).then((value) {
      return meeting;
    });
  }
}