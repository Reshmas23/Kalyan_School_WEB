import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:uuid/uuid.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/controller/notification_controller/notification_Controller.dart';
import 'package:vidyaveechi_website/model/parent_model/parent_model.dart';
import 'package:vidyaveechi_website/model/student_model/student_model.dart';
import 'package:vidyaveechi_website/model/therapy_model/therapy_model.dart';
import 'package:vidyaveechi_website/model/therapy_student_model/student_therapyDetails.dart';
import 'package:vidyaveechi_website/model/therapy_student_model/therapy_student_model.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/video_management/presentation/pages/widgets/video_widgets.dart';
import 'package:vidyaveechi_website/view/widgets/notification_color/notification_color_widget.dart';

class TherapyController extends GetxController {
  RxBool ontapStudentTm = false.obs;
  RxBool therapyhome = true.obs;
    Rxn<StudentModel> studentModelData = Rxn<StudentModel>();
  RxBool sendNotificationToUsers = false.obs;
  Rx<ButtonState> buttonstate = ButtonState.idle.obs;
  Rxn<TherapyModel> therapyModelData = Rxn<TherapyModel>();
  
  

  NotificationController notificationController =
      Get.put(NotificationController());
  final formKey = GlobalKey<FormState>();
  Rxn<StudentTherapyModel> studentTherapyModel = Rxn<StudentTherapyModel>();
  RxBool onClassWiseSearchofTm = false.obs;

  TextEditingController therapyNameController = TextEditingController();
  TextEditingController therapyDiscriptionController = TextEditingController();
  TextEditingController therapiestController = TextEditingController();
  TextEditingController therapydurationController = TextEditingController();
  List<TherapyModel> allTherapyList = [];
  List<StudentModel> classwiseStudetsList = [];
  String therapyName = '';
  String therapyId = '';
  String studentName = '';
  String studentAdNo = '';
  String studentDocId = '';
  TextEditingController therapyDayController = TextEditingController();
  TextEditingController therapyStatusController = TextEditingController();
  TextEditingController therapyFollowUpController = TextEditingController();

  final _firebase = server
      .collection('SchoolListCollection')
      .doc(UserCredentialsController.schoolId)
      .collection(UserCredentialsController.batchId!)
      .doc(UserCredentialsController.batchId!)
      .collection('classes');
  clearFields() {
    therapyNameController.clear();
    therapyDiscriptionController.clear();
    therapiestController.clear();
    therapydurationController.clear();
    therapyName = '';
    therapyId = '';
    studentName = '';
    studentAdNo = '';
    studentDocId = '';
  }

