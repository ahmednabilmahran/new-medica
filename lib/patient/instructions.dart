import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medica/Covid19Detector.dart';
import 'package:medica/view/widgets/constance.dart';
import 'package:medica/view/widgets/custom_background.dart';
import 'package:medica/view/widgets/custom_text.dart';

// ignore_for_file: prefer_const_constructors, unused_field

class instructions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return WillPopScope(
        onWillPop: () async {
          // Get.to(doctor_getstarted());
          Get.back();
          return true;
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(children: [
            myDefaultBackground(),
            Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/png/register.png'),
                        fit: BoxFit.fill))),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: 'Instructions',
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(75),
                        topRight: Radius.circular(75)),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(
                    left: size.width * 0.08,
                    right: size.width * 0.08,
                    // top: size.height * 0.05,
                  ),
                  // color: Colors.green,
                  height: size.height * 0.88,

                  width: double.infinity,
                  child: Container(
                    child: SingleChildScrollView(
                      child: Column(children: [
                        SizedBox(
                          height: size.height * 0.06,
                        ),
                      
                        Row(children: [
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Expanded(
                            child: CustomText(
                                text:
                                    '\n\u2022  Upload chest X-ray with good quality. ',
                                textStyle: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                    fontFamily: 'DMSans',
                                    fontWeight: FontWeight.w500)),
                          )
                        ]),
                       
                        Row(children: [
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Expanded(
                            child: CustomText(
                                text:
                                    '\n\u2022  Should be clear photo , and for chest X-ray only. ',
                                textStyle: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 17,
                                    fontFamily: 'DMSans',
                                    fontWeight: FontWeight.w500)),
                          )
                        ]),
                        
                        
                        Row(children: [
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Expanded(
                            child: CustomText(
                                text:
                                    '\n\u2022 The X-ray chest will be processed in few seconds. ',
                                textStyle: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 17,
                                    fontFamily: 'DMSans',
                                    fontWeight: FontWeight.w500)),
                          )
                        ]),
                        

                        Row(children: [
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Expanded(
                            child: CustomText(
                                text:
                                    '\n\u2022  The X-ray result it will be positive or negative.',
                                textStyle: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 17,
                                    fontFamily: 'DMSans',
                                    fontWeight: FontWeight.w500)),
                          )
                        ]),
                        SizedBox(
                          height: size.height * 0.1,
                        ),
                        
                        TextButton(
                          style: TextButton.styleFrom(
                              maximumSize:
                                  Size(double.infinity, size.height * 0.085),
                              minimumSize:
                                  Size(double.infinity, size.height * 0.085),
                              // minimumSize: ,
                              // foregroundColor: secondaryColor,
                              backgroundColor: secondaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)))),
                          onPressed: () {
                            Get.to(() => Covid19Detector());
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  "assets/images/covid4.svg",
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.scaleDown,
                                ),
                                CustomText(
                                  text: 'Covid-19 Detector',
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                                Container(
                                  child: Image.asset(
                                      'assets/images/whiteArrow.png'),
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                )
                              ],
                            ),
                          )),
                          
                        

                      ]),
                    ),
                  ),
                ),
              ],
            )
          ]),
        ));
  }
}
