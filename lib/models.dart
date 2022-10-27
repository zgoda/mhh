import 'package:equatable/equatable.dart';

enum RecordTimeOfDay {
  morning('morning', 1),
  noon('noon', 2),
  afternoon('afternoon', 3),
  evening('evening', 4),
  night('night', 0);

  final String value;
  final int order;

  const RecordTimeOfDay(this.value, this.order);

  static RecordTimeOfDay getByTime(DateTime time) {
    if (time.hour >= 7 && time.hour < 11) {
      return RecordTimeOfDay.morning;
    } else if (time.hour >= 11 && time.hour < 14) {
      return RecordTimeOfDay.noon;
    } else if (time.hour >= 14 && time.hour < 18) {
      return RecordTimeOfDay.afternoon;
    } else if (time.hour >= 18 && time.hour < 0) {
      return RecordTimeOfDay.evening;
    }
    return RecordTimeOfDay.night;
  }

  static RecordTimeOfDay? getByValue(String todValue) {
    for (RecordTimeOfDay tod in RecordTimeOfDay.values) {
      if (tod.value == todValue) {
        return tod;
      }
    }
    return null;
  }
}

class BloodPressureRecord extends Equatable {
  final DateTime date;
  final RecordTimeOfDay timeOfDay;
  final int sys;
  final int dia;
  final int? bpm;

  const BloodPressureRecord({
    required this.date,
    required this.timeOfDay,
    required this.sys,
    required this.dia,
    this.bpm,
  });

  @override
  List<Object> get props => [date, timeOfDay, sys, dia];

  String get key => '${date.toIso8601String()}-${timeOfDay.order}';

  factory BloodPressureRecord.fromMap(Map<String, dynamic> data) =>
      BloodPressureRecord(
          date: DateTime.parse(data['date']).toLocal(),
          timeOfDay: RecordTimeOfDay.getByValue(data['timeOfDay'])!,
          sys: data['sys'],
          dia: data['dia'],
          bpm: data['bpm']!);

  Map<String, dynamic> toMap() => {
        'date': date.toIso8601String(),
        'timeOfDay': timeOfDay.value,
        'sys': sys,
        'dia': dia,
        'bpm': bpm,
      };
}
