import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidyaveechi_website/controller/therapy_controller/therapy_controller.dart';
import 'package:vidyaveechi_website/model/therapy_model/therapy_model.dart';

class TherapyListDropDown extends StatelessWidget {
  final String studentID; 
  TherapyListDropDown({
    Key? key, required this.studentID,
  }) : super(key: key);

  final therapyCntrl = Get.put(TherapyController());

  @override
  Widget build(BuildContext context) {
    return Center(
        child: DropdownSearch<TherapyModel>(
      validator: (item) {
        if (item == null) {
          return "Required field";
        } else {
          return null;
        }
      },
      // autoValidateMode: AutovalidateMode.always,
      asyncItems: (value) {
        therapyCntrl.allTherapiesList.clear();

        return therapyCntrl.fetchTherapyList();
      },
      itemAsString: (value) =>
          ' ${value.therapyName}',
      onChanged: (value) async {
        if (value != null) {
          therapyCntrl.selectedTherapyID.value = value.docid;
          therapyCntrl.selectedTherapyName.value = value.therapyName;
         await therapyCntrl.addTherapyForSelectedStudent(studentID);
        }
      },
      popupProps: const PopupProps.menu(
          searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
                  hintText: "Search Therapy", border: OutlineInputBorder())),
          showSearchBox: true,
          searchDelay: Duration(microseconds: 10)),
      dropdownDecoratorProps: DropDownDecoratorProps(
          baseStyle: GoogleFonts.poppins(
              fontSize: 13, color: Colors.black.withOpacity(0.7))),
    ));
  }
}
