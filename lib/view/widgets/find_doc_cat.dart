import 'package:flutter/material.dart';

import 'constance.dart';
import 'custom_text.dart';

class docCat extends StatefulWidget {
  String catName;
  int numOfDoctors;
  bool isActiv;
  Function onPressed;
  docCat({
    Key? key,
    required this.catName,
    required this.numOfDoctors,
    this.isActiv = false,
    required this.onPressed,
  }) : super(key: key);

  set setIsActive(bool isActiv) {
    this.isActiv = isActiv;
  }

  @override
  State<docCat> createState() => _docCatState();
}

class _docCatState extends State<docCat> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    Color selectedbgColor = Color(0xffFF8F6A);
    Color unSelectedbgColor = Color(0xffFFE4DB);
    Color selectedColor = Colors.white;
    Color unSelectedColor = primaryColor;
    Color? color;
    Color? bgColor;
    setState(() {
      if (widget.isActiv) {
        color = selectedColor;
        bgColor = selectedbgColor;
      } else {
        color = unSelectedColor;
        bgColor = unSelectedbgColor;
      }
    });

    return Container(
      margin: EdgeInsets.only(right: size.width * 0.02),
      child: Row(
        children: [
          TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14))),
                backgroundColor: bgColor,
                minimumSize: Size(size.width * 0.25, size.height * 0.05),
                // maximumSize:
                //     Size(size.width * 0.25, size.height * 0.05),
              ),
              onPressed: () {
                widget.onPressed();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: '${widget.catName}(${widget.numOfDoctors})',
                    textStyle: TextStyle(color: color, fontFamily: 'inter'),
                  )
                ],
              ))
        ],
      ),
    );
    // setState(() {});
  }
}
