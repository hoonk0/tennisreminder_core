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

  const ModelCourtReservation({
    required this.uid,
    required this.reservationRuleType,
    this.reservationHour,
    this.reservationDay,
    this.daysBeforePlay,
    this.dateCreated,
  });

  factory ModelCourtReservation.fromJson(Map<String, dynamic> json) {
    return ModelCourtReservation(
      uid: json[keyReservationUid],
      reservationRuleType: ReservationRuleType.values.byName(json[keyReservationRuleType]),
      reservationHour: json.containsKey(keyReservationHour) ? json[keyReservationHour] : null,
      reservationDay: json[keyReservationDay],
      daysBeforePlay: json[keyDaysBeforePlay],
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
    keyReservationDateCreated: dateCreated?.millisecondsSinceEpoch,
  };}