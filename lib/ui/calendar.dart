import 'package:flutter/material.dart';
import 'package:geoudea/bloc/appointment.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatelessWidget{
  AddAppointment appointment=AddAppointment();
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
      dataSource: MeetingDataSource(getAppointments()),
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

  List<Appointment> getAppointments() {
    List<Appointment> meetings = <Appointment>[];
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
  }
}


class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}