// ignore_for_file: camel_case_types, prefer_const_constructors, unused_import, unnecessary_import, import_of_legacy_library_into_null_safe, must_be_immutable, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, await_only_futures

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medica/patient/patient_login.dart';
import 'package:medica/patient/patient_book.dart';
import 'package:medica/patient/patient_home.dart';
import 'package:medica/patient/patient_register.dart';
import 'package:medica/view/widgets/HomeCurve.dart';
import 'package:medica/view/widgets/LnRCurve.dart';
import 'package:medica/view/widgets/constance.dart';
import 'package:medica/view/widgets/custom_background.dart';
import 'package:medica/view/widgets/custom_text.dart';
import 'package:medica/view/widgets/custom_text_form_field.dart';
import 'package:medica/view/widgets/depts.dart';
import 'package:medica/view/widgets/find_doc_cat.dart';
import 'package:medica/view/widgets/find_doctor.dart';
import 'package:medica/view/widgets/symptom_card.dart';
import 'package:medica/view/widgets/wavey_shape.dart';
import 'package:medica/core/view_model/auth_view_model.dart';
import 'package:medica/patient/doctor_profile.dart';

class patient_find extends StatefulWidget {
  @override
  State<patient_find> createState() => _patient_findState();
}

class _patient_findState extends State<patient_find> {
  // List doctorCat = [];

  List findDoctor = [
    FindDoctor(
      docName: 'Dr. Omar Essam',
      docSpec: 'Cardiovascular Pathologist in El Dokki Clinic',
      imageAddress: 'assets/images/OIP.png',
      imageFit: BoxFit.fitWidth,
      experienceYears: 15,
      lat: 30.0380503,
      lng: 31.2112887,
      onPressed: () {
        Get.to(() => DoctorProfile.withdoctor(
            'Dr. Omar Essam',
            'Cardiovascular Pathologist in El Dokki Clinic',
            15,
            'assets/images/OIP.png'));
      },
    ),
    FindDoctor(
      docName: 'Dr. Kareem Ayman',
      experienceYears: 20,
      docSpec: 'Cardiologist in 6th of October Clinic',
      imageAddress: 'assets/images/Kareem.png',
      lat: 29.9725103,
      lng: 30.9366578,
      onPressed: () {
        Get.to(() => DoctorProfile.withdoctor(
            'Dr. Kareem Ayman',
            'Cardiologist in 6th of October Clinic',
            20,
            'assets/images/Kareem.png'));
      },
    ),
    FindDoctor(
      docName: 'Dr. Mai Farah',
      docSpec: 'The point of using Lor Ipsum normal of letters...',
      imageAddress: 'assets/images/washHands.jpg',
      experienceYears: 15,
      onPressed: () {
        Get.to(() => DoctorProfile());
      },
    ),
    FindDoctor(
      docName: 'Check Temperature',
      docSpec: 'The point of using Lor Ipsum normal of letters...',
      experienceYears: 15,
      onPressed: () {
        Get.to(() => DoctorProfile());
      },
    ),
  ];

