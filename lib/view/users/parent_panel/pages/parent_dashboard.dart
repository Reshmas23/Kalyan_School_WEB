// import 'package:dash_board/view/colors/colors.dart';
// import 'package:dash_board/view/pages/home/users_panel/parent_panel/pages/parent_dashboard/sections/attendance/circularprogress.dart';
// import 'package:dash_board/view/pages/home/users_panel/parent_panel/pages/parent_dashboard/sections/parent%20profile/parent_profile_widget.dart';
// import 'package:dash_board/view/pages/home/users_panel/parent_panel/pages/parent_dashboard/sections/table%20calender/table_calender.dart';
// import 'package:dash_board/view/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';
// import 'package:vidyaveechi_website/responsive.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/users/parent_panel/pages/parent_dashboard/sections/attendance/circularprogress.dart';
import 'package:vidyaveechi_website/view/users/parent_panel/pages/parent_dashboard/sections/parent%20profile/parent_profile_widget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

// import 'package:vidyaveechi_website/view/users/parent_panel/pages/parent_dashboard/sections/table%20calender/table_calender.dart';

import 'parent_dashboard/sections/notification/notification.dart';
import 'parent_dashboard/sections/parent data table/parentdatatable.dart';
import 'parent_dashboard/sections/student study analyzer/student study progress/subjectwise_graph/student_study_progrss.dart';
import 'parent_dashboard/sections/student study analyzer/subjectwise graph/subjectwise_graph.dart';

class ParentDashBoardContainer extends StatelessWidget {
  const ParentDashBoardContainer({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> parentDashBoardWidgets = [
       ParentProfileWidget(), //  1
      SizedBox(
        height: 160,
        width: ResponsiveWebSite.isMobile(context) ? double.infinity : 200,
        child: const StudentAttendance(), // 2
      ),
      const StudentStudyProgress(), //3
      const SubjectWiseGraph(), //4
      const ParentNotification(), //5
      StudentExamHistoryToParent()
      //const ParentDataTable(), //6
      // const TableCalender(), //7
    ];
    return Container(
        color: const Color.fromARGB(255, 234, 220, 230), // height: 2700,
        width: double.infinity,
        child: ResponsiveWebSite.isMobile(context) /////////////Mobile View
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: parentDashBoardWidgets[0], /////parent profile
                    ),
                     Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Container(
                          height: 150,
                          color: cWhite,
                          child: parentDashBoardWidgets[1]), ////// points
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: parentDashBoardWidgets[4], //////student attendance
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: parentDashBoardWidgets[2], ////////study progress
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Container(
                          color: cWhite, child: parentDashBoardWidgets[3]), /////subjectwise graph
                    ),
                   
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10, right: 10,bottom: 10),
                      child: Container(
                        color: cWhite,
                        height: 600,
                        width: double.infinity,
                        child: parentDashBoardWidgets[5], /////all exam table
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                    //   child: parentDashBoardWidgets[6], /////notiications
                    // )
                  ],
                ),
              )
            : SingleChildScrollView(
                //////////////Web and Tab view
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, left: 10),
                              child: Container(
                                height: 500,
                                color: const Color.fromARGB(255, 234, 220, 230),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 3,
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 10, left: 10),
                                              child: SizedBox(child: parentDashBoardWidgets[0]),
                                            )),
                                        Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 10),
                                              child: SizedBox(child: parentDashBoardWidgets[1]),
                                            ))
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                top: 10,
                                                left: 10,
                                                right: 10,
                                              ),
                                              child: Container(
                                                  color: cWhite,
                                                  height: 300,
                                                  child: parentDashBoardWidgets[2]),
                                            )),
                                        Expanded(
                                            flex: 3,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                top: 10,
                                                left: 10,
                                              ),
                                              child: Container(
                                                  color: cWhite,
                                                  height: 300,
                                                  child: parentDashBoardWidgets[3]),
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: Container(
                                color: cWhite,
                                height: 470,
                                child: parentDashBoardWidgets[4],
                              ),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5, left: 10,bottom: 10),
                            child: Container(
                              color: cWhite,
                              height: 500,
                              child: parentDashBoardWidgets[5],
                            ),
                          ),
                        ),
                        // Expanded(
                        //   flex: 2,
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(left: 10, top: 5, right: 10),
                        //     child: Container(
                        //       color: cWhite,
                        //       height: 400,
                        //       child: parentDashBoardWidgets[6],
                        //     ),
                        //   ),
                        // )
                      ],
                    )
                  ],
                ),
              ));
  }
}
