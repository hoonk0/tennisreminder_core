import 'package:cloud_firestore/cloud_firestore.dart';
import '../value/enum.dart';
import '../value/keys.dart';
import 'model_court_alarm.dart';
import 'model_court_reservation.dart';

class ModelCourt {
  final String uid;
  final Timestamp dateCreate;
  final double latitude;
  final double longitude;
  final String courtName;
  final String courtAddress;
  final String courtInfo;
  final String? courtInfo1;
  final String? courtInfo2;
  final String? courtInfo3;
  final String? courtInfo4;
  final String? reservationSchedule;
  final String reservationUrl;
  final List<String>? likedUserUids;
  final List<String>? imageUrls;
  final String? courtDistrict;
  final List<ModelCourtAlarm>? courtAlarms; // ✅ 알림 리스트 추가
  final Map<String, dynamic>? weatherInfo;
  final ModelCourtReservation? reservationInfo;

  const ModelCourt({
    required this.uid,
    required this.dateCreate,
    required this.latitude,
    required this.longitude,
    required this.courtName,
    required this.courtAddress,
    required this.courtInfo,
    this.courtInfo1,
    this.courtInfo2,
    this.courtInfo3,
    this.courtInfo4,
    this.reservationSchedule,
    required this.reservationUrl,
    this.likedUserUids,
    this.imageUrls,
    this.courtDistrict,
    this.courtAlarms,
    this.weatherInfo,
    this.reservationInfo,
  });

  factory ModelCourt.fromJson(Map<String, dynamic> json) {
    final address = json[keyCourtAddress] ?? '';
    final addressParts = address.split(' ');
    final district = addressParts.length > 1 ? addressParts[1] : '';
    return ModelCourt(
      uid: json[keyUid] as String,
      dateCreate: json[keyDateCreate] is Timestamp
          ? json[keyDateCreate]
          : Timestamp.fromMillisecondsSinceEpoch(json[keyDateCreate]),
      latitude: json[keyLatitude]?.toDouble() ?? 0.0,
      longitude: json[keyLongitude]?.toDouble() ?? 0.0,
      courtName: json[keyCourtName] ?? '',
      courtAddress: json[keyCourtAddress] ?? '',
      courtInfo: json[keyCourtInfo] ?? '',
      courtInfo1: json[keyCourtInfo1] as String?,
      courtInfo2: json[keyCourtInfo2] as String?,
      courtInfo3: json[keyCourtInfo3] as String?,
      courtInfo4: json[keyCourtInfo4] as String?,
      reservationSchedule: json[keyReservationSchedule] as String?,
      reservationUrl: json[keyReservationUrl] ?? '',
      likedUserUids: List<String>.from(json[keyLikedUserUids] ?? []),
      imageUrls: List<String>.from(json[keyImageUrls] ?? []),
      courtDistrict: district,
      courtAlarms: (json[keyCourtAlarms] as List?)
          ?.map((e) => ModelCourtAlarm.fromJson(Map<String, dynamic>.from(e)))
          .toList(),
      weatherInfo: json[keyWeatherInfo] as Map<String, dynamic>?,
      reservationInfo: json[keyReservationInfo] != null
          ? ModelCourtReservation.fromJson(
              Map<String, dynamic>.from(json[keyReservationInfo]))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      keyUid: uid,
      keyDateCreate: dateCreate,
      keyLatitude: latitude,
      keyLongitude: longitude,
      keyCourtName: courtName,
      keyCourtAddress: courtAddress,
      keyCourtInfo: courtInfo,
      keyCourtInfo1: courtInfo1,
      keyCourtInfo2: courtInfo2,
      keyCourtInfo3: courtInfo3,
      keyCourtInfo4: courtInfo4,
      keyReservationSchedule: reservationSchedule,
      keyReservationUrl: reservationUrl,
      keyLikedUserUids: likedUserUids,
      keyImageUrls: imageUrls ?? [],
      keyCourtDistrict: courtDistrict,
      keyCourtAlarms: courtAlarms?.map((e) => e.toJson()).toList(), // ✅ 추가
      keyWeatherInfo: weatherInfo,
      keyReservationInfo: reservationInfo?.toJson(),
    };
  }

  ModelCourt copyWith({
    String? uid,
    Timestamp? dateCreate,
    double? latitude,
    double? longitude,
    String? courtName,
    String? courtAddress,
    String? courtInfo,
    String? courtInfo1,
    String? courtInfo2,
    String? courtInfo3,
    String? courtInfo4,
    String? reservationSchedule,
    String? reservationUrl,
    List<String>? likedUserUids,
    List<String>? imageUrls,
    Map<String, dynamic>? extraInfo,
    String? courtDistrict,
    List<ModelCourtAlarm>? courtAlarms, // ✅ 추가
    Map<String, dynamic>? weatherInfo,
    ModelCourtReservation? reservationInfo,
  }) {
    return ModelCourt(
      uid: uid ?? this.uid,
      dateCreate: dateCreate ?? this.dateCreate,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      courtName: courtName ?? this.courtName,
      courtAddress: courtAddress ?? this.courtAddress,
      courtInfo: courtInfo ?? this.courtInfo,
      courtInfo1: courtInfo1 ?? this.courtInfo1,
      courtInfo2: courtInfo2 ?? this.courtInfo2,
      courtInfo3: courtInfo3 ?? this.courtInfo3,
      courtInfo4: courtInfo4 ?? this.courtInfo4,
      reservationSchedule: reservationSchedule ?? this.reservationSchedule,
      reservationUrl: reservationUrl ?? this.reservationUrl,
      likedUserUids: likedUserUids ?? this.likedUserUids,
      imageUrls: imageUrls ?? this.imageUrls,
      courtDistrict: (courtAddress ?? this.courtAddress).split(' ').length > 1
          ? (courtAddress ?? this.courtAddress).split(' ')[1]
          : '',
      courtAlarms: courtAlarms ?? this.courtAlarms,
      weatherInfo: weatherInfo ?? this.weatherInfo,
      reservationInfo: reservationInfo ?? this.reservationInfo,
    );
  }
}