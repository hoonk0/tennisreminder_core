import 'package:tennisreminder_core/const/value/keys.dart';

class ModelCourtAlarm {
  final String courtUid;
  final int alarmWeekday;
  final int alarmHour;
  final int alarmMinute;

  const ModelCourtAlarm({
    required this.courtUid,
    required this.alarmWeekday,
    required this.alarmHour,
    required this.alarmMinute,
  });

  factory ModelCourtAlarm.fromJson(Map<String, dynamic> json) {
    return ModelCourtAlarm(
      courtUid: json[keyCourtUid],
      alarmWeekday: json[keyAlarmWeekday],
      alarmHour: json[keyAlarmHour],
      alarmMinute: json[keyAlarmMinute],
    );
  }

  Map<String, dynamic> toJson() => {
    keyCourtUid: courtUid,
    keyAlarmWeekday: alarmWeekday,
    keyAlarmHour: alarmHour,
    keyAlarmMinute: alarmMinute,
  };
}