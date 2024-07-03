import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/controller/therapy_controller/therapy_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/drop_down/therapy_list/therapy_listDropDown.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/detail_tileContainer.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/therapy_management/Students_tm/therapy_details/therapy_details.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/video_management/presentation/pages/widgets/video_widgets.dart';
import 'package:vidyaveechi_website/view/widgets/blue_Container_widget/blue_Container_widget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/route_NonSelectedContainer.dart';

class StudentDetailsInTherapy extends StatelessWidget {
  final TherapyController therapyController = Get.put(TherapyController());
  StudentDetailsInTherapy({super.key});

  @override
  Widget build(BuildContext context) {
    final data = therapyController.studentModelData.value;
    return DefaultTabController(
      length: 1,
      child: SingleChildScrollView(
        scrollDirection: ResponsiveWebSite.isMobile(context)
            ? Axis.horizontal
            : Axis.vertical,
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
                                                therapyController.ontapStudentTm
                                                    .value = false;
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
                                              title: 'Student Details'),
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
                                                therapyController.ontapStudentTm
                                                    .value = false;
                                              },
                                              child:
                                                  const RouteNonSelectedTextContainer(
                                                      title: 'Home'),
                                            ),
                                          ),
                                          const RouteSelectedTextContainer(
                                              width: 140,
                                              title: 'Student Details'),
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
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 05, left: 10),
                              child: CircleAvatar(
                                radius: 80,
                                backgroundColor: Colors.grey,
                                child: CircleAvatar(
                                    radius: 78,
                                    backgroundImage: AssetImage(
                                        'webassets/png/student.png')),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Container(
                                      width: double.infinity,
                                      height: 100,
                                      color: Colors.blue.withOpacity(0.1),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 10),
                                            child: TextFontWidget(
                                              text: data?.studentName ?? '',
                                              fontsize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20, left: 10),
                                            child: SizedBox(
                                              width: 500,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  StudentDetailTileContainer(
                                                    flex: 1,
                                                    title: 'Gender',
                                                    subtitle:
                                                        data?.gender ?? '',
                                                  ),
                                                  StudentDetailTileContainer(
                                                    flex: 1,
                                                    title: 'Date of Birth',
                                                    subtitle:
                                                        data?.dateofBirth ?? '',
                                                  ),
                                                  const StudentDetailTileContainer(
                                                    flex: 1,
                                                    title: 'Last day',
                                                    subtitle: 'March 2023',
                                                  ),
                                                  const StudentDetailTileContainer(
                                                    flex: 1,
                                                    title: 'Last day',
                                                    subtitle: 'March 2023',
                                                  ),
                                                  StudentDetailTileContainer(
                                                    flex: 1,
                                                    title: 'Admission No',
                                                    subtitle:
                                                        data?.admissionNumber ??
                                                            "",
                                                  ),
                                                
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    // flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.description),
                                              TextFontWidget(
                                                text:
                                                    'studentTherapyDiscription',
                                                //" +91 ${data?.parentPhoneNumber} ",
                                                fontsize: 12,
                                                color: Colors.blue,
                                              ),
                                              SizedBox(
                                                width: 60,
                                              ),
                        
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.man),
                                              TextFontWidget(
                                                text: 'studentAge',
                                                fontsize: 12,
                                                color: Colors.blue,
                                              )
                                            ],
                                          ),
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
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Obx(() => Row(
                                              children: [
                                                const TextFontWidget(
                                                  text: "Therapy",
                                                  fontsize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    therapyController
                                                        .ontapAddTherapy
                                                        .value = true;
                                                  },
                                                  child: therapyController
                                                              .ontapAddTherapy
                                                              .value ==
                                                          true
                                                      ? Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          SizedBox(
                                                            width: 150,
                                                       
                                                            child: Padding(
                                                              padding: const EdgeInsets.only( left: 10),
                                                              child: TherapyListDropDown(
                                                                  studentID:
                                                                      data!.docid),
                                                            ),
                                                          ),
                                                          Checkbox(value: true, onChanged: (value) {
                                                            therapyController
                                                              .ontapAddTherapy
                                                              .value = false;
                                                          },)
                                                        ],
                                                      )
                                                      : BlueContainerWidget(
                                                          title: "Add Therapy",
                                                          fontSize: 14,
                                                          color:
                                                              adminePrimayColor),
                                                )
                                              ],
                                            )),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: ListView.separated(
                                          itemBuilder: (context, index) {
                                            return const TextFontWidget(
                                              text: "• text",
                                              fontsize: 15,
                                              fontWeight: FontWeight.w400,
                                            );
                                          },
                                          itemCount: 20,
                                          separatorBuilder: (context, index) =>
                                              const SizedBox(
                                            height: 2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Column(
                  children: [
                    Container(
                      color: cWhite,
                      height: 40,
                      child: const TabBar(
                        indicatorColor: cWhite,
                        tabAlignment: TabAlignment.start,
                        isScrollable: true,
                        labelColor: Colors.blue,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 14),
                        tabs: [
                          Tab(
                            text: 'THERAPY ',
                          ),
                          // Tab(
                          //   text: 'ATTENDANCE',
                          // ),
                          // Tab(
                          //   text: 'EXAM ',
                          // )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
                child: Container(
                  width: double.infinity,
                  color: Colors.blue,
                  height: 02,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
                child: Container(
                  height: 600,
                  color: cWhite,
                  // color: Colors.amber,

                  // height: 300,
                  child: TabBarView(children: [
                    PerStudentTherapyDetails(),
                    // PerStudentFeesHistory(), //........................ Student FEES
                    // PerStudentAttendenceHistory(), //.......................... Student Attendence
                    // PerStudentExamHistory(), //............................ Student Exam History
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
