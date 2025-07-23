import 'package:cloud_firestore/cloud_firestore.dart';

import '../value/enum.dart';
import '../value/keys.dart';

class ModelUser {
  final String uid;
  final Timestamp dateCreate;
  final String? email;
  final String? pw;
  final LoginType loginType;
  final UserType userType;
  final String? nickname;

  const ModelUser({
    required this.uid,
    required this.dateCreate,
    this.email,
    this.pw,
    required this.loginType,
    this.userType = UserType.user,
    this.nickname,
  });

  factory ModelUser.fromJson(Map<String, dynamic> json) {
    return ModelUser(
      uid: json[keyUid] as String,
      dateCreate: json[keyDateCreate] is Timestamp
          ? json[keyDateCreate]
          : Timestamp.fromMillisecondsSinceEpoch(json[keyDateCreate]),
      email: json[keyEmail] as String?,
      pw: json[keyPassword] as String?,
      loginType: LoginType.values.firstWhere((e) => e.name == json[keyLoginType]),
      userType: UserType.values.firstWhere((e) => e.name == json[keyUserType]),
      nickname: json['nickname'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      keyUid: uid,
      keyDateCreate: dateCreate,
      keyEmail: email,
      keyPassword: pw,
      keyLoginType: loginType.name,
      keyUserType: userType.name,
      keyNickName: nickname,
    };
  }

  ModelUser copyWith({
    String? uid,
    Timestamp? dateCreate,
    String? email,
    String? pw,
    LoginType? loginType,
    UserType? userType,
    String? nickname,
  }) {
    return ModelUser(
      uid: uid ?? this.uid,
      dateCreate: dateCreate ?? this.dateCreate,
      email: email ?? this.email,
      pw: pw ?? this.pw,
      loginType: loginType ?? this.loginType,
      userType: userType ?? this.userType,
      nickname: nickname ?? this.nickname,
    );
  }
}