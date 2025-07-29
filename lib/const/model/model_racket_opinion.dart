import 'package:cloud_firestore/cloud_firestore.dart';

import '../value/keys.dart';

class ModelRacketOpinion {
  final String? racketOpinion;
  final String racketPostId;
  final Timestamp createdAt;
  final String writerUid;
  final String racketBrand;
  final String racketName;
  final String racketWeight;
  final String racketHeadSize;

  ModelRacketOpinion({
    this.racketOpinion,
    required this.racketPostId,
    required this.createdAt,
    required this.writerUid,
    required this.racketBrand,
    required this.racketName,
    required this.racketWeight,
    required this.racketHeadSize,
  });

  factory ModelRacketOpinion.fromJson(Map<String, dynamic> json) {
    return ModelRacketOpinion(
      racketOpinion: json[keyRacketOpinion] as String?,
      racketPostId: json[keyRacketPostId] as String,
      createdAt: json[keyCreatedAt] is Timestamp
          ? json[keyCreatedAt]
          : Timestamp.fromMillisecondsSinceEpoch(json[keyCreatedAt]),
      writerUid: json[keyWriterUid] as String,
      racketBrand: json[keyRacketBrand] as String,
      racketName: json[keyRacketName] as String,
      racketWeight: json[keyRacketWeight] as String,
      racketHeadSize: json[keyRacketHeadSize] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      keyRacketOpinion: racketOpinion,
      keyRacketPostId: racketPostId,
      keyCreatedAt: createdAt,
      keyWriterUid: writerUid,
      keyRacketBrand: racketBrand,
      keyRacketName: racketName,
      keyRacketWeight: racketWeight,
      keyRacketHeadSize: racketHeadSize,
    };
  }

  ModelRacketOpinion copyWith({
    String? opinion,
    String? postId,
    Timestamp? createdAt,
    String? writerUid,
    String? racketBrand,
    String? racketName,
    String? racketWeight,
    String? racketHeadSize,
  }) {
    return ModelRacketOpinion(
      racketOpinion: opinion ?? this.racketOpinion,
      racketPostId: postId ?? this.racketPostId,
      createdAt: createdAt ?? this.createdAt,
      writerUid: writerUid ?? this.writerUid,
      racketBrand: racketBrand ?? this.racketBrand,
      racketName: racketName ?? this.racketName,
      racketWeight: racketWeight ?? this.racketWeight,
      racketHeadSize: racketHeadSize ?? this.racketHeadSize,
    );
  }
}