  Future<void> createTherapy() async {
    final uuid = const Uuid().v1();
    final therapyModel = TherapyModel(
      docid: uuid,
      therapyName: therapyNameController.text,
      therapyDes: therapyDiscriptionController.text,
      therapistNAme: therapiestController.text,
      duration: therapydurationController.text,
    );

    try {
      await server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('Therapy')
          .doc(therapyModel.docid)
          .set(therapyModel.toMap())
          .then((value) async {
        clearFields();
        buttonstate.value = ButtonState.success;
        showToast(msg: "Therapy Created Successfully");
        await Future.delayed(const Duration(seconds: 2)).then((vazlue) {
          buttonstate.value = ButtonState.idle;
        });
      });
    } catch (e) {
      buttonstate.value = ButtonState.fail;
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        buttonstate.value = ButtonState.idle;
      });
      log("Error .... $e");
    }
  }

  Future<void> addTherapyStudent() async {
    final stdTherapyModel = StudentTherapyModel(
      studentDocId: studentDocId,
      studentAdNo: studentAdNo,
      studentName: studentName,
      therapyName: therapyName,
      therapyId: therapyId,
      className: Get.find<ClassController>().className.value,
      classID: Get.find<ClassController>().classDocID.value,
      day: "",
      status: "",
      followUp: "",
    );

    try {
      await server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('Therapy')
          .doc(therapyId)
          .collection('students')
          .doc(studentDocId)
          .set(stdTherapyModel.toMap())
          .then((value) async {
        buttonstate.value = ButtonState.success;
        showToast(msg: "Student added Successfully");
        await Future.delayed(const Duration(seconds: 2)).then((vazlue) {
          buttonstate.value = ButtonState.idle;
        });
      });
    } catch (e) {
      buttonstate.value = ButtonState.fail;
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        buttonstate.value = ButtonState.idle;
      });
      log("Error .... $e");
    }
  }

  Future<void> editTherapyStudent(
      {required StudentTherapyModel stdTherapyModel}) async {
    try {
      await server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('Therapy')
          .doc(stdTherapyModel.therapyId)
          .collection('students')
          .doc(stdTherapyModel.studentDocId)
          .update({
        'day': therapyDayController.text,
        'status': therapyStatusController.text,
        'followUp': therapyFollowUpController.text,
      }).then((value) async {
        buttonstate.value = ButtonState.success;
        showToast(msg: "Student details updated Successfully");
        await Future.delayed(const Duration(seconds: 2)).then((vazlue) {
          buttonstate.value = ButtonState.idle;
        });
      });
    } catch (e) {
      buttonstate.value = ButtonState.fail;
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        buttonstate.value = ButtonState.idle;
      });
      log("Error .... $e");
    }
  }

  Future<List<TherapyModel>> fetchTherapyList() async {
    final firebase = await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('Therapy')
        .get();

    for (var i = 0; i < firebase.docs.length; i++) {
      final list =
          firebase.docs.map((e) => TherapyModel.fromMap(e.data())).toList();
      allTherapyList.add(list[i]);
    }
    return allTherapyList;
  }

  Future<List<StudentModel>> fetchClassWiseStudents() async {
    final firebase = await _firebase
        .doc(Get.find<ClassController>().classDocID.value)
        .collection('Students')
        .get();

    for (var i = 0; i < firebase.docs.length; i++) {
      final list =
          firebase.docs.map((e) => StudentModel.fromMap(e.data())).toList();
      classwiseStudetsList.add(list[i]);
    }
    return classwiseStudetsList;
  }

  Future<void> sendTherapyNotificationToUSers(
      {required String studentID,
      required String title,
      required String body}) async {
    try {
      String parentID = '';
      await server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection('AllStudents')
          .doc(studentID)
          .get()
          .then((value) {
        parentID = value.data()?['parentId'];
        print("object $parentID");
      }).then((value) async {
        await server
            .collection('SchoolListCollection')
            .doc(UserCredentialsController.schoolId)
            .collection('AllUsersDeviceID')
            .doc(parentID)
            .get()
            .then((parentvalue) async {
          notificationController.sendPushMessage(
              parentvalue.data()?['devideID'], body, title);
          notificationController.userparentNotification(
              parentID: parentID,
              icon: SuccessNotifierSetup().icon,
              messageText: body,
              headerText: title,
              whiteshadeColor: SuccessNotifierSetup().whiteshadeColor,
              containerColor: SuccessNotifierSetup().containerColor);
        });
        await server
            .collection('SchoolListCollection')
            .doc(UserCredentialsController.schoolId)
            .collection('AllUsersDeviceID')
            .doc(studentID)
            .get()
            .then((studentvalue) async {
          notificationController.sendPushMessage(
              studentvalue.data()?['devideID'], body, title);
          notificationController.userparentNotification(
              parentID: studentID,
              icon: SuccessNotifierSetup().icon,
              messageText: body,
              headerText: title,
              whiteshadeColor: SuccessNotifierSetup().whiteshadeColor,
              containerColor: SuccessNotifierSetup().containerColor);
        });
      });
      sendNotificationToUsers.value = true;
    } catch (e) {
      sendNotificationToUsers.value = false;
      // showToast(msg: "Something Wrong please try again");
    }
  }

  Future<void> addStudentinTherapySection({
    required String studentID,
  }) async {
    try {
      server
          .collection("SchoolListCollection")
          .doc(UserCredentialsController.schoolId)
          .collection("AllStudents")
          .doc(studentID)
          .get()
          .then((studentDetails) async {
        final data = studentDetails.data();
        ParentModel parentDetails = await getParentDeatils(data?['parentId']);
        final studentDOB = data?['dateofBirth'] ?? "";

        DateTime parseDater = parseDate(studentDOB);
        DateTime atDate = DateTime.now();
        Age ageCalculate = calculateAgeAtDate(parseDater, atDate);
        print('Age at $atDate: $ageCalculate');

        final StudentTherapyDetailsModel studentDeatil =
            StudentTherapyDetailsModel(
          address: data?['houseName'] ?? "",
          city: data?['place'] ?? "",
          classID: data?['classId'] ?? "",
          className: await getStudetClassName(data?['classId']),
          dateofbirth: studentDOB,
          docid: studentID,
          followUp: "",
          lastday: DateTime.now().toString(),
          parentContact: data?['parentPhoneNumber'] ?? "",
          parentDocId: data?['parentId'] ?? "",
          parentEmail: parentDetails.parentEmail ?? "",
          parentImage: parentDetails.profileImageURL ?? "",
          parentName: parentDetails.parentName ?? "",
          pincode: parentDetails.pincode ?? "",
          state: parentDetails.state ?? "",
          status: "",
          studentAdNo: data?['admissionNumber'] ?? "",
          studentAge: ageCalculate.toString(),
          studentGender: data?['gender'] ?? "",
          studentImage: data?['profileImageUrl'] ?? "",
          studentName: data?['studentName'] ?? "",
          studentTherapyDiscription: "",
          totalattendedDays: 0,
        );
        await server
            .collection("SchoolListCollection")
            .doc(UserCredentialsController.schoolId)
            .collection(UserCredentialsController.batchId!)
            .doc(UserCredentialsController.batchId!)
            .collection("TherapyStudents")
            .doc(studentID)
            .set(studentDeatil.toMap(), SetOptions(merge: true))
            .then((value) async {
          await server
              .collection("SchoolListCollection")
              .doc(UserCredentialsController.schoolId)
              .collection(UserCredentialsController.batchId!)
              .doc(UserCredentialsController.batchId!)
              .collection("TherapyStudents")
              .doc(studentID)
              .update({
            "address": data?['houseName'] ?? "",
            "city": data?['place'] ?? "",
            "classID": data?['classId'] ?? "",
            "className": await getStudetClassName(data?['classId']),
            "dateofbirth": studentDOB,
            "docid": studentID,
            "parentContact": data?['parentPhoneNumber'] ?? "",
            "parentDocId": data?['parentId'] ?? "",
            "parentEmail": parentDetails.parentEmail ?? "",
            "parentImage": parentDetails.profileImageURL ?? "",
            "parentName": parentDetails.parentName ?? "",
            "pincode": parentDetails.pincode ?? "",
            "state": parentDetails.state ?? "",
            "studentAdNo": data?['admissionNumber'] ?? "",
            "studentAge": ageCalculate.toString(),
            "studentGender": data?['gender'] ?? "",
            "studentImage": data?['profileImageUrl'] ?? "",
            "studentName": data?['studentName'] ?? "",
          });
        });
      });
    } catch (e) {
      log(e.toString());
    }
  }

  RxBool ontapAddTherapy = false.obs;
  RxString selectedTherapyID = "".obs;
  RxString selectedTherapyName = "".obs;
  List<TherapyModel> allTherapiesList = [];
  Future<List<TherapyModel>> fetchAllTherapy() async {
    ontapAddTherapy.value = true;
    final firebase = await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('Therapy')
        .get();

    for (var i = 0; i < firebase.docs.length; i++) {
      final list =
          firebase.docs.map((e) => TherapyModel.fromMap(e.data())).toList();
      allTherapiesList.add(list[i]);
    }
    return allTherapiesList;
  }

  Future<void> addTherapyForSelectedStudent(String studentID) async {
    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('TherapyStudents')
        .doc(studentID)
        .collection('StudentTherapy')
        .doc(selectedTherapyID.value)
        .set({
      'docid': selectedTherapyID.value,
      'TherapyName': selectedTherapyName.value
    }).then((value) async {
      ontapAddTherapy.value = false;
      showToast(msg: "${selectedTherapyName.value} Added");
    });
  }
}

Future<String> getStudetClassName(String classDocID) async {
  final results = await server
      .collection("SchoolListCollection")
      .doc(UserCredentialsController.schoolId)
      .collection(UserCredentialsController.batchId!)
      .doc(UserCredentialsController.batchId!)
      .collection("classes")
      .doc(classDocID)
      .get();
  return results.data()?['className'];
}

Future<ParentModel> getParentDeatils(String parentID) async {
  final results = await server
      .collection("SchoolListCollection")
      .doc(UserCredentialsController.schoolId)
      .collection('AllParents')
      .doc(parentID)
      .get();
  return ParentModel.fromMap(results.data()!);
}

DateTime parseDate(String dateString) {
  List<String> parts = dateString.split('-');
  int day = int.parse(parts[0]);
  int month = int.parse(parts[1]);
  int year = int.parse(parts[2]);
  return DateTime(year, month, day);
}

class Age {
  int years;
  int months;
  int days;

  Age(this.years, this.months, this.days);

  @override
  String toString() {
    return '$years years, $months months, and $days days';
  }
}

Age calculateAgeAtDate(DateTime birthDate, DateTime atDate) {
  int years = atDate.year - birthDate.year;
  int months = atDate.month - birthDate.month;
  int days = atDate.day - birthDate.day;

  // Adjust negative days and months
  if (days < 0) {
    months--;
    days += DateTime(atDate.year, atDate.month - 1, 0).day;
  }
  if (months < 0) {
    years--;
    months += 12;
  }

  return Age(years, months, days);
}
