// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StudentConsultModel {
  String docid;
  String startTime;
  String endTime;
  String date;
  String evaluation;
  String consultantName;
  String therapyName;
  String therapyID;
  StudentConsultModel({
    required this.docid,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.evaluation,
    required this.consultantName,
    required this.therapyName,
    required this.therapyID,
  });

  StudentConsultModel copyWith({
    String? docid,
    String? startTime,
    String? endTime,
    String? date,
    String? evaluation,
    String? consultantName,
    String? therapyName,
    String? therapyID,
  }) {
    return StudentConsultModel(
      docid: docid ?? this.docid,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      date: date ?? this.date,
      evaluation: evaluation ?? this.evaluation,
      consultantName: consultantName ?? this.consultantName,
      therapyName: therapyName ?? this.therapyName,
      therapyID: therapyID ?? this.therapyID,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docid': docid,
      'startTime': startTime,
      'endTime': endTime,
      'date': date,
      'evaluation': evaluation,
      'consultantName': consultantName,
      'therapyName': therapyName,
      'therapyID': therapyID,
    };
  }

  factory StudentConsultModel.fromMap(Map<String, dynamic> map) {
    return StudentConsultModel(
      docid: map['docid'] ??"",
      startTime: map['startTime'] ??"",
      endTime: map['endTime'] ??"",
      date: map['date'] ??"",
      evaluation: map['evaluation'] ??"",
      consultantName: map['consultantName'] ??"",
      therapyName: map['therapyName'] ??"",
      therapyID: map['therapyID'] ??"",
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentConsultModel.fromJson(String source) => StudentConsultModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StudentConsultModel(docid: $docid, startTime: $startTime, endTime: $endTime, date: $date, evaluation: $evaluation, consultantName: $consultantName, therapyName: $therapyName, therapyID: $therapyID)';
  }

  @override
  bool operator ==(covariant StudentConsultModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.docid == docid &&
      other.startTime == startTime &&
      other.endTime == endTime &&
      other.date == date &&
      other.evaluation == evaluation &&
      other.consultantName == consultantName &&
      other.therapyName == therapyName &&
      other.therapyID == therapyID;
  }

  @override
  int get hashCode {
    return docid.hashCode ^
      startTime.hashCode ^
      endTime.hashCode ^
      date.hashCode ^
      evaluation.hashCode ^
      consultantName.hashCode ^
      therapyName.hashCode ^
      therapyID.hashCode;
  }
}
