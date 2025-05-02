import 'package:cloud_firestore/cloud_firestore.dart';

import '../value/enum.dart';
import '../value/keys.dart';

class ModelUser {
  final String uid;
  final Timestamp dateCreate;
  final String? email;
  final String? pw;
  final int? birthYear;
  final LoginType loginType;
  final UserType userType;
  final Map<String, Timestamp>? bookMark;
  final Map<String, Timestamp>? wrongAnswers;

  const ModelUser({
    required this.uid,
    required this.dateCreate,
    this.email,
    this.pw,
    this.birthYear,
    required this.loginType,
    this.userType = UserType.user,
    this.bookMark,
    this.wrongAnswers,
  });

  factory ModelUser.fromJson(Map<String, dynamic> json) {
    return ModelUser(
      uid: json[keyUid] as String,
      dateCreate: json[keyDateCreate] is Timestamp
          ? json[keyDateCreate]
          : Timestamp.fromMillisecondsSinceEpoch(json[keyDateCreate]),
      email: json[keyEmail] as String?,
      pw: json[keyPassword] as String?,
      birthYear: json[keyBirthYear] as int?,
      loginType: LoginType.values.firstWhere((e) => e.name == json[keyLoginType]),
      userType: UserType.values.firstWhere((e) => e.name == json[keyUserType]),
      bookMark: (json[keyBookMark] as Map?)?.map(
            (key, value) => MapEntry(key.toString(), value as Timestamp),
      ),
      wrongAnswers: (json[keyWrongAnswers] as Map?)?.map(
            (key, value) => MapEntry(key.toString(), value as Timestamp),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      keyUid: uid,
      keyDateCreate: dateCreate,
      keyEmail: email,
      keyPassword: pw,
      keyBirthYear: birthYear,
      keyLoginType: loginType.name,
      keyUserType: userType.name,
      keyBookMark: bookMark ?? {},
      keyWrongAnswers: wrongAnswers ?? {},
    };
  }

  ModelUser copyWith({
    String? uid,
    Timestamp? dateCreate,
    String? email,
    String? pw,
    int? birthYear,
    LoginType? loginType,
    UserType? userType,
    Map<String, Timestamp>? bookMark,
    Map<String, Timestamp>? wrongAnswers,
  }) {
    return ModelUser(
      uid: uid ?? this.uid,
      dateCreate: dateCreate ?? this.dateCreate,
      email: email ?? this.email,
      pw: pw ?? this.pw,
      birthYear: birthYear ?? this.birthYear,
      loginType: loginType ?? this.loginType,
      userType: userType ?? this.userType,
      bookMark: bookMark ?? this.bookMark,
      wrongAnswers: wrongAnswers ?? this.wrongAnswers,
    );
  }
}