import 'package:cloud_firestore/cloud_firestore.dart';

import '../value/keys.dart';

class ModelCourtAlarm {
  final String courtUid;
  final String userUid;
  final String fcmToken;
  final String courtName;
  final int? alarmWeekday;
  final int? alarmHour;
  final int? alarmMinute;
  final bool alarmEnabled;
  final Timestamp? alarmDateTime;
  final Timestamp dateCreate;

  const ModelCourtAlarm({
    required this.courtUid,
    required this.userUid,
    required this.fcmToken,
    required this.courtName,
    this.alarmWeekday,
    this.alarmHour,
    this.alarmMinute,
    this.alarmEnabled = true,
    this.alarmDateTime,
    required this.dateCreate,
  });

  factory ModelCourtAlarm.fromJson(Map<String, dynamic> json) {
    return ModelCourtAlarm(
      courtUid: json[keyCourtUid],
      userUid: json[keyUserUid],
      fcmToken: json[keyFcmToken],
      courtName: json[keyCourtName],
      alarmWeekday: json[keyAlarmWeekday] is int ? json[keyAlarmWeekday] : null,
      alarmHour: json[keyAlarmHour] is int ? json[keyAlarmHour] : null,
      alarmMinute: json[keyAlarmMinute] is int ? json[keyAlarmMinute] : null,
      alarmEnabled: json[keyAlarmEnabled] ?? true,
      alarmDateTime: json[keyAlarmDateTime] is Timestamp
          ? json[keyAlarmDateTime]
          : (json[keyAlarmDateTime] is int
              ? Timestamp.fromMillisecondsSinceEpoch(json[keyAlarmDateTime])
              : null),
      dateCreate: json[keyDateCreate] is Timestamp
          ? json[keyDateCreate]
          : Timestamp.fromMillisecondsSinceEpoch(json[keyDateCreate]),
    );
  }

  Map<String, dynamic> toJson() => {
    keyCourtUid: courtUid,
    keyUserUid: userUid,
    keyFcmToken: fcmToken,
    keyCourtName: courtName,
    if (alarmWeekday != null) keyAlarmWeekday: alarmWeekday,
    if (alarmHour != null) keyAlarmHour: alarmHour,
    if (alarmMinute != null) keyAlarmMinute: alarmMinute,
    keyAlarmEnabled: alarmEnabled,
    keyAlarmDateTime: alarmDateTime,
    keyDateCreate: dateCreate,
  };

  ModelCourtAlarm copyWith({
    String? courtUid,
    String? userUid,
    String? fcmToken,
    String? courtName,
    int? alarmWeekday,
    int? alarmHour,
    int? alarmMinute,
    bool? alarmEnabled,
    Timestamp? alarmDateTime,
    Timestamp? dateCreate,
  }) {
    return ModelCourtAlarm(
      courtUid: courtUid ?? this.courtUid,
      userUid: userUid ?? this.userUid,
      fcmToken: fcmToken ?? this.fcmToken,
      courtName: courtName ?? this.courtName,
      alarmWeekday: alarmWeekday ?? this.alarmWeekday,
      alarmHour: alarmHour ?? this.alarmHour,
      alarmMinute: alarmMinute ?? this.alarmMinute,
      alarmEnabled: alarmEnabled ?? this.alarmEnabled,
      alarmDateTime: alarmDateTime ?? this.alarmDateTime,
      dateCreate: dateCreate ?? this.dateCreate,
    );
  }
}