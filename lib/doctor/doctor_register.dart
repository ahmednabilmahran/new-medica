// ignore_for_file: prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medica/core/view_model/auth_view_model.dart';
import 'package:medica/doctor/doctor_login.dart';
import 'package:medica/view/widgets/LnRCurve.dart';
import 'package:medica/view/widgets/constance.dart';
import 'package:medica/view/widgets/custom_background.dart';
import 'package:medica/view/widgets/custom_text.dart';
import 'package:medica/view/widgets/custom_text_form_field.dart';
import 'package:medica/view/widgets/my_flutter_app_icons.dart';


class doctor_register extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var confirmPass;
  @override
  Widget build(BuildContext context) {
    // final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    final Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        // Get.to(doctor_getstarted());
        Get.back();
        return true;
      },
      child: Scaffold(
          // resizeToAvoidBottomInset: false,
          body: Stack(children: [
        myDefaultBackground(),
        Positioned(
          // bottom: 0,
          // top: 0,
          right: 0,
          left: 0,
          child: Container(
              height: size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/png/register.png'),
                    fit: BoxFit.fill),
              )),
        ),
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
                height: size.height * 0.05,
              ),
              CustomText(
                text: 'MEDICA',
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              SvgPicture.asset(
                'assets/images/userLogin.svg',
                width: size.width * 0.2,
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              CustomText(
                text: 'Register to Continue',
                textStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: size.width * 0.06),
              ),
              Divider(
                color: Color(0xffFEB197),
                indent: size.width * 0.4,
                endIndent: size.width * 0.4,
                height: 15,
                thickness: 2,
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Stack(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: size.height * 0.25,
                  ),
                  CustomPaint(
                    size: Size(
                        double.infinity,
                        (size.height * 0.45 * 1.6680872965861588)
                            .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                    painter: LnRCurve(),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: size.height * 0.3333,
                  ),
                  Container(
                    height: size.height * 0.666666,
                    // color: Colors.green,
                    padding: EdgeInsets.symmetric(
                      // vertical: size.height * 0.06,
                      horizontal: size.width * 0.05,
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomTextFromField(
                              text: '\t\t\tUsername',
                              fontSize: 18,
                              color: Color(0xff300C92),
                              hint: 'Your username',
                              icon_name: Icon(
                                MyFlutterApp.person,
                                size: 25,
                                color: Color(0xffF95DDE),
                              ),
                              onSave: (value) {
                                controller.name = value!;
                              },
                              validator: (value) {
                                if (value == null) {
                                  print("Error");
                                }
                              }),
                          Divider(
                            color: Color(0xff3E1E96),
                            indent: size.width * 0.05,
                            endIndent: size.width * 0.05,
                            height: 1,
                            thickness: 2,
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          CustomTextFromField(
                              text: '\t\t\tEmail',
                              fontSize: 20,
                              color: Color(0xff300C92),
                              hint: 'Your email',
                              icon_name: Icon(
                                MyFlutterApp.mail,
                                size: 12,
                                color: Color(0xffF95DDE),
                              ),
                              onSave: (value) {
                                controller.email = value!;
                              },
                              validator: (value) {
                                if (value == null) {
                                  print("Error");
                                }
                              }),
                          Divider(
                            color: Color(0xff3E1E96),
                            indent: size.width * 0.05,
                            endIndent: size.width * 0.05,
                            height: 1,
                            thickness: 2,
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          CustomTextFromField(
                              keyboardType: TextInputType.phone,
                              text: '\t\t\tPhone Number',
                              fontSize: 20,
                              color: Color(0xff300C92),
                              hint: '+20XXXXXXXXXX',
                              icon_name: Icon(
                                MyFlutterApp.mail,
                                size: 12,
                                color: Color(0xffF95DDE),
                              ),
                              onSave: (value) {
                                controller.email = value!;
                              },
                              validator: (value) {
                                if (value == null) {
                                  print("Error");
                                }
                              }),
                          Divider(
                            color: Color(0xff3E1E96),
                            indent: size.width * 0.05,
                            endIndent: size.width * 0.05,
                            height: 1,
                            thickness: 2,
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          CustomTextFromField(
                              obscureText: true,
                              text: '\t\t\tPassword',
                              fontSize: 18,
                              color: Color(0xff300C92),
                              hint: 'Password',
                              icon_name: Icon(
                                MyFlutterApp.lock,
                                size: 20,
                                color: Color(0xffF95DDE),
                              ),
                              onSave: (value) {
                                controller.password = value!;
                              },
                              validator: (value) {
                                confirmPass = value;
                                if (value!.isEmpty) {
                                  return "Please Enter New Password";
                                } else if (value.length < 8) {
                                  return "Password must be atleast 8 characters long";
                                } else {
                                  return null;
                                }
                              }),
                          Divider(
                            color: Color(0xff3E1E96),
                            indent: size.width * 0.05,
                            endIndent: size.width * 0.05,
                            height: 1,
                            thickness: 2,
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Container(
                            child: TextButton(
                                onPressed: () {
                                  _formKey.currentState?.save();

                                  if (_formKey.currentState!.validate()) {
                                    controller
                                        .createAccountWithEmailAndPassword();
                                  }
                                },
                                style: TextButton.styleFrom(
                                  minimumSize: Size(
                                      size.width * 0.8, size.height * 0.06),
                                  // padding: EdgeInsets.symmetric(
                                  //   horizontal:
                                  //       size.width * 0.35,
                                  //   // double.infinity,
                                  //   vertical: size.height *
                                  //       0.023,
                                  // ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25),
                                  )),
                                  backgroundColor: secondaryColor,
                                ),
                                child: CustomText(
                                    text: 'REGISTER',
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w800,
                                        fontSize: 14))),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: "Already have an account?",
                                textStyle: TextStyle(color: Color(0xff6D6487)),
                              ),
                              // SizedBox(
                              //   width: size.width * 0.001,
                              // ),
                              TextButton(
                                style: TextButton.styleFrom(
                                    // Spadding: EdgeInsets.all(0),
                                    // minimumSize: Size(1, 1)
                                    ),
                                onPressed: () {
                                  Get.to(doctor_login());
                                },
                                child: CustomText(
                                  text: "Login",
                                  textStyle: TextStyle(
                                      color: Color(0xff4CD2CF),
                                      decoration: TextDecoration.underline),
                                ),
                              )
                            ],
                          ),
                        ]),
                  )
                ],
              ),
            ]),
          ),
        ),
      ])),
    );
  }
}
