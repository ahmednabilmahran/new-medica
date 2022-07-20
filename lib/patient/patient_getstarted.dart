// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/allConstants/all_constants.dart';
import 'package:medica/patient/patient_login.dart';
import 'package:medica/patient/patient_register.dart';
import 'package:medica/view/widgets/constance.dart';
import 'package:medica/view/widgets/custom_background.dart';
import 'package:medica/view/widgets/custom_text.dart';
import 'package:medica/view/widgets/slider_para.dart';
import 'package:medica/view/widgets/wavey_shape.dart';
import 'package:carousel_slider/carousel_slider.dart';

class patient_getstarted extends StatefulWidget {
  @override
  State<patient_getstarted> createState() => _patient_getstartedState();
}

class _patient_getstartedState extends State<patient_getstarted> {
  List<Widget> cardList = [
    const sliderCard(
        text: 'Patient care',
        graph:
            'this application is helping you to save your time and your energy , when searching about doctor or buy any medicine.'),
    const sliderCard(
        text: 'Better help',
        graph:
            'the main focus of application is helping you to find the best reservation system appropriate for you.'),
  ];

  Future<bool> onBackPress() {
    openDialog();
    return Future.value(false);
  }

  Future<void> openDialog() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return SimpleDialog(
            backgroundColor: AppColors.primaryColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Exit Application',
                  style: TextStyle(color: AppColors.white),
                ),
                Icon(
                  Icons.exit_to_app,
                  size: 30,
                  color: Colors.white,
                ),
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Sizes.dimen_10),
            ),
            children: [
              vertical10,
              const Text(
                'Are you sure?',
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: AppColors.white, fontSize: Sizes.dimen_16),
              ),
              vertical15,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.pop(context, 0);
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.pop(context, 1);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(Sizes.dimen_8),
                      ),
                      padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
                      child: const Text(
                        'Yes',
                        style: TextStyle(color: AppColors.spaceCadet),
                      ),
                    ),
                  )
                ],
              )
            ],
          );
        })) {
      case 0:
        break;
      case 1:
        exit(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        // Get.to(loginAs());
        // Get.back();
        return onBackPress();
      },
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            myDefaultBackground(),
            Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/png/login_register_select.png'),
                        fit: BoxFit.fill))),
            Stack(alignment: Alignment.bottomCenter, children: [
              Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                CustomPaint(
                  size: Size(
                      double.infinity,
                      (size.width * 0.9 * 0.657932839159359)
                          .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: WavyGetStarted(),
                ),
              ]),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomText(
                    text: 'Let\'s Get Started',
                    textStyle: TextStyle(
                      color: Color(0xff300C92),
                      fontFamily: 'DMSans',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            Get.to(() => patient_register());
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 17),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            )),
                            backgroundColor: primaryColor,
                          ),
                          child: CustomText(
                              text: 'REGISTER',
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'DMSans',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14))),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(() => PatientLogin());
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 64, vertical: 17),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                            )),
                            backgroundColor: secondaryColor,
                          ),
                          child: CustomText(
                              text: 'LOGIN',
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'DMSans',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14))),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  )
                ],
              )
            ]),
            Column(children: [
              SizedBox(
                height: size.height * 0.09,
              ),
              Image.asset('assets/images/LogoWhite.png'),
              SizedBox(
                height: size.height * 0.27,
              ),
              CarouselSlider(
                items: cardList,
                options: CarouselOptions(
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  autoPlay: true,
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
