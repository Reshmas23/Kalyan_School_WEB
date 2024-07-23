// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddSectionModel {
  String docid;
  String theraphyName;
  String theraphyId;
  String dateTime;
  String thStartTime;
  String thEndTime;
  String evaluation;
  String duration;
  AddSectionModel({
    required this.docid,
    required this.theraphyName,
    required this.theraphyId,
    required this.dateTime,
    required this.thStartTime,
    required this.thEndTime,
    required this.evaluation,
    required this.duration,
  });

  AddSectionModel copyWith({
    String? docid,
    String? theraphyName,
    String? theraphyId,
    String? dateTime,
    String? thStartTime,
    String? thEndTime,
    String? evaluation,
    String? duration,
  }) {
    return AddSectionModel(
      docid: docid ?? this.docid,
      theraphyName: theraphyName ?? this.theraphyName,
      theraphyId: theraphyId ?? this.theraphyId,
      dateTime: dateTime ?? this.dateTime,
      thStartTime: thStartTime ?? this.thStartTime,
      thEndTime: thEndTime ?? this.thEndTime,
      evaluation: evaluation ?? this.evaluation,
      duration: duration ?? this.duration,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docid': docid,
      'theraphyName': theraphyName,
      'theraphyId': theraphyId,
      'dateTime': dateTime,
      'thStartTime': thStartTime,
      'thEndTime': thEndTime,
      'evaluation': evaluation,
      'duration': duration,
    };
  }

  factory AddSectionModel.fromMap(Map<String, dynamic> map) {
    return AddSectionModel(
      docid: map['docid'] ??'',
      theraphyName: map['theraphyName'] ??'',
      theraphyId: map['theraphyId'] ??'',
      dateTime: map['dateTime'] ??'',
      thStartTime: map['thStartTime'] ??'',
      thEndTime: map['thEndTime'] ??'',
      evaluation: map['evaluation'] ??'',
      duration: map['duration'] ??'',
    );
  }

  String toJson() => json.encode(toMap());

  factory AddSectionModel.fromJson(String source) => AddSectionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddSectionModel(docid: $docid, theraphyName: $theraphyName, theraphyId: $theraphyId, dateTime: $dateTime, thStartTime: $thStartTime, thEndTime: $thEndTime, evaluation: $evaluation, duration: $duration)';
  }

  @override
  bool operator ==(covariant AddSectionModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.docid == docid &&
      other.theraphyName == theraphyName &&
      other.theraphyId == theraphyId &&
      other.dateTime == dateTime &&
      other.thStartTime == thStartTime &&
      other.thEndTime == thEndTime &&
      other.evaluation == evaluation &&
      other.duration == duration;
  }

  @override
  int get hashCode {
    return docid.hashCode ^
      theraphyName.hashCode ^
      theraphyId.hashCode ^
      dateTime.hashCode ^
      thStartTime.hashCode ^
      thEndTime.hashCode ^
      evaluation.hashCode ^
      duration.hashCode;
  }
}
class StudentAsignTheraphyModel {
    String docid;
    String TherapyName;
  StudentAsignTheraphyModel({
    required this.docid,
    required this.TherapyName,
  });

  StudentAsignTheraphyModel copyWith({
    String? docid,
    String? TherapyName,
  }) {
    return StudentAsignTheraphyModel(
      docid: docid ?? this.docid,
      TherapyName: TherapyName ?? this.TherapyName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docid': docid,
      'TherapyName': TherapyName,
    };
  }

  factory StudentAsignTheraphyModel.fromMap(Map<String, dynamic> map) {
    return StudentAsignTheraphyModel(
      docid: map['docid'] ??'',
      TherapyName: map['TherapyName'] ??'',
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentAsignTheraphyModel.fromJson(String source) => StudentAsignTheraphyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'StudentAsignTheraphyModel(docid: $docid, TherapyName: $TherapyName)';

  @override
  bool operator ==(covariant StudentAsignTheraphyModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.docid == docid &&
      other.TherapyName == TherapyName;
  }

  @override
  int get hashCode => docid.hashCode ^ TherapyName.hashCode;
  }