import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/therapy_controller/therapy_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/drop_down/therapy_list/therapy_listDropDown.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/therapy_management/Students_tm/therapy_details/show_dialogbox.dart/therapy_box.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/therapy_management/Students_tm/therapy_details/therapy_list.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/video_management/presentation/pages/widgets/video_widgets.dart';
import 'package:vidyaveechi_website/view/widgets/blue_Container_widget/blue_Container_widget.dart';
import 'package:vidyaveechi_website/view/widgets/loading_widget/loading_widget.dart';

class PerStudentTherapyDetails extends StatelessWidget {
  const PerStudentTherapyDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          width: 1200,
          color: Colors.blue.withOpacity(0.1),
          child: Row(
            children: [
              const Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFontWidget(
                    text: '''STUDENT THERAPIES'S''',
                    fontsize: 10,
                    fontWeight: FontWeight.bold,
                    color: cBlack,
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: SizedBox(
                    height: 30,
                    child: StreamBuilder(
                        stream: server
                            .collection('SchoolListCollection')
                            .doc(UserCredentialsController.schoolId)
                            .collection(UserCredentialsController.batchId!)
                            .doc(UserCredentialsController.batchId!)
                            .collection('TherapyStudents')
                            .doc(Get.find<TherapyController>()
                                .studentModelData
                                .value!
                                .docid)
                            .collection('StudentTherapy')
                            .snapshots(),
                        builder: (context, studentTherapysnapshot) {
                          if (studentTherapysnapshot.hasData) {
                            return ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () async {
                                      await server
                                          .collection('SchoolListCollection')
                                          .doc(UserCredentialsController
                                              .schoolId)
                                          .collection(UserCredentialsController
                                              .batchId!)
                                          .doc(UserCredentialsController
                                              .batchId!)
                                          .collection('TherapyStudents')
                                          .doc(Get.find<TherapyController>()
                                              .studentModelData
                                              .value!
                                              .docid)
                                          .collection('StudentTherapy')
                                          .doc(studentTherapysnapshot
                                              .data!.docs[index]['docid'])
                                          .delete();
                                    },
                                    child: Container(
                                      width: 160,
                                      decoration: BoxDecoration(
                                        color: cWhite,
                                        border: Border.all(
                                            color: cred.withOpacity(0.4),
                                            width: 2),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 02),
                                            child: TextFontWidget(
                                                text: studentTherapysnapshot
                                                    .data!
                                                    .docs[index]['TherapyName'],
                                                fontsize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: cBlack),
                                          ),
                                          const Icon(
                                            Icons.delete_outline,
                                            color: Colors.red,
                                            size: 14,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    width: 05,
                                  );
                                },
                                itemCount:
                                    studentTherapysnapshot.data!.docs.length);
                          } else {
                            return const SizedBox();
                          }
                        })),
              ),
              Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                      Get.find<TherapyController>().getShowDilogueToAddSection(
                        context,
                      );
                    },
                    child: Container(
                      color: const Color.fromARGB(255, 60, 204, 65),
                      child: const Center(
                        child: TextFontWidget(
                          text: "+ ADD SECTION",
                          fontsize: 12.5,
                          fontWeight: FontWeight.bold,
                          color: cWhite,
                        ),
                      ),
                    ),
                  )),
              Obx(() => Expanded(
                  flex: 4,
                  child: Get.find<TherapyController>().ontapAddTherapy.value ==
                          true
                      ? Row(
                          children: [
                            SizedBox(
                              width: 200,
                              child: TherapyListDropDown(
                                  studentID: Get.find<TherapyController>()
                                      .studentModelData
                                      .value!
                                      .docid),
                            ),
                            Checkbox(
                              value: true,
                              onChanged: (value) {
                                Get.find<TherapyController>()
                                    .ontapAddTherapy
                                    .value = false;
                              },
                            )
                          ],
                        )
                      : GestureDetector(
                          onTap: () {
                            Get.find<TherapyController>()
                                .allTherapyList
                                .clear();
                            Get.find<TherapyController>()
                                .ontapAddTherapy
                                .value = true;
                          },
                          child: BlueContainerWidget(
                            color: themeColorBlue,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            title: "Add Therapy",
                          ),
                        ))),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0, right: 0, top: 08),
                  child: Container(
                    color: cWhite,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: BlueContainerWidget(
                              title: '''Student Therapy History's''',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: themeColorBlue),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                      child: StreamBuilder(
                          stream: server
                              .collection("SchoolListCollection")
                              .doc(UserCredentialsController.schoolId)
                              .collection(UserCredentialsController.batchId!)
                              .doc(UserCredentialsController.batchId!)
                              .collection("TherapyStudents")
                              .doc(Get.find<TherapyController>()
                                  .studentModelData
                                  .value!
                                  .docid)
                              .collection("TherapyHistory")
                              .snapshots(),
                          builder: (context, dateSnaps) {
                            if (dateSnaps.hasData) {
                              return ListView.separated(
                                itemBuilder: (context, index) {
                                  final data =
                                      dateSnaps.data!.docs[index].data();

                                  return GestureDetector(
                                      onTap: () {
                                        detailsOfStudentsInTherapy(context);
                                      },
                                      child: TherapyListContainer(
                                        index: index,
                                        data: data,
                                      ));
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    height: 02,
                                  );
                                },
                                itemCount: dateSnaps.data!.docs.length,
                              );
                            } else {
                              return const LoadingWidget();
                            }
                          })),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
