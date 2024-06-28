import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/admin_section/student_controller/student_controller.dart';
import 'package:vidyaveechi_website/controller/exam_result_controller/exam_result_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/therapy_management/Students_tm/therapy_details/therapy_list.dart';

class PerStudentTherapyDetails extends StatelessWidget {
  PerStudentTherapyDetails({
    super.key,
  });

  final StudentController studentController = Get.put(StudentController());
  final examController = Get.put(ExamResultController());

  @override
  Widget build(BuildContext context) {
    final data = studentController.studentModelData.value;
    examController.examId.value = " empty ";

    return Column(
      children: [
        Container(  
          height: 40,
          width: 1200,
          color: Colors.blue.withOpacity(0.1),
          child:  const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFontWidget(
              text: 'Therapy section',
              fontsize: 16,
              fontWeight: FontWeight.bold,
              color: cBlue,
            ),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(top: 10),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: [
        //       Obx(
        //         () => StudentCategoryTileContainer(
        //             title: 'No.of Therapy',
        //             subTitle: '${examController.numberExamPassed}',
        //             color: const Color.fromARGB(255, 121, 240, 125)),
        //       ),
        //       Obx(
        //         () => StudentCategoryTileContainer(
        //             title: 'No.of Therapies Pending',
        //             subTitle: '${examController.numberExamFailed}',
        //             color: const Color.fromARGB(255, 234, 102, 92)),
        //       ),
        //       Obx(() => StudentCategoryTileContainer(
        //           title: 'No.of Therapies Completed',
        //           subTitle: '${examController.numberExamConducted}',
        //           color: const Color.fromARGB(255, 121, 123, 240)))
        //     ],
        //   ),
        // ),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, top: 20),
                child: Container(
                  color: cWhite,
                  height: 40,
                  child: const Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: CatrgoryTableHeaderWidget(headerTitle: 'No')),
                      SizedBox(
                        width: 02,
                      ),
                      Expanded(
                          flex: 4,
                          child: CatrgoryTableHeaderWidget(
                              headerTitle: 'Name Of Therapy')),
                      SizedBox(
                        width: 02,
                      ),
                      Expanded(
                          flex: 2,
                          child: CatrgoryTableHeaderWidget(
                              headerTitle: 'Duration')),
                      SizedBox(
                        width: 02,
                      ),
                      Expanded(
                          flex: 2,
                          child: CatrgoryTableHeaderWidget(
                              headerTitle: 'Started Date')),
                      SizedBox(
                        width: 02,
                      ),
                      Expanded(
                          flex: 2,
                          child: CatrgoryTableHeaderWidget(
                              headerTitle: 'Completed Days')),
                      SizedBox(
                        width: 02,
                      ),
                      Expanded(
                          flex: 2,
                          child: CatrgoryTableHeaderWidget(
                              headerTitle: 'Follow Up')),
                      SizedBox(
                        width: 02,
                      ),
                      // Expanded(
                      //     flex: 1,
                      //     child: CatrgoryTableHeaderWidget(
                      //         headerTitle: 'Pass/Fail')),
                      // SizedBox(
                      //   width: 02,
                      // ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  child:  ListView.separated(
                                    itemBuilder: (context, index) {
                                 return GestureDetector(
                                  onTap: () {
                                  },
                                  child: TherapyListContainer(index:index));
                                    },
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(
                                        height: 02,
                                      );
                                    },
                                    itemCount:10
                                   //  snapshot.data!.docs.length
                                     )
                            //   }
                            // },
                  //         ),
                  // ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
