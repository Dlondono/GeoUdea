
class AppointmentClass {
  String? uid;
  String? name;
  String? startTime;
  String? endTime;
  List? selectedDays = [];


  AppointmentClass(this.uid, this.name, this.startTime,this.endTime,this.selectedDays);

  AppointmentClass.fromJsonMap(Map<String, dynamic> map)
      :uid=map["uid"],
        name=map["name"],
        selectedDays=
        map["selectedDays"] != null ? List<String>.from(map["selectedDays"]) : null,
        startTime=map["startTime"],
        endTime=map["endTime"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['uid'] = uid;
    data['name'] = name;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['selectedDays'] = selectedDays;

    return data;
  }
}
class Recomendaciones {
  String? title;
  String? description;

  Recomendaciones(this.title, this.description);

  Recomendaciones.fromJsonMap(Map<String, dynamic> map)
      :title=map["title"],
        description=map["description"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}