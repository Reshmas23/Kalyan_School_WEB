// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StudentTherapyDetailsModel {
  String docid;
  String studentAdNo;
  String studentName;
  String className;
  String classID;
  String lastday;
  String status;
  String followUp;
  int totalattendedDays;
  String studentAge;
  String studentGender;
  String studentImage;
  String dateofbirth;
  String parentName;
  String parentContact;
  String parentEmail;
  String parentImage;
  String parentDocId;
  String address;
  String city;
  String state;
  String pincode;
  String studentTherapyDiscription;
  StudentTherapyDetailsModel({
    required this.docid,
    required this.studentAdNo,
    required this.studentName,
    required this.className,
    required this.classID,
    required this.lastday,
    required this.status,
    required this.followUp,
    required this.totalattendedDays,
    required this.studentAge,
    required this.studentGender,
    required this.studentImage,
    required this.dateofbirth,
    required this.parentName,
    required this.parentContact,
    required this.parentEmail,
    required this.parentImage,
    required this.parentDocId,
    required this.address,
    required this.city,
    required this.state,
    required this.pincode,
    required this.studentTherapyDiscription,
  });
  

  StudentTherapyDetailsModel copyWith({
    String? docid,
    String? studentAdNo,
    String? studentName,
    String? className,
    String? classID,
    String? lastday,
    String? status,
    String? followUp,
    int? totalattendedDays,
    String? studentAge,
    String? studentGender,
    String? studentImage,
    String? dateofbirth,
    String? parentName,
    String? parentContact,
    String? parentEmail,
    String? parentImage,
    String? parentDocId,
    String? address,
    String? city,
    String? state,
    String? pincode,
    String? studentTherapyDiscription,
  }) {
    return StudentTherapyDetailsModel(
      docid: docid ?? this.docid,
      studentAdNo: studentAdNo ?? this.studentAdNo,
      studentName: studentName ?? this.studentName,
      className: className ?? this.className,
      classID: classID ?? this.classID,
      lastday: lastday ?? this.lastday,
      status: status ?? this.status,
      followUp: followUp ?? this.followUp,
      totalattendedDays: totalattendedDays ?? this.totalattendedDays,
      studentAge: studentAge ?? this.studentAge,
      studentGender: studentGender ?? this.studentGender,
      studentImage: studentImage ?? this.studentImage,
      dateofbirth: dateofbirth ?? this.dateofbirth,
      parentName: parentName ?? this.parentName,
      parentContact: parentContact ?? this.parentContact,
      parentEmail: parentEmail ?? this.parentEmail,
      parentImage: parentImage ?? this.parentImage,
      parentDocId: parentDocId ?? this.parentDocId,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      pincode: pincode ?? this.pincode,
      studentTherapyDiscription: studentTherapyDiscription ?? this.studentTherapyDiscription,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docid': docid,
      'studentAdNo': studentAdNo,
      'studentName': studentName,
      'className': className,
      'classID': classID,
      'lastday': lastday,
      'status': status,
      'followUp': followUp,
      'totalattendedDays': totalattendedDays,
      'studentAge': studentAge,
      'studentGender': studentGender,
      'studentImage': studentImage,
      'dateofbirth': dateofbirth,
      'parentName': parentName,
      'parentContact': parentContact,
      'parentEmail': parentEmail,
      'parentImage': parentImage,
      'parentDocId': parentDocId,
      'address': address,
      'city': city,
      'state': state,
      'pincode': pincode,
      'studentTherapyDiscription': studentTherapyDiscription,
    };
  }

  factory StudentTherapyDetailsModel.fromMap(Map<String, dynamic> map) {
    return StudentTherapyDetailsModel(
      docid: map['docid'] ??"",
      studentAdNo: map['studentAdNo'] ??"",
      studentName: map['studentName'] ??"",
      className: map['className'] ??"",
      classID: map['classID'] ??"",
      lastday: map['lastday'] ??"",
      status: map['status'] ??"",
      followUp: map['followUp'] ??"",
      totalattendedDays: map['totalattendedDays']??0,
      studentAge: map['studentAge'] ??"",
      studentGender: map['studentGender'] ??"",
      studentImage: map['studentImage'] ??"",
      dateofbirth: map['dateofbirth'] ??"",
      parentName: map['parentName'] ??"",
      parentContact: map['parentContact'] ??"",
      parentEmail: map['parentEmail'] ??"",
      parentImage: map['parentImage'] ??"",
      parentDocId: map['parentDocId'] ??"",
      address: map['address'] ??"",
      city: map['city'] ??"",
      state: map['state'] ??"",
      pincode: map['pincode'] ??"",
      studentTherapyDiscription: map['studentTherapyDiscription'] ??"",
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentTherapyDetailsModel.fromJson(String source) => StudentTherapyDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StudentTherapyDetailsModel(docid: $docid, studentAdNo: $studentAdNo, studentName: $studentName, className: $className, classID: $classID, lastday: $lastday, status: $status, followUp: $followUp, totalattendedDays: $totalattendedDays, studentAge: $studentAge, studentGender: $studentGender, studentImage: $studentImage, dateofbirth: $dateofbirth, parentName: $parentName, parentContact: $parentContact, parentEmail: $parentEmail, parentImage: $parentImage, parentDocId: $parentDocId, address: $address, city: $city, state: $state, pincode: $pincode, studentTherapyDiscription: $studentTherapyDiscription)';
  }

  @override
  bool operator ==(covariant StudentTherapyDetailsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.docid == docid &&
      other.studentAdNo == studentAdNo &&
      other.studentName == studentName &&
      other.className == className &&
      other.classID == classID &&
      other.lastday == lastday &&
      other.status == status &&
      other.followUp == followUp &&
      other.totalattendedDays == totalattendedDays &&
      other.studentAge == studentAge &&
      other.studentGender == studentGender &&
      other.studentImage == studentImage &&
      other.dateofbirth == dateofbirth &&
      other.parentName == parentName &&
      other.parentContact == parentContact &&
      other.parentEmail == parentEmail &&
      other.parentImage == parentImage &&
      other.parentDocId == parentDocId &&
      other.address == address &&
      other.city == city &&
      other.state == state &&
      other.pincode == pincode &&
      other.studentTherapyDiscription == studentTherapyDiscription;
  }

  @override
  int get hashCode {
    return docid.hashCode ^
      studentAdNo.hashCode ^
      studentName.hashCode ^
      className.hashCode ^
      classID.hashCode ^
      lastday.hashCode ^
      status.hashCode ^
      followUp.hashCode ^
      totalattendedDays.hashCode ^
      studentAge.hashCode ^
      studentGender.hashCode ^
      studentImage.hashCode ^
      dateofbirth.hashCode ^
      parentName.hashCode ^
      parentContact.hashCode ^
      parentEmail.hashCode ^
      parentImage.hashCode ^
      parentDocId.hashCode ^
      address.hashCode ^
      city.hashCode ^
      state.hashCode ^
      pincode.hashCode ^
      studentTherapyDiscription.hashCode;
  }
}
