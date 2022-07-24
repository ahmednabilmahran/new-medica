import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/view/widgets/doctor_controller.dart';

import 'constance.dart';
import 'custom_text.dart';

class docCat extends StatefulWidget {
  // String catName;
  // int numOfDoctors;
  // bool isActiv;
  // Function onPressed;
  // docCat({
  //   Key? key,
  //   required this.catName,
  //   required this.numOfDoctors,
  //   this.isActiv = false,
  //   required this.onPressed,
  // }) : super(key: key);

  // set setIsActive(bool isActiv) {
  //   this.isActiv = isActiv;
  // }

  @override
  State<docCat> createState() => _docCatState();
}

class _docCatState extends State<docCat> {
  final doctorController = Get.put(DoctorController());

  int selectedIndex = 0;
  final List<String> categories = [
    "Cardio",
    "Biochem",
    "Research",
    // "Dentistry",
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    Color selectedbgColor = Color(0xffFF8F6A);
    Color unSelectedbgColor = Color(0xffFFE4DB);
    Color selectedColor = Colors.white;
    Color unSelectedColor = primaryColor;
    Color? color;
    Color? bgColor;
    final doctorController = Get.put(DoctorController());

    // setState(() {
    //   if (widget.isActiv) {
    //     color = selectedColor;
    //     bgColor = selectedbgColor;
    //   } else {
    //     color = unSelectedColor;
    //     bgColor = unSelectedbgColor;
    //   }
    // });

    return Container(
        // margin: EdgeInsets.only(right: size.width * 0.02),
        height: size.height * 0.06,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: doctorController.doctor.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(right: size.width * 0.02),
              child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14))),
                    backgroundColor: index == selectedIndex
                        ? selectedbgColor
                        : unSelectedbgColor,
                    minimumSize: Size(size.width * 0.25, size.height * 0.045),
                    // maximumSize:
                    //     Size(size.width * 0.25, size.height * 0.05),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedIndex = index;
// <<<<<<< HEAD

                      print(categories[index]);
                      dept = categories[index];
                      print(dept);
// >>>>>>> a4841f7199955bae4f4522106678c32aeca206bf
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: doctorController.doctor[index].speciality,
                        textStyle: TextStyle(
                            color: index == selectedIndex
                                ? selectedColor
                                : unSelectedColor,
                            fontFamily: 'inter'),
                      )
                    ],
                  )),
            );
          },
        ));
    // setState(() {});
  }
}
