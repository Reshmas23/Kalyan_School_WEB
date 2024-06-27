import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/widgets/data_list_widgets/data_container.dart';

class TherapyListContainer extends StatelessWidget {
  final int index;
  const TherapyListContainer({
    required this.index,
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                // width: 150,
                index: index,
                headerTitle: '${index + 1}'), //....................No
          ),
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 4,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                index: index,
                headerTitle:'Face'),
          ), //................................................. Months
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 2,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                index: index,
                headerTitle:" ['subjectName']"),
          ),
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 2,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                index: index,
                headerTitle:" ['obtainedMark']"),
          ), // ................................... Fees Required
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 2,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                index: index,
                headerTitle:" ['obtainedGrade']"),
          ), //....................................... Fess Collectes
          const SizedBox(
            width: 02,
          ),
          Expanded(
            flex: 2,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                index: index,
                headerTitle: "['passMark']"),
          ), //....................................... Fess Pending
          const SizedBox(
            width: 02,
          ),

        //  Expanded(
        //     flex: 1,
        //     child: DataContainerWidget(
        //         rowMainAccess: MainAxisAlignment.center,
        //         color: cWhite,
        //         index: index,
        //         headerTitle: "['passMark']"),
        //   ), //....................................... Fess Pending
        //   const SizedBox(
        //     width: 02,
        //   ), //............................. Status [Full paid or Pending]
        ],
      ),
    );
  }
}
