import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/video_management/presentation/pages/widgets/video_widgets.dart';
import 'package:vidyaveechi_website/view/widgets/custom_showDilog/show_dialoge_box.dart';

detailsOfStudentsInTherapy(BuildContext context){
  showDialogeBox(context: context,
  headerchild: const TextFontWidget(text: "Student Details", fontsize: 15,fontWeight: FontWeight.bold,),
  children:  [
    const Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextFontWidget(text: "text", fontsize: 12),
          TextFontWidget(text: ":", fontsize: 12),
          TextFontWidget(text: "text", fontsize: 12),
        ],
      ),
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextFontWidget(text: "text", fontsize: 12),
          TextFontWidget(text: ":", fontsize: 12),
          TextFontWidget(text: "text", fontsize: 12),
        ],
      ),
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextFontWidget(text: "text", fontsize: 12),
          TextFontWidget(text: ":", fontsize: 12),
          TextFontWidget(text: "text", fontsize: 12),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextFontWidget(text: "text", fontsize: 12),
          TextFontWidget(text: ":", fontsize: 12),
          TextFontWidget(text: "text", fontsize: 12),
        ],
      ),
    ],)
  ],
  actions: []
  );
}