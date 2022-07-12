// ignore_for_file: prefer_const_constructors, unused_field, use_key_in_widget_constructors, unused_local_variable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medica/core/view_model/auth_view_model.dart';
import 'package:medica/doctor/doctor_login.dart';
import 'package:medica/doctor/selectSpeciality.dart';
import 'package:medica/providers/auth_provider.dart';
import 'package:medica/view/widgets/constance.dart';
import 'package:medica/view/widgets/custom_background.dart';
import 'package:medica/view/widgets/custom_text.dart';
import 'package:medica/view/widgets/custom_text_form_field.dart';
import 'package:medica/view/widgets/my_flutter_app_icons.dart';
import 'package:medica/view/widgets/profile_icons_icons.dart';
import 'package:provider/provider.dart';
import 'package:medica/providers/validation_provider.dart';

import 'doctor_getstarted.dart';

class doctor_register extends StatefulWidget {
  String specialityName = 'Select a speciality';

  doctor_register() : specialityName = "Select a speciality";

  doctor_register.getspeciality(this.specialityName);

  @override
  State<doctor_register> createState() => _doctor_registerState();
}

class _doctor_registerState extends State<doctor_register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _nameTextController = TextEditingController();

  final _emailTextController = TextEditingController();

  final _phoneTextController = TextEditingController();

  final _passwordTextController = TextEditingController();

  final _specialityTextController = TextEditingController();

  final _focusName = FocusNode();

  final _focusEmail = FocusNode();

  final _focusPhone = FocusNode();

  final _focusPassword = FocusNode();

  final _focusSpeciality = FocusNode();

  bool _isProcessing = false;

  String get name => widget.specialityName;

  set name(String name) {
    widget.specialityName = name;
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    final Size size = MediaQuery.of(context).size;
    final authProvider = Provider.of<AuthProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        Get.to(doctor_getstarted());
        return true;
      },
      child: GestureDetector(
        onTap: () {
          _focusName.unfocus();
          _focusEmail.unfocus();
          _focusPhone.unfocus();
          _focusPassword.unfocus();
          _focusSpeciality.unfocus();
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
                  children: <Widget>[
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
                      height: size.height * 0.02,
                    ),
                    Stack(children: [
                      SvgPicture.asset(
                        'assets/images/userLogin.svg',
                        width: size.width * 0.2,
                      ),
                    ]),
                    SizedBox(
                      height: size.height * 0.02,
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: size.height * 0.30,
                    ),
                    Container(
                      height: size.height * 0.7,
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
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: size.height * 0.325,
                    ),
                    Container(
                        height: size.height * 0.666666,
                        // color: Colors.green,
                        padding: EdgeInsets.symmetric(
                          // vertical: size.height * 0.06,
                          horizontal: size.width * 0.05,
                        ),
                        child: SingleChildScrollView(
                          reverse: true,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: size.width * 0.035,
                                        ),
                                        CustomText(
                                          text: 'Username',
                                          textStyle: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          hintText: 'Username',
                                          prefixIcon: Icon(
                                            MyFlutterApp.person,
                                            size: 25,
                                            color: Color(0xffF95DDE),
                                          ),
                                          hintStyle: TextStyle(
                                              color: Color(0xff6D6487),
                                              fontSize: 15,
                                              fontFamily: 'DMSans',
                                              fontWeight: FontWeight.normal),
                                          fillColor: Colors.white,
                                          border: InputBorder.none),
                                      controller: _nameTextController,
                                      focusNode: _focusName,
                                      validator: (value) => validation_provider
                                          .validateName(name: value!),
                                    ),
                                    Divider(
                                      color: Color(0xff3E1E96),
                                      indent: size.width * 0.05,
                                      endIndent: size.width * 0.05,
                                      height: 1,
                                      thickness: 2,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: size.width * 0.035,
                                        ),
                                        CustomText(
                                          text: 'Email',
                                          textStyle: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          hintText: 'Email',
                                          prefixIcon: Icon(
                                            MyFlutterApp.mail,
                                            size: 12,
                                            color: Color(0xffF95DDE),
                                          ),
                                          hintStyle: TextStyle(
                                              color: Color(0xff6D6487),
                                              fontSize: 15,
                                              fontFamily: 'DMSans',
                                              fontWeight: FontWeight.normal),
                                          fillColor: Colors.white,
                                          border: InputBorder.none),
                                      controller: _emailTextController,
                                      focusNode: _focusEmail,
                                      validator: (value) =>
                                          validation_provider.validateEmail(
                                        email: value!,
                                      ),
                                    ),
                                    Divider(
                                      color: Color(0xff3E1E96),
                                      indent: size.width * 0.05,
                                      endIndent: size.width * 0.05,
                                      height: 1,
                                      thickness: 2,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: size.width * 0.035,
                                        ),
                                        CustomText(
                                          text: 'Phone Number',
                                          textStyle: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                          hintText: '+20XXXXXXXXXX',
                                          prefixIcon: Icon(
                                            Icons.phone,
                                            size: 18,
                                            color: Color(0xffF95DDE),
                                          ),
                                          hintStyle: TextStyle(
                                              color: Color(0xff6D6487),
                                              fontSize: 15,
                                              fontFamily: 'DMSans',
                                              fontWeight: FontWeight.normal),
                                          fillColor: Colors.white,
                                          border: InputBorder.none),
                                      controller: _phoneTextController,
                                      focusNode: _focusPhone,
                                    ),
                                    Divider(
                                      color: Color(0xff3E1E96),
                                      indent: size.width * 0.05,
                                      endIndent: size.width * 0.05,
                                      height: 1,
                                      thickness: 2,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: size.width * 0.035,
                                        ),
                                        CustomText(
                                          text: 'Password',
                                          textStyle: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          hintText: 'Password',
                                          prefixIcon: Icon(
                                            MyFlutterApp.lock,
                                            size: 20,
                                            color: Color(0xffF95DDE),
                                          ),
                                          hintStyle: TextStyle(
                                              color: Color(0xff6D6487),
                                              fontSize: 15,
                                              fontFamily: 'DMSans',
                                              fontWeight: FontWeight.normal),
                                          fillColor: Colors.white,
                                          border: InputBorder.none),
                                      controller: _passwordTextController,
                                      focusNode: _focusPassword,
                                      obscureText: true,
                                      validator: (value) =>
                                          validation_provider.validatePassword(
                                        password: value!,
                                      ),
                                    ),
                                    Divider(
                                      color: Color(0xff3E1E96),
                                      indent: size.width * 0.05,
                                      endIndent: size.width * 0.05,
                                      height: 1,
                                      thickness: 2,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                /*RawMaterialButton(
                          
                          child: CustomTextFromField(
                              text: '\t\t\tSpeciality',
                              isReadonly: true,
                              fontSize: 18,
                              color: Color(0xff300C92),
                              hint: 'Select a speciality',
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
                              onPressed: () {
                            Get.to(() => selectSpeciality());
                          },
                        ),*/
                                Column(children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: size.width * 0.035,
                                      ),
                                      CustomText(
                                        text: "Speciality",
                                        textStyle: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'DMSans',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  RawMaterialButton(
                                    onPressed: () {
                                      Get.to(() => selectSpeciality());
                                    },
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: size.width * 0.033,
                                        ),
                                        Icon(
                                          ProfileIcons.path_16,
                                          size: 20,
                                          color: Color(0xffF95DDE),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.033,
                                        ),
                                        CustomText(
                                          text: widget.specialityName,
                                          textStyle: TextStyle(
                                            color: Colors.grey[600],
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  /* SizedBox(
                            height: size.height * 0.015,
                          ),*/
                                  Divider(
                                    color: Color(0xff3E1E96),
                                    indent: size.width * 0.05,
                                    endIndent: size.width * 0.05,
                                    height: 1,
                                    thickness: 2,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  TextButton(
                                      onPressed: () async {
                                        print(_nameTextController.text);
                                        print(_emailTextController.text);
                                        print(_phoneTextController.text);
                                        print(_passwordTextController.text);
                                        print(widget.specialityName);
                                        setState(() {
                                          _isProcessing = true;
                                        });
                                        if (_formKey.currentState!.validate()) {
                                          authProvider
                                              .registerDoctorUsingEmailPassword(
                                            name: _nameTextController.text,
                                            email: _emailTextController.text,
                                            password:
                                                _passwordTextController.text,
                                            phone: _phoneTextController.text,
                                            speciality: widget.specialityName,
                                          );

                                          setState(() {
                                            _isProcessing = false;
                                          });
                                        }
                                      },
                                      style: TextButton.styleFrom(
                                        minimumSize: Size(size.width * 0.8,
                                            size.height * 0.06),
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
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomText(
                                        text: "Already have an account?",
                                        textStyle:
                                            TextStyle(color: Color(0xff6D6487)),
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
                                              decoration:
                                                  TextDecoration.underline),
                                        ),
                                      )
                                    ],
                                  ),
                                ]),
                              ]),
                        ))
                  ],
                ),
              ]),
            ),
          ),
        ])),
      ),
    );
  }
}
