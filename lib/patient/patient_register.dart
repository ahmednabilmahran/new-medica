// ignore_for_file: prefer_const_constructors, unused_field, prefer_const_literals_to_create_immutables, unused_local_variable, use_key_in_widget_constructors, camel_case_types, must_be_immutable, unnecessary_new

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medica/controllers/profileController.dart';
import 'package:medica/core/view_model/auth_view_model.dart';
import 'package:medica/patient/patient_login.dart';
import 'package:medica/patient/patient_getstarted.dart';
import 'package:medica/view/widgets/constance.dart';
import 'package:medica/view/widgets/custom_background.dart';
import 'package:medica/view/widgets/custom_text.dart';
import 'package:medica/view/widgets/custom_text_form_field.dart';
import 'package:medica/view/widgets/my_flutter_app_icons.dart';

class patient_register extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthViewModel avm = Get.put(AuthViewModel());

  profileController profileCtrl = Get.put(profileController());

  var confirmPass;
  File? _image;

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    final Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        Get.to(() => patient_getstarted());
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
        ),
        SingleChildScrollView(
          reverse: isKeyboard,
          child: Form(
            key: _formKey,
            child: Stack(children: [
              Column(
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
                        fontFamily: 'DMSans',
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  Stack(children: [
                    Obx(
                      () => RawMaterialButton(
                        onPressed: () {
                          _showPicker(context);
                        },
                        child: CircleAvatar(
                          radius: 59,
                          backgroundColor: Colors.purple,
                          child: profileCtrl.selectedImagePath.value != ''
                              ? CircleAvatar(
                                  radius: 55,
                                  backgroundColor: Colors.purple,
                                  backgroundImage: FileImage(
                                    File((profileCtrl.selectedImagePath.value)),
                                  ))
                              : SvgPicture.asset(
                                  'assets/images/user_register.svg',
                                  width: size.width * 0.30,
                                ),
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  CustomText(
                    text: 'Register to Continue',
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: 'DMSans',
                        fontSize: size.width * 0.06,
                        fontWeight: FontWeight.bold)
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
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: size.height * 0.3333,
                  ),
                  Container(
                    height: size.height * 0.666666,
                    // color: Colors.green,
                    decoration: BoxDecoration(
                        color: whitegrayish,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(75))),
                    padding: EdgeInsets.only(
                      // vertical: size.height * 0.06,
                      right: size.width * 0.05,
                      left: size.width * 0.05,
                      top: size.width * 0.05,
                    ),
                    child: SingleChildScrollView(
                      reverse: true,
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
                                  if (value!.isEmpty) {
                                    return "\t\t\t\t\tPlease Enter Name";
                                  }
                                  return null;
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
                                  if (value!.isEmpty) {
                                    return "\t\t\t\t\tPlease Enter E-Mail";
                                  }
                                  if (!RegExp(
                                          "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                      .hasMatch(value)) {
                                    return "\t\t\t\t\tPlease Enter Valid E-Mail";
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
                                    return "\t\t\t\t\tPlease Enter Password";
                                  } else if (value.length < 8) {
                                    return "\t\t\t\t\tPassword must be at least 8 characters long";
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
                            CustomTextFromField(
                                obscureText: true,
                                text: '\t\t\tConfirm Password',
                                fontSize: 18,
                                color: Color(0xff300C92),
                                hint: 'Confirm Password',
                                icon_name: Icon(
                                  MyFlutterApp.lock,
                                  size: 20,
                                  color: Color(0xffF95DDE),
                                ),
                                onSave: (value) {},
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "\t\t\t\t\tPlease Re-Enter New Password";
                                  } else if (value != confirmPass) {
                                    return "\t\t\t\t\tPassword must be same as above";
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

                                      print("Successful");
                                    } else {
                                      print("Unsuccessful");
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
                                          fontFamily: 'DMSans',
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
                                  textStyle:
                                      TextStyle(color: Color(0xff6D6487),
                                      fontFamily: 'DMSans',
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal),
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
                                    Get.to(() => PatientLogin());
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
                            SizedBox(
                              height: size.height * 0.03,
                            ),
                          ]),
                    ),
                  )
                ],
              ),
            ]),
          ),
        ),
      ])),
    );
  }

  void pickImage() async {
    final picker = ImagePicker();
    var image = picker.pickImage(source: ImageSource.camera);

    _image = image as File;
  }
}

void _showPicker(context) {
  profileController profileCtrl = Get.put(profileController());
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Gallery'),
                    onTap: () {
                      profileCtrl.getImage(ImageSource.gallery);
                      Navigator.of(context).pop();
                    }),
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text('Camera'),
                  onTap: () {
                    profileCtrl.getImage(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                ),
                new ListTile(
                  leading: new Icon(Icons.delete),
                  title: new Text('Remove Photo'),
                  onTap: () {
                    profileCtrl.deleteMemoryImage();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      });
}
