import 'package:cloud_firestore/cloud_firestore.dart';

import '../value/enum.dart';
import '../value/keys.dart';

class ModelCourtReservation {
  final String uid;
  final Timestamp? dateCreated;
  final ReservationRuleType reservationRuleType;
  final int? reservationHour;
  final int? reservationDay;
  final int? daysBeforePlay;
  final int? reservationWeekNumber;   // n번째 주 (1~5)
  final int? reservationWeekday;      // 요일 (1=월, ..., 7=일)

  const ModelCourtReservation({
    required this.uid,
    required this.reservationRuleType,
    this.reservationHour,
    this.reservationDay,
    this.daysBeforePlay,
    this.reservationWeekNumber,
    this.reservationWeekday,
    this.dateCreated,
  });

  factory ModelCourtReservation.fromJson(Map<String, dynamic> json) {
    return ModelCourtReservation(
      uid: json[keyReservationUid],
      reservationRuleType: ReservationRuleType.values.byName(json[keyReservationRuleType]),
      reservationHour: json.containsKey(keyReservationHour) ? json[keyReservationHour] : null,
      reservationDay: json[keyReservationDay],
      daysBeforePlay: json[keyDaysBeforePlay],
      reservationWeekNumber: json['reservationWeekNumber'],
      reservationWeekday: json['reservationWeekday'],
      dateCreated: json[keyReservationDateCreated] != null
          ? Timestamp.fromMillisecondsSinceEpoch(json[keyReservationDateCreated])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    keyReservationUid: uid,
    keyReservationRuleType: reservationRuleType.name,
    if (reservationHour != null) keyReservationHour: reservationHour,
    keyReservationDay: reservationDay,
    keyDaysBeforePlay: daysBeforePlay,
    if (reservationWeekNumber != null) 'reservationWeekNumber': reservationWeekNumber,
    if (reservationWeekday != null) 'reservationWeekday': reservationWeekday,
    keyReservationDateCreated: dateCreated?.millisecondsSinceEpoch,
  };}