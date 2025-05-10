import 'package:tennisreminder_core/const/value/keys.dart';

class ModelCourtAlarm {
  final String userUid;
  final String courtUid;
  final int alarmWeekday;
  final int alarmHour;
  final int alarmMinute;

  const ModelCourtAlarm({
    required this.userUid,
    required this.courtUid,
    required this.alarmWeekday,
    required this.alarmHour,
    required this.alarmMinute,
  });

  factory ModelCourtAlarm.fromJson(Map<String, dynamic> json) {
    return ModelCourtAlarm(
      userUid: json[keyUserUid],
      courtUid: json[keyCourtUid],
      alarmWeekday: json[keyAlarmWeekday],
      alarmHour: json[keyAlarmHour],
      alarmMinute: json[keyAlarmMinute],
    );
  }

  Map<String, dynamic> toJson() => {
    keyUserUid: userUid,
    keyCourtUid: courtUid,
    keyAlarmWeekday: alarmWeekday,
    keyAlarmHour: alarmHour,
    keyAlarmMinute: alarmMinute,
  };
}