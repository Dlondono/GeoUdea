import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:geoudea/bloc/appoint_bloc.dart';
import 'package:geoudea/models/Appointment.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../models/event.dart';

class AddAppointment extends StatefulWidget {
  final Event? event;
  const AddAppointment({this.event});
  @override
  _AddAppointmentState createState() => _AddAppointmentState();
}

class _AddAppointmentState extends State<AddAppointment> {
  FirebaseAuth auth =FirebaseAuth.instance;
  late DateTime to;
  String? _name;
  late DateTime from;
  AppointBloc appointBloc=AppointBloc();
  TextEditingController controller = TextEditingController();
  List<String> days = ["L", "M", "W", "J", "V", "S"];
  List selectedDays = [];
  TimeOfDay desde = const TimeOfDay(hour: 6, minute: 0);
  TimeOfDay hasta = const TimeOfDay(hour: 8, minute: 0);
  var color = MaterialStateProperty.all(Colors.black);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.event == null) {
      from = DateTime(1, 1, 1, 06, 00);
      to = DateTime.now().add(const Duration(days: 183));
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

    Color mycolor = Colors.green;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          ElevatedButton.icon(
              onPressed: () {
                saveAppointment();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              label: const Text("Guardar"),
              icon: const Icon(Icons.done))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Nombre",
                ),
                controller: controller,
                validator: (title) =>
                title != null && title.isEmpty
                    ? 'No puede estar vacio'
                    : null,
                onChanged: (value){
                  _name=value;
                },
              ),
              Column(
                children: [
                  Row(
                    children: [
                      const Text("Desde"),
                      Expanded(
                        child: ListTile(
                          title: Text(desde.hour.toString() + ":" + desde.minute
                              .toString().padLeft(2, '0')),
                          onTap: () {
                            _selectTime(0);
                          },
                          leading: const Icon(Icons.arrow_drop_down),
                        ),
                      ),
                      const Text("Hasta"),
                      Expanded(
                        child: ListTile(
                          title: Text(hasta.hour.toString() + ":" + hasta.minute
                              .toString().padLeft(2, '0')),
                          onTap: () {
                            _selectTime(1);
                          },
                          leading: const Icon(Icons.arrow_drop_down),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 20.0),
                    child: MultiSelectChipDisplay(
                      textStyle: const TextStyle(color: Colors.black),
                      colorator: (value) {
                        if (selectedDays.contains(value)) {
                          return Colors.green;
                        } else {
                          return Colors.white;
                        }
                      },
                      items: days.map((e) => MultiSelectItem(e, e)).toList(),
                      onTap: (value) {
                        if (selectedDays.contains(value)) {
                          selectedDays.remove(value);
                          print(selectedDays);
                        } else {
                          selectedDays.add(value);
                          print(selectedDays);
                        }
                        setState(() {

                        });
                      },
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(mycolor),
                    ),
                    onPressed: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context){
                            return AlertDialog(
                              title: Text('Escoge un color'),
                              content: SingleChildScrollView(
                                child: ColorPicker(
                                  pickerColor: mycolor, //default color
                                  onColorChanged: (Color color){ //on color picked
                                    setState(() {
                                      mycolor = color;
                                    });
                                  },
                                ),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.green),
                                  ),
                                  child: const Text('Listo'),
                                  onPressed: () {
                                    setState(() {

                                    });
                                    Navigator.of(context).pop(); //dismiss the color picker
                                  },
                                ),
                              ],
                            );
                          }
                      );

                    },
                    child: Text("Escoge un color"),
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
    AppointmentClass meeting=AppointmentClass(auth.currentUser!.uid, _name, desde, hasta,selectedDays);
    appointBloc.addMeeting(meeting);
  }


  void _selectTime(int i) async {
    TimeOfDay _time = TimeOfDay(hour: desde.hour, minute: desde.minute);
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
        if (i == 0) {
          desde = _time;
        } else {
          hasta = _time;
        }
      });
    }
  }

  void daySelected() {
    setState(() {

    });
  }
}
