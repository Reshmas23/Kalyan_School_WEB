import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/therapy_controller/therapy_controller.dart';
import 'package:vidyaveechi_website/model/therapy_student_model/add_sectionModel.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/ioT_Card/code.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/blue_Container_widget/blue_Container_widget.dart';
import 'package:vidyaveechi_website/view/widgets/loading_widget/loading_widget.dart';

class TherapyListContainer extends StatelessWidget {
  final int index;
  final Map<String, dynamic> data;
  const TherapyListContainer({
    required this.index,
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Row(
        children: [
          TextFontWidget(
            text: "${index + 1}",
            fontsize: 11,
            fontWeight: FontWeight.w300,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: TextFontWidget(
              text: data['docid'],
              fontsize: 11,
              fontWeight: FontWeight.w400,
            ),
          ),
          //   const Padding(
          //   padding: EdgeInsets.only(left: 20),
          //   child: TextFontWidget(
          //     text: "  |  ${2} Therapy Attended",
          //     fontsize: 11,
          //     fontWeight: FontWeight.w600,
          //   ),
          // ),
        ],
      ),
      children: [
        SizedBox(
          height: 200,
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
                  .doc(data['docid'])
                  .collection("AttendendTherapy")
                  .snapshots(),
              builder: (context, attSnaps) {
                if (attSnaps.hasData) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        final deData = AddSectionModel.fromMap(attSnaps.data!.docs[index].data());
                        return SizedBox(
                          height: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  BlueContainerWidget(
                                      fontColor: cBlack,
                                      title: deData.theraphyName,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blue),
                                   Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const TextFontWidget(
                                              text: "Started Time :  ",
                                              fontsize: 11,
                                              fontWeight: FontWeight.w300,
                                            ),
                                            TextFontWidget(
                                              text:  deData.thStartTime,
                                              fontsize: 11,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: TextFontWidget(
                                                text: "Ended Time :  ",
                                                fontsize: 11,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                            TextFontWidget(
                                              text: deData.thEndTime,
                                              fontsize: 11,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                               Row(
                                children: [
                                  const TextFontWidget(
                                    text: "Duration :  ",
                                    fontsize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  TextFontWidget(
                                    text:  deData.duration,
                                    fontsize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                               Expanded(
                                child: TextFontWidget(
                                  text: "Evaluation : "
                                      "  ${deData.evaluation}",
                                  fontsize: 11,
                                  overflow: TextOverflow.visible,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox();
                      },
                      itemCount: attSnaps.data!.docs.length);
                } else {
                  return const LoadingWidget();
                }
              }),
        )
      ],
    );
  }
}
