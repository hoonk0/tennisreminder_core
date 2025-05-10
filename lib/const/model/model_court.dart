import 'package:cloud_firestore/cloud_firestore.dart';
import '../value/keys.dart';

class ModelCourt {
  /// 코트 고유 ID
  final String uid;
  /// 생성 날짜
  final Timestamp dateCreate;

  /// 코트 위치 위도
  final double latitude;
  /// 코트 위치 경도
  final double longitude;

  /// 코트 이름
  final String courtName;
  /// 코트 주소
  final String courtAddress;
  /// 코트 정보
  final String courtInfo;

  /// 예약 페이지 링크
  final String reservationUrl;

  /// 좋아요한 사용자 UID 목록
  final List<String>? likedUserUids;

  /// 코트 사진 URL 목록
  final List<String>? imageUrls;

  /// 부가 정보 (예: 주차 가능 여부, 조명 유무 등)
  final Map<String, dynamic>? extraInfo;

  final String? courtDistrict;

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
  });

  //
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
    );
  }
  //

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
    List<DateTime>? reservationTimes,
    List<String>? likedUserUids,
    List<String>? imageUrls,
    Map<String, dynamic>? extraInfo,
    String? courtDistrict,
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
      courtDistrict: courtDistrict ?? this.courtDistrict,
    );
  }
}