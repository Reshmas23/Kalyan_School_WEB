import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:progress_state_button/progress_button.dart';
import 'package:uuid/uuid.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/model/notification_model/notification_model.dart';
import 'package:vidyaveechi_website/model/userDeviceModel/userDeviceModel.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class NotificationController extends GetxController {
  TextEditingController headingController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  List<UserDeviceIDModel> selectedUSerUIDList = [];
  Rx<ButtonState> buttonstate = ButtonState.idle.obs;
  final formKey = GlobalKey<FormState>();
  RxBool ontapClassWiseSender = false.obs;
  RxBool selectStudent = false.obs;
  RxBool selectParent = false.obs;
  RxBool selectTeacher = false.obs;
  RxBool selectClass = false.obs;

  Future<void> sendMessageSelectedUSers() async {
    buttonstate.value = ButtonState.loading;
    try {
      if (selectStudent.value && selectParent.value && selectTeacher.value) {
        return fetchStudentID()
            .then((studentID) => fetchParentID())
            .then((parentID) => fetchTeacherID());
      } else if (selectStudent.value && selectParent.value) {
        return fetchStudentID().then((studentID) => fetchParentID());
      } else if (selectStudent.value && selectTeacher.value) {
        return fetchStudentID().then((studentID) => fetchTeacherID());
      } else if (selectParent.value && selectTeacher.value) {
        // Missing logic here, handle if needed
      } else if (selectStudent.value) {
        return fetchStudentID();
      } else if (selectParent.value) {
        return fetchParentID();
      } else if (selectTeacher.value) {
        return fetchTeacherID();
      } else {
        return; // No selection made
      }
    } catch (e) {
      showToast(msg: 'Somthing went wrong please try again');
      buttonstate.value = ButtonState.fail;
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        buttonstate.value = ButtonState.idle;
      });
      if (kDebugMode) {
        log(e.toString());
      }
    }
  }

  Future<void> fetchStudentID() async {
    log('fetchStudentID');
    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection('AllUsersDeviceID')
        .get()
        .then((value) async {
      for (var i = 0; i < value.docs.length; i++) {
        if (selectClass.value == true) {
          if (selectStudent.value == true &&
              selectTeacher.value == true &&
              value.docs[i].data()['userrole'] == 'student' &&
              value.docs[i].data()['classID'] ==
                  Get.find<ClassController>().classDocID.value) {
            log('else teacher Condition');
            final list = value.docs
                .map((e) => UserDeviceIDModel.fromMap(e.data()))
                .toList();
            selectedUSerUIDList.add(list[i]);
          }
        } else {
          if (selectStudent.value == true &&
              value.docs[i].data()['userrole'] == 'student') {
            log('if teacher Condition');
            log('Parent UId ${value.docs[i].data()['uid']}');
            final list = value.docs
                .map((e) => UserDeviceIDModel.fromMap(e.data()))
                .toList();
            selectedUSerUIDList.add(list[i]);
          }
        }
      }
    });
  }

  Future<void> fetchParentID() async {
    log('fetchParentID');
    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection('AllUsersDeviceID')
        .get()
        .then((value) async {
      for (var i = 0; i < value.docs.length; i++) {
        if (selectClass.value == true) {
          if (selectClass.value == true &&
              selectParent.value == true &&
              value.docs[i].data()['userrole'] == 'parent' &&
              value.docs[i].data()['classID'] ==
                  Get.find<ClassController>().classDocID.value) {
            log('else teacher Condition');
            final list = value.docs
                .map((e) => UserDeviceIDModel.fromMap(e.data()))
                .toList();
            selectedUSerUIDList.add(list[i]);
          }
        } else {
          if (selectParent.value == true &&
              value.docs[i].data()['userrole'] == 'parent') {
            log('if teacher Condition');
            log('Parent UId ${value.docs[i].data()['uid']}');
            final list = value.docs
                .map((e) => UserDeviceIDModel.fromMap(e.data()))
                .toList();
            selectedUSerUIDList.add(list[i]);
          }
        }
      }
    });
  }

  Future<void> fetchTeacherID() async {
    log('fetchParentID');
    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection('AllUsersDeviceID')
        .get()
        .then((value) async {
      for (var i = 0; i < value.docs.length; i++) {
        if (selectClass.value == true) {
          if (selectClass.value == true &&
              selectTeacher.value == true &&
              value.docs[i].data()['userrole'] == 'teacher' &&
              value.docs[i].data()['classID'] ==
                  Get.find<ClassController>().classDocID.value) {
            log('else teacher Condition');
            final list = value.docs
                .map((e) => UserDeviceIDModel.fromMap(e.data()))
                .toList();
            selectedUSerUIDList.add(list[i]);
          }
        } else {
          if (selectTeacher.value == true &&
              value.docs[i].data()['userrole'] == 'teacher') {
            log('if teacher Condition');
            log('Parent UId ${value.docs[i].data()['uid']}');
            final list = value.docs
                .map((e) => UserDeviceIDModel.fromMap(e.data()))
                .toList();
            selectedUSerUIDList.add(list[i]);
          }
        }
      }
    });
  }

  Future<void> sendNotificationSelectedUsers(
      {required IconData icon,
      required Color whiteshadeColor,
      required Color containerColor}) async {
    try {
      log('selectedUSerUIDList  $selectedUSerUIDList');

      final uuid = const Uuid().v1();
      NotificationModel messageDetails = NotificationModel(
          dateTime: DateTime.now().toString(),
          docid: uuid,
          open: false,
          icon: icon,
          messageText: messageController.text,
          headerText: headingController.text,
          whiteshadeColor: whiteshadeColor,
          containerColor: containerColor);
      for (var i = 0; i < selectedUSerUIDList.length; i++) {
        await server
            .collection('SchoolListCollection')
            .doc(UserCredentialsController.schoolId)
            .collection('AllUsersDeviceID')
            .doc(selectedUSerUIDList[i].uid)
            .set({'message': true,'docid':selectedUSerUIDList[i].uid}, SetOptions(merge: true)).then(
                (value) async {
          await server
              .collection('SchoolListCollection')
              .doc(UserCredentialsController.schoolId)
              .collection('AllUsersDeviceID')
              .doc(selectedUSerUIDList[i].uid)
              .get()
              .then((value) async {
            await sendPushMessage(selectedUSerUIDList[i].devideID,
                messageController.text, headingController.text);
          }).then((value) async {
            await server
                .collection('SchoolListCollection')
                .doc(UserCredentialsController.schoolId)
                .collection('AllUsersDeviceID')
                .doc(selectedUSerUIDList[i].uid)
                .collection("Notification_Message")
                .doc(uuid)
                .set(messageDetails.toMap());
          });
        });
      }
      ontapClassWiseSender.value == false;
      selectParent.value = false;
      selectStudent.value = false;
      selectTeacher.value = false;
      selectClass.value = false;
      selectedUSerUIDList.clear();
      headingController.clear();
      messageController.clear();
      buttonstate.value = ButtonState.success;
      await Future.delayed(const Duration(seconds: 2)).then((vazlue) {
        buttonstate.value = ButtonState.idle;
      });
    } catch (e) {
      showToast(msg: 'Somthing went wrong please try again');
      buttonstate.value = ButtonState.fail;
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        buttonstate.value = ButtonState.idle;
      });
      if (kDebugMode) {
        log(e.toString());
      }
    }
  }
  RxString pushNotficationKey = ''.obs;
  getPushNotification() async {
    FirebaseFirestore.instance
        .collection('PushNotification')
        .doc('key')
        .get()
        .then((value) async {
      pushNotficationKey.value = value.data()?['key'];
    });
  }
  Future<void> sendPushMessage(String token, String body, String title) async {
   await  getPushNotification();
    final serverKey = pushNotficationKey.value;
    final Uri url = Uri.parse(
        'https://fcm.googleapis.com/v1/projects/kalyanschools-b1b08/messages:send');

    final Map<String, dynamic> message = {
      'message': {
        'token': token,
        'notification': {
          'title': title,
          'body': body,
        },
        'android': {
          'notification': {
            'title': title,
            'body': body,
            'click_action': 'TOP_STORY_ACTIVITY'
          },
          'data': {'story_id': 'story_12345'}
        },
        'apns': {
          'payload': {
            'aps': {'category': 'NEW_MESSAGE_CATEGORY'}
          },
        },
        'data': {
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          'status': 'done',
          'body': body,
          'title': title,
        },
      },
    };

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $serverKey',
        },
        body: jsonEncode(message),
      );

      if (response.statusCode == 200) {
        print('Notification sent successfully!');
      } else {
        print('Failed to send notification: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Exception caught sending notification: $e');
    }
  } 

  Future<void> userparentNotification({
    required String parentID,
    required IconData icon,
    required String messageText,
    required String headerText,
    required Color whiteshadeColor,
    required Color containerColor,
  }) async {
    final String docid = uuid.v1();
    try {
      log('Calling user notification');
      final details = NotificationModel(
          icon: icon,
          messageText: messageText,
          headerText: headerText,
          whiteshadeColor: whiteshadeColor,
          containerColor: containerColor,
          open: false,
          docid: docid,
          dateTime: DateTime.now().toString());
      await server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection("AllUsersDeviceID")
          .doc(parentID)
          .collection("Notification_Message")
          .doc(docid)
          .set(details.toMap())
          .then((value) async {
        await server
            .collection('SchoolListCollection')
            .doc(UserCredentialsController.schoolId)
            .collection("AllUsersDeviceID")
            .doc(parentID)
            .get()
            .then((value) async {
          await sendPushMessage(value['devideID'], messageText, headerText);
        });
      });
    } catch (e) {}
  }

  Future<void> userStudentNotification({
    required String studentID,
    required IconData icon,
    required String messageText,
    required String headerText,
    required Color whiteshadeColor,
    required Color containerColor,
  }) async {
    final String docid = uuid.v1();
    try {
      print(messageText);
      log('Calling user notification');
      final details = NotificationModel(
          icon: icon,
          messageText: messageText,
          headerText: headerText,
          whiteshadeColor: whiteshadeColor,
          containerColor: containerColor,
          open: false,
          docid: docid,
          dateTime: DateTime.now().toString());
      await server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection("AllUsersDeviceID")
          .doc(studentID)
          .collection("Notification_Message")
          .doc(docid)
          .set(details.toMap())
          .then((value) async {
        await server
            .collection('SchoolListCollection')
            .doc(UserCredentialsController.schoolId)
            .collection("AllUsersDeviceID")
            .doc(studentID)
            .get()
            .then((value) async {
          await sendPushMessage(value['devideID'], messageText, headerText);
        });
      });
    } catch (e) {
      log(e.toString());
    }
  }
}

class WaringNotification {
  Color whiteshadeColor = const Color.fromARGB(255, 241, 134, 120);
  Color containerColor = const Color.fromARGB(255, 237, 95, 75);
  IconData icon = Icons.warning_rounded;
}

class InfoNotification {
  Color whiteshadeColor = const Color.fromARGB(255, 63, 162, 232);
  Color containerColor = const Color.fromARGB(255, 4, 130, 225);
  IconData icon = Icons.warning_rounded;
}
