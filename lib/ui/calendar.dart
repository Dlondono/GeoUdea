import 'package:flutter/material.dart';
import 'package:geoudea/bloc/appointment.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatelessWidget{
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
      view: CalendarView.week,
      initialSelectedDate: DateTime.now(),
      cellBorderColor: Colors.transparent,
      firstDayOfWeek: 1,
      todayHighlightColor: Colors.green,
    );
}

}