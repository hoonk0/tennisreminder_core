import 'package:cloud_firestore/cloud_firestore.dart';
import '../value/keys.dart';
import 'model_court_alarm.dart';

class ModelCourt {
  final String uid;
  final Timestamp dateCreate;
  final double latitude;
  final double longitude;
  final String courtName;
  final String courtAddress;
  final String courtInfo;
  final String reservationUrl;
  final List<String>? likedUserUids;
  final List<String>? imageUrls;
  final Map<String, dynamic>? extraInfo;
  final String? courtDistrict;
  final List<ModelCourtAlarm>? courtAlarms; // ✅ 알림 리스트 추가

  const ModelCourt({
    required this.uid,
    required this.dateCreate,
    required this.latitude,
    required this.longitude,
    required this.courtName,
    required this.courtAddress,
    required this.courtInfo,
    required this.reservationUrl,
    this.likedUserUids,
    this.imageUrls,
    this.extraInfo,
    this.courtDistrict,
    this.courtAlarms,
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
      reservationUrl: json[keyReservationUrl] ?? '',
      likedUserUids: List<String>.from(json[keyLikedUserUids] ?? []),
      imageUrls: List<String>.from(json[keyImageUrls] ?? []),
      extraInfo: json[keyExtraInfo] as Map<String, dynamic>?,
      courtDistrict: district,
      courtAlarms: (json[keyCourtAlarms] as List?)
          ?.map((e) => ModelCourtAlarm.fromJson(Map<String, dynamic>.from(e)))
          .toList(),
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
      keyReservationUrl: reservationUrl,
      keyLikedUserUids: likedUserUids,
      keyImageUrls: imageUrls ?? [],
      keyExtraInfo: extraInfo,
      keyCourtDistrict: courtDistrict,
      keyCourtAlarms: courtAlarms?.map((e) => e.toJson()).toList(), // ✅ 추가
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
    String? reservationUrl,
    List<String>? likedUserUids,
    List<String>? imageUrls,
    Map<String, dynamic>? extraInfo,
    String? courtDistrict,
    List<ModelCourtAlarm>? courtAlarms, // ✅ 추가
  }) {
    return ModelCourt(
      uid: uid ?? this.uid,
      dateCreate: dateCreate ?? this.dateCreate,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      courtName: courtName ?? this.courtName,
      courtAddress: courtAddress ?? this.courtAddress,
      courtInfo: courtInfo ?? this.courtInfo,
      reservationUrl: reservationUrl ?? this.reservationUrl,
      likedUserUids: likedUserUids ?? this.likedUserUids,
      imageUrls: imageUrls ?? this.imageUrls,
      extraInfo: extraInfo ?? this.extraInfo,
      courtDistrict: (courtAddress ?? this.courtAddress).split(' ').length > 1
          ? (courtAddress ?? this.courtAddress).split(' ')[1]
          : '',
      courtAlarms: courtAlarms ?? this.courtAlarms,
    );
  }
}