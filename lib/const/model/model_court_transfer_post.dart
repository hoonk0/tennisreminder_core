import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../value/keys.dart';
import 'model_user.dart';

class ModelCourtTransferPost {
  final String postId;
  final ModelUser transferBoardWriter;
  final Timestamp createdAt;

  final bool isExchange; //
  final bool isTransfer;

  final String courtName; // 사용자가 직접 입력한 코트 이름
  final DateTime date; // 예약 날짜
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  final String contact; // 연락처 (전화번호 or 오픈카톡)
  final String? transferExtraInfo; // 추가 정보

  ModelCourtTransferPost({
    required this.postId,
    required this.transferBoardWriter,
    required this.createdAt,
    required this.isExchange,
    required this.isTransfer,
    required this.courtName,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.contact,
    this.transferExtraInfo,
  });

  factory ModelCourtTransferPost.fromJson(Map<String, dynamic> json) {
    final startTimeParts = (json[keyTransferStartTime] as String).split(':');
    final endTimeParts = (json[keyTransferEndTime] as String).split(':');

    return ModelCourtTransferPost(
      postId: json[keyPostId] as String,
      transferBoardWriter: ModelUser.fromJson(json[keyTransferBoardWriter]),
      createdAt: json[keyCreatedAt] is Timestamp
          ? json[keyCreatedAt]
          : Timestamp.fromMillisecondsSinceEpoch(json[keyCreatedAt]),
      isExchange: json[keyIsExchange] as bool,
      isTransfer: json[keyIsTransfer] as bool,
      courtName: json[keyTransferCourtName] as String,
      date: DateTime.parse(json[keyTransferDate] as String),
      startTime: TimeOfDay(
        hour: int.parse(startTimeParts[0]),
        minute: int.parse(startTimeParts[1]),
      ),
      endTime: TimeOfDay(
        hour: int.parse(endTimeParts[0]),
        minute: int.parse(endTimeParts[1]),
      ),
      contact: json[keyContact] as String,
      transferExtraInfo: json[keyTransferExtraInfo] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      keyPostId: postId,
      keyTransferBoardWriter: transferBoardWriter.toJson(),
      keyCreatedAt: createdAt,
      keyIsExchange: isExchange,
      keyIsFinished: isTransfer,
      keyTransferCourtName: courtName,
      keyTransferDate: date.toIso8601String(),
      keyTransferStartTime:
          '${startTime.hour}:${startTime.minute.toString().padLeft(2, '0')}',
      keyTransferEndTime:
          '${endTime.hour}:${endTime.minute.toString().padLeft(2, '0')}',
      keyContact: contact,
      keyTransferExtraInfo: transferExtraInfo,
    };
  }

  ModelCourtTransferPost copyWith({
    String? postId,
    ModelUser? writer,
    Timestamp? createdAt,
    bool? isExchange,
    bool? isFinished,
    String? courtName,
    DateTime? date,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    String? contact,
    String? transferExtraInfo,
  }) {
    return ModelCourtTransferPost(
      postId: postId ?? this.postId,
      transferBoardWriter: writer ?? this.transferBoardWriter,
      createdAt: createdAt ?? this.createdAt,
      isExchange: isExchange ?? this.isExchange,
      isTransfer: isFinished ?? this.isTransfer,
      courtName: courtName ?? this.courtName,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      contact: contact ?? this.contact,
      transferExtraInfo: transferExtraInfo ?? this.transferExtraInfo,
    );
  }
}