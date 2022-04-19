import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geoudea/bloc/appoint_bloc.dart';
import 'package:geoudea/bloc/appointment.dart';
import 'package:geoudea/models/Appointment.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatefulWidget{
  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  AddAppointment appointment=AddAppointment();
  List<Appointment> meetings = <Appointment>[];
  AppointBloc appointBloc=AppointBloc();

  FirebaseAuth auth =FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAppointmentsFirebase();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => AddAppointment()),

          );
        },
        child: Icon(Icons.add),
      ),
      body: calendarWidget(),
    );
  }

Widget calendarWidget(){

    return SfCalendar(
      dataSource: MeetingDataSource(meetings),
      view: CalendarView.workWeek,
      initialSelectedDate: DateTime.now(),
      cellBorderColor: Colors.transparent,
      firstDayOfWeek: 1,
      todayHighlightColor: Colors.green,
      timeSlotViewSettings: const TimeSlotViewSettings(
        startHour: 5,
        endHour: 23,
          nonWorkingDays: <int>[ DateTime.sunday]
        ),
      );
}

 /* List<Appointment> getAppointments() {
    final DateTime today = DateTime.now();
    final DateTime startTime =
    DateTime(today.year, today.month, today.day, 8, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));

    meetings.add(Appointment(
        startTime: startTime,
        endTime: endTime,
        subject: 'Board Meeting',
        color: Colors.green,
        recurrenceRule: 'FREQ=WEEKLY;COUNT=32;BYDAY=TU,TH',
        isAllDay: false));

    return meetings;
  }*/

  Future getAppointmentsFirebase()async{

    List<AppointmentClass> appointments = <AppointmentClass>[];
    appointments=await appointBloc.getMeetingsByUid(auth.currentUser!.uid);
    for(int i=0;i<appointments.length;i++){
      List<String> daysRRule=["MO","TU","WE","TH","FR","SA"];
      String rRule="";
      if(appointments[i].selectedDays!.contains("L")){
        rRule=rRule+",MO";
      }
      if(appointments[i].selectedDays!.contains("M")){
        rRule=rRule+",TU";
      }
      if(appointments[i].selectedDays!.contains("W")){
        rRule=rRule+",WE";
      }
      if(appointments[i].selectedDays!.contains("J")){
        rRule=rRule+",TH";
      }
      if(appointments[i].selectedDays!.contains("V")){
        rRule=rRule+",FR";
      }
      if(appointments[i].selectedDays!.contains("S")){
        rRule=rRule+",SA";
      }
      meetings.add(Appointment(
          startTime: DateTime(2022,4,16,int.parse(appointments[i].startTime!)),
          endTime: DateTime(2022,4,16,int.parse(appointments[i].endTime!)),
          subject: appointments[i].name!,
          color: Colors.green,
          recurrenceRule: 'FREQ=WEEKLY;COUNT=32;BYDAY=$rRule',
          isAllDay: false));
    }
    setState(() {

    });
    return Future.value("a");
  }
}


class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}