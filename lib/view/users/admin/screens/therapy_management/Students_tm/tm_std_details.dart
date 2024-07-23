import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/controller/therapy_controller/therapy_controller.dart';
import 'package:vidyaveechi_website/model/therapy_student_model/student_therapyDetails.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/detail_tileContainer.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/therapy_management/Students_tm/therapy_details/therapy_details.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/video_management/presentation/pages/widgets/video_widgets.dart';
import 'package:vidyaveechi_website/view/widgets/blue_Container_widget/blue_Container_widget.dart';
import 'package:vidyaveechi_website/view/widgets/custom_showDilog/custom_showdilog.dart';
import 'package:vidyaveechi_website/view/widgets/loading_widget/loading_widget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/route_NonSelectedContainer.dart';
import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledContainer.dart';

class StudentDetailsInTherapy extends StatelessWidget {
  final TherapyController therapyController = Get.put(TherapyController());
  StudentDetailsInTherapy({super.key});

  @override
  Widget build(BuildContext context) {
    final data = therapyController.studentModelData.value;
    return SingleChildScrollView(
      scrollDirection:
          ResponsiveWebSite.isMobile(context) ? Axis.horizontal : Axis.vertical,
      child: Container(
        color: screenContainerbackgroundColor,
        height: 1000,
        width: ResponsiveWebSite.isDesktop(context) ? double.infinity : 1200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 25, top: 25),
              child: TextFontWidget(
                text: 'Student Details',
                fontsize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
              child: Container(
                color: cWhite,
                height: 260,
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: double.infinity,
                      color: Colors.white10,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Column(
                          children: [
                            Get.find<ClassController>()
                                        .ontapStudentsDetail
                                        .value ==
                                    true
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 08,
                                            right: 05,
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.find<ClassController>()
                                                  .ontapStudentsDetail
                                                  .value = false;
                                              Get.find<ClassController>()
                                                  .ontapClassStudents
                                                  .value = false;
                                              therapyController
                                                  .ontapStudentTm.value = false;
                                            },
                                            child:
                                                const RouteNonSelectedTextContainer(
                                                    title: 'Home'),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 08,
                                            right: 05,
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.find<ClassController>()
                                                  .ontapStudentsDetail
                                                  .value = false;
                                            },
                                            child:
                                                const RouteNonSelectedTextContainer(
                                                    title: 'Back'),
                                          ),
                                        ),
                                        const RouteSelectedTextContainer(
                                            width: 140,
                                            title: 'Student Deatils'),
                                      ],
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 08,
                                            right: 05,
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.find<ClassController>()
                                                  .ontapStudentsDetail
                                                  .value = false;
                                              Get.find<ClassController>()
                                                  .ontapClassStudents
                                                  .value = false;
                                              therapyController
                                                  .ontapStudentTm.value = false;
                                            },
                                            child:
                                                const RouteNonSelectedTextContainer(
                                                    title: 'Home'),
                                          ),
                                        ),
                                        const RouteSelectedTextContainer(
                                            width: 140,
                                            title: 'Student Deatils'),
                                      ],
                                    ),
                                  )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.blue,
                      height: 02,
                    ),
                    Expanded(
                      child: StreamBuilder(
                          stream: server
                              .collection('SchoolListCollection')
                              .doc(UserCredentialsController.schoolId)
                              .collection(UserCredentialsController.batchId!)
                              .doc(UserCredentialsController.batchId!)
                              .collection('TherapyStudents')
                              .doc(data?.docid)
                              .snapshots(),
                          builder: (context, therapyStudentSnaps) {
                            if (therapyStudentSnaps.hasData) {
                              final StudentTherapyDetailsModel therapySTdata =
                                  StudentTherapyDetailsModel.fromMap(
                                      therapyStudentSnaps.data?.data()
                                          as Map<String, dynamic>);

                              return Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 05, left: 10),
                                    child: CircleAvatar(
                                        radius: 80,
                                        backgroundColor: Colors.grey,
                                        child: therapySTdata.studentImage == ""
                                            ? const CircleAvatar(
                                                radius: 78,
                                                backgroundImage: AssetImage(
                                                    'webassets/png/student.png'))
                                            : CircleAvatar(
                                                radius: 78,
                                                backgroundImage: NetworkImage(
                                                    therapySTdata
                                                        .studentImage))),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Container(
                                            width: double.infinity,
                                            height: 100,
                                            color: Colors.blue.withOpacity(0.1),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10,
                                                              right: 10,
                                                              top: 10),
                                                      child: TextFontWidget(
                                                        text: therapySTdata
                                                            .studentName,
                                                        fontsize: 20,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 12),
                                                      child: TextFontWidget(
                                                          text: therapySTdata
                                                              .studentAge,
                                                          fontsize: 14),
                                                    )
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 20, left: 10),
                                                  child: SizedBox(
                                                    width: 500,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        StudentDetailTileContainer(
                                                          flex: 1,
                                                          title: 'Gender',
                                                          subtitle: therapySTdata
                                                              .studentGender,
                                                        ),
                                                        StudentDetailTileContainer(
                                                          flex: 2,
                                                          title:
                                                              'Date of Birth',
                                                          subtitle:
                                                              therapySTdata
                                                                  .dateofbirth,
                                                        ),
                                                        StudentDetailTileContainer(
                                                          flex: 3,
                                                          title:
                                                              'Last Date Activity',
                                                          subtitle:
                                                              therapySTdata
                                                                  .lastday,
                                                        ),
                                                        StudentDetailTileContainer(
                                                          flex: 1,
                                                          title: 'Admission No',
                                                          subtitle:
                                                              therapySTdata
                                                                  .studentAdNo,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          // flex: 1,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                        height: 20,
                                                        child: BlueContainerWidget(
                                                            title:
                                                                "Student Discription",
                                                            fontSize: 11,
                                                            color:
                                                                themeColorBlue)),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          customShowDilogBox2(
                                                              context: context,
                                                              title:
                                                                  "Student Discription",
                                                              children: [
                                                                SizedBox(
                                                                  height: 60,
                                                                  width: 400,
                                                                  child:
                                                                      TextFormFiledContainerWidget(
                                                                    hintText:
                                                                        "Enter Discription",
                                                                    title:
                                                                        "Discription",
                                                                    width: 500,
                                                                    controller:
                                                                        therapyController
                                                                            .studentDiscriptionController,
                                                                  ),
                                                                )
                                                              ],
                                                              doyouwantActionButton:
                                                                  true,
                                                              actiononTapfuction:
                                                                  () async {
                                                                await therapyController
                                                                    .studentDiscriptionData(
                                                                        studentID:
                                                                            therapySTdata.docid);
                                                              });
                                                          therapyController
                                                                  .studentDiscriptionController
                                                                  .text =
                                                              therapySTdata
                                                                  .studentTherapyDiscription;
                                                        },
                                                        child: const SizedBox(
                                                          height: 20,
                                                          child: Center(
                                                            child: Icon(
                                                              Icons.edit,
                                                              size: 18,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Expanded(
                                                    child:
                                                        SingleChildScrollView(
                                                  child: TextFontWidget(
                                                    text: therapySTdata
                                                        .studentTherapyDiscription,
                                                    fontsize: 12,
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                          color: Colors.blue.withOpacity(0.5),
                                        )),
                                        width: double.infinity,
                                        height: 200,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10),
                                              child: BlueContainerWidget(
                                                title: "Parent Details",
                                                fontSize: 12,
                                                color: themeColorBlue,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                            Expanded(
                                                flex: 3,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 80,
                                                      width: 80,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: cBlack
                                                                  .withOpacity(
                                                                      0.2)),
                                                          image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: NetworkImage(
                                                                  therapySTdata
                                                                      .parentImage))),
                                                    ),
                                                    Expanded(
                                                        child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 08),
                                                          child: TextFontWidget(
                                                              text: therapySTdata
                                                                  .parentName,
                                                              fontsize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800),
                                                        ),
                                                        TextFontWidget(
                                                            text:
                                                                'Ph no : ${therapySTdata.parentContact}',
                                                            fontsize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5),
                                                          child: TextFontWidget(
                                                              text:
                                                                  'Email : ${therapySTdata.parentEmail}',
                                                              fontsize: 11,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ],
                                                    ))
                                                  ],
                                                )),
                                            Expanded(
                                                flex: 4,
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 08,
                                                              top: 05),
                                                      child: TextFontWidget(
                                                        text:
                                                            'Address : ${therapySTdata.address}',
                                                        fontsize: 12,
                                                      ),
                                                    ),
                                                    TextFontWidget(
                                                        text:
                                                            'City : ${therapySTdata.city}',
                                                        fontsize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ],
                                                ))
                                          ],
                                        ),
                                      ))
                                ],
                              );
                            } else {
                              return const LoadingWidget();
                            }
                          }),
                    )
                  ],
                ),
              ),
            ),
             Expanded(
              child: PerStudentTherapyDetails(),
            )
          ],
        ),
      ),
    );
  }
}