  // final numbers = List.generate(100, (index) => '$index');
  @override
  Widget build(BuildContext context) {
    // List doctorCat = [
    //   docCat(
    //     catName: 'Cardio',
    //     numOfDoctors: 25,
    //     onPressed: () {
    //       setState(() {
    //         for (var i = 0; i < doctorCatbool.length; i++) {
    //           if (i == 0) {
    //             doctorCatbool[i] = true;
    //           } else {
    //             doctorCatbool[i] = false;
    //           }
    //         }
    //       });
    //     },
    //     isActiv: doctorCatbool[0],
    //   ),
    //   docCat(
    //     catName: 'Biochem',
    //     numOfDoctors: 12,
    //     onPressed: () {
    //       setState(() {
    //         for (var i = 0; i < doctorCatbool.length; i++) {
    //           if (i == 1) {
    //             doctorCatbool[i] = true;
    //           } else {
    //             doctorCatbool[i] = false;
    //           }
    //         }
    //       });
    //     },
    //     isActiv: doctorCatbool[1],
    //     // isActiv: true,
    //   ),
    //   docCat(
    //     catName: 'Research',
    //     numOfDoctors: 45,
    //     onPressed: () {},
    //     isActiv: doctorCatbool[2],
    //     // isActiv: true,
    //   ),
    //   docCat(
    //     catName: 'Neurology',
    //     numOfDoctors: 25,
    //     onPressed: () {},
    //     isActiv: doctorCatbool[3],
    //     // isActiv: true,
    //   ),
    //   docCat(
    //     catName: 'General',
    //     numOfDoctors: 25,
    //     onPressed: () {},
    //     isActiv: doctorCatbool[4],
    //     // isActiv: true,
    //   ),
    //   docCat(
    //     catName: 'General',
    //     numOfDoctors: 25,
    //     onPressed: () {},
    //     isActiv: doctorCatbool[5],
    //     // isActiv: true,
    //   ),
    //   docCat(
    //     catName: 'General',
    //     numOfDoctors: 25,
    //     onPressed: () {},
    //     isActiv: doctorCatbool[6],
    //     // isActiv: true,
    //   ),
    // ];
    setState(() {});
    final Size size = MediaQuery.of(context).size;
    final user = FirebaseAuth.instance.currentUser;
    dynamic email = '';
    dynamic name = '';
    dynamic picture = '';
    if (user != null) {
      email = user.email;
      name = user.displayName;
      picture = user.photoURL;
    }
    return WillPopScope(
      onWillPop: () async {
        // Get.to(loginAs());
        Get.to(() => patient_home());
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: Alignment.center,
          children: [
            myDefaultBackground(),
            Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/png/register.png'),
                        fit: BoxFit.fill))),
            Container(
              // padding: EdgeInsets.symmetric(
              //   horizontal: size.width * 0.05,
              // ),
              // color: Colors.green,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/images/Menu.png'),
                      CustomText(
                        text: name,
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600),
                      ),
                      Image.asset('assets/images/Notify.png')
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  TextFormField(
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: 'What are you looking for?',
                      hintStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                    indent: size.width * 0.04,
                    endIndent: size.width * 0.06,
                    thickness: 1,
                    height: 1,
                  ),
                ],
              ),
            ),
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(75)),
                  color: whitegrayish,
                ),
                padding: EdgeInsets.only(
                    // left: size.width * 0.08,
                    // right: size.width * 0.08,
                    // top: size.height * 0.05,
                    ),
                // // color: Colors.green,
                height: size.height * 0.78,

                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: size.width * 0.08,
                        right: size.width * 0.08,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Find Doctors Nearby",
                            textStyle: TextStyle(
                              color: primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: size.width * 0.08,
                        top: size.height * 0.02,
                      ),
                      // margin: EdgeInsets.only(right: size.width * 0.02),
                      child: docCat(),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: size.width * 0.08,
                        right: size.width * 0.08,
                        // top: size.height * 0.05,
                      ),
                      height: size.height * 0.55,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            findDoctor[0],
                            findDoctor[1],
                            findDoctor[2],
                            findDoctor[3],
                          ],
                        ),
                      ),
                    ),
                    Container(
                      // padding: EdgeInsets.only(
                      //   top: size.height * 0.02,
                      //   right: size.width * 0.1,
                      //   left: size.width * 0.1,
                      // ),
                      width: double.infinity,
                      height: size.height * 0.080,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          )),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.04),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: () {
                                Get.to(() => patient_home());
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                      'assets/images/homeNavBarHome.svg'),
                                  SizedBox(
                                    height: size.height * 0.008,
                                  ),
                                  CustomText(
                                    text: 'Home',
                                    textStyle: TextStyle(color: linkColor),
                                  )
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.to(() => patient_book());
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                      'assets/images/clipboardNavBarHome.svg',
                                      color: primaryColorOutOfFocus),
                                  SizedBox(
                                    height: size.height * 0.008,
                                  ),
                                  CustomText(
                                    text: 'Consult',
                                    textStyle: TextStyle(
                                        color: primaryColorOutOfFocus),
                                  )
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                      'assets/images/message-circleNavBarHome.svg',
                                      color: primaryColorOutOfFocus),
                                  SizedBox(
                                    height: size.height * 0.008,
                                  ),
                                  CustomText(
                                    text: 'Chat',
                                    textStyle: TextStyle(
                                        color: primaryColorOutOfFocus),
                                  )
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                      'assets/images/UserNavBarHome.svg',
                                      color: primaryColorOutOfFocus),
                                  SizedBox(
                                    height: size.height * 0.008,
                                  ),
                                  CustomText(
                                    text: 'Profile',
                                    textStyle: TextStyle(
                                        color: primaryColorOutOfFocus),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ]),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [],
            // )
          ],
        ),
      ),
    );
  }
}
