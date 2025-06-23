import 'package:cloud_firestore/cloud_firestore.dart';

import '../value/keys.dart';

class ModelUserOpinion {
  final String opinionUid;
  final String title; // 의견 제목
  final String uid; // 유저 식별자 (로그인 사용자라면)
  final String content; // 의견 내용
  final Timestamp dateCreate;
  final String? email;

  const ModelUserOpinion({
    required this.uid,
    required this.title,
    required this.opinionUid,
    required this.content,
    required this.dateCreate,
    this.email,
  });

  factory ModelUserOpinion.fromJson(Map<String, dynamic> json) {
    return ModelUserOpinion(
      opinionUid: json[keyOpinionUid] ?? '',
      title: json[keyTitle] ?? '',
      uid: json[keyUid] ?? '',
      content: json[keyContent] ?? '',
      dateCreate: json[keyDateCreate] ?? Timestamp.now(),
      email: json[keyEmail],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      keyOpinionUid: opinionUid,
      keyTitle: title,
      keyUid: uid,
      keyContent: content,
      keyDateCreate: dateCreate,
      keyEmail: email,
    };
  }
}
