import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidyaveechi_website/controller/therapy_controller/therapy_controller.dart';
import 'package:vidyaveechi_website/model/therapy_student_model/add_sectionModel.dart';

class StudentAsignTherapyListDropDown extends StatelessWidget {
  StudentAsignTherapyListDropDown({
    Key? key, 
  }) : super(key: key);

  final therapyCntrl = Get.put(TherapyController());

  @override
  Widget build(BuildContext context) {
    return Center(
        child: DropdownSearch<StudentAsignTheraphyModel>(
      validator: (item) {
        if (item == null) {
          return "Required field";
        } else {
          return null;
        }
      },
      // autoValidateMode: AutovalidateMode.always,
      asyncItems: (value) {
        therapyCntrl.stAsignTherapyList.clear();

        return therapyCntrl.fetchAsignStudentTherapyList();
      },
      itemAsString: (value) =>
          ' ${value.TherapyName}',
      onChanged: (value) async {

        if (value != null) {
          therapyCntrl.stAsignTherapyListValue.value = value.docid;
               therapyCntrl.stAsignTherapyListValueName.value = value.TherapyName;
        }
      },
      popupProps: const PopupProps.menu(
          searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
                  hintText: "Select Therapy", border: OutlineInputBorder())),
          showSearchBox: true,
          searchDelay: Duration(microseconds: 10)),
      dropdownDecoratorProps: DropDownDecoratorProps(
          baseStyle: GoogleFonts.poppins(
              fontSize: 13, color: Colors.black.withOpacity(0.7))),
    ));
  }
}
