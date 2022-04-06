import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../models/event.dart';

class AddAppointment extends StatefulWidget {
  final Event? event;
  const AddAppointment({this.event});
  @override
  _AddAppointmentState createState() => _AddAppointmentState();
}

class _AddAppointmentState extends State<AddAppointment> {
  late DateTime to;
  late DateTime from;
  TextEditingController controller=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.event==null){
      from=DateTime.now();
      to=DateTime.now().add(Duration(days: 183));
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
         actions: [
           ElevatedButton.icon
             (onPressed: (){
              saveAppointment();
           }, style: ButtonStyle(
             backgroundColor:  MaterialStateProperty.all(Colors.green),
           ),label: Text("Guardar"),
               icon: Icon(Icons.done))
         ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children:<Widget>[
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Nombre",
                ),
                controller: controller,
                validator: (title)=>
                title!=null && title.isEmpty? 'No puede estar vacio':null,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Align(
                  alignment: Alignment.topLeft,
                    child: Text("Desde")
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: ListTile(
                    title: Text(DateFormat.yMd().format(from)),
                      onTap: (){
                        pickDateTime(true);
                      },
                      trailing: Icon(Icons.arrow_drop_down),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(DateFormat.Hm().format(from)),
                      onTap: (){
                        pickDateTime(false);
                      },
                      trailing: Icon(Icons.arrow_drop_down),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Hasta")
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: ListTile(
                      title: Text(DateFormat.yMd().format(to)),
                      onTap: (){

                      },
                      trailing: Icon(Icons.arrow_drop_down),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(DateFormat.Hm().format(to)),
                      onTap: (){
                      },
                      trailing: Icon(Icons.arrow_drop_down),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveAppointment() {

  }

  Future pickDateTime(bool bool)async {
    if (bool==true) {
      final date=await showDatePicker(
        context: context,
        initialDate: from,
        firstDate: DateTime(2022,1),
        lastDate: DateTime(2100),
      );
      if(date==null) return null;
      final time=Duration(hours: from.hour, minutes: from.minute);
      date.add(time);
      from=date;
      print(date);
      print(from);
      setState(() {

      });
    }else{
        final timeOfDay= await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(from));
        if(timeOfDay==null) return null;
        final time=Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);
        from.add(time);
        print(from);
        setState(() {

        });
    }

  }
}
