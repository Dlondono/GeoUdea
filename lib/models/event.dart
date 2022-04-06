import 'dart:ui';

class Event{
  final String name;
  final String description;
  final DateTime from;
  final DateTime to;
  final Color color;

  const Event({
    required this.name,
    required this.description,
    required this.from,
    required this.to,
    required this.color,
  });
}
