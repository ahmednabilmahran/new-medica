import 'package:flutter/material.dart';
import 'package:medica/view/widgets/constance.dart';

import '../view/widgets/custom_text.dart';

class appTime extends StatefulWidget {
  // String catName;
  // int numOfDoctors;
  // bool isActiv;
  // Function onPressed;
  // appTime({
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
  State<appTime> createState() => _appTimeState();
}

class _appTimeState extends State<appTime> {
  int selectedIndex = 0;
  final List<String> categories = [
    "8:00AM",
    "9:00AM",
    "10:00AM",
    "11:00AM",
    "12:00PM",
    "1:00PM",
    "2:00PM",
    "3:00PM",
    "4:00PM",
    "5:00PM",
    "6:00PM",
    "7:00PM",
    "8:00PM",
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
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(right: size.width * 0.02),
              child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
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
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: categories[index],
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
