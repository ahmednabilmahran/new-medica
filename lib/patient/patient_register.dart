// ignore_for_file: prefer_const_constructors, unused_field, prefer_const_literals_to_create_immutables, unused_local_variable, use_key_in_widget_constructors, camel_case_types, must_be_immutable, unnecessary_new, prefer_typing_uninitialized_variables, library_private_types_in_public_api, prefer_final_fields, use_build_context_synchronously

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medica/controllers/profileController.dart';
import 'package:medica/patient/patient_home.dart';
import 'package:medica/patient/patient_login.dart';
import 'package:medica/patient/patient_getstarted.dart';
import 'package:medica/providers/auth_provider.dart';
import 'package:medica/providers/validation_provider.dart';
import 'package:medica/screens/profile_page.dart';
import 'package:medica/view/widgets/constance.dart';
import 'package:medica/view/widgets/custom_background.dart';
import 'package:medica/view/widgets/custom_text.dart';
import 'package:medica/view/widgets/custom_text_form_field.dart';
import 'package:medica/view/widgets/my_flutter_app_icons.dart';
import 'package:provider/provider.dart';
import 'package:medica/providers/auth_provider.dart';

class patient_register extends StatefulWidget {
  
  @override
  _patient_registerState createState() => _patient_registerState();
}

class _patient_registerState extends State<patient_register> {
  final _registerFormKey = GlobalKey<FormState>();

  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    final Size size = MediaQuery.of(context).size;
    final authProvider = Provider.of<AuthProvider>(context);


    // switch (authProvider.status) {
    //   case Status.authenticateError:
    //     Fluttertoast.showToast(msg: 'Sign in failed');
    //     break;
    //   case Status.authenticateCanceled:
    //     Fluttertoast.showToast(msg: 'Sign in cancelled');
    //     break;
    //   case Status.authenticated:
    //     Fluttertoast.showToast(msg: 'Sign in successful');
    //     break;
    //   default:
    //     break;
    // }

    return WillPopScope(
      onWillPop: () async {
        Get.to(() => patient_getstarted());
        return true;
      },
      child: GestureDetector(
        onTap: () {
        _focusName.unfocus();
        _focusEmail.unfocus();
        _focusPassword.unfocus();
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
              key: _registerFormKey,
              child: Stack(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget> [
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
                      SvgPicture.asset(
                                    'assets/images/user_register.svg',
                                    width: size.width * 0.30,
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
                              TextFormField(
                                  controller: _nameTextController,
                                  focusNode: _focusName,
                                  validator:
                                  (value) => validation_provider
                                  .validateName(name: value!),),
                              
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              TextFormField(
                                  controller: _emailTextController,
                                  focusNode: _focusEmail,
                                  
                        validator: (value) => validation_provider.validateEmail(
                          email: value!,
                        ),),
                              
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              TextFormField(
                                  controller: _passwordTextController,
                                  focusNode: _focusPassword,
                                  obscureText: true,
                                  
                        validator: (value) => validation_provider.validatePassword(
                          password: value!,
                        ),),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              TextButton(
                                  onPressed: () async {
                                    print(_nameTextController);
                                    print(_nameTextController.value);
                                    print(_nameTextController.text);
                                      setState(() {
                                        _isProcessing = true;
                                      });
                                      if (_registerFormKey.currentState!
                                          .validate()) {
                                        authProvider.registerUsingEmailPassword(
                                          name: _nameTextController.text,
                                          email: _emailTextController.text,
                                          password: _passwordTextController.text,
                                        );

                                        setState(() {
                                          _isProcessing = false;
                                        });
                                      }
                                    },
                                      
                                     
                                  
                                  style: TextButton.styleFrom(
                                    minimumSize: Size(
                                        size.width * 0.8, size.height * 0.06),
                                   
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
                                      // Get.to(() => PatientLogin());
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
      ),
    );
  }
}
//   void pickImage() async {
//     final picker = ImagePicker();
//     var image = picker.pickImage(source: ImageSource.camera);

//     _image = image as File;
//   }
// }

// void _showPicker(context) {
//   profileController profileCtrl = Get.put(profileController());
//   showModalBottomSheet(
//       context: context,
//       builder: (BuildContext bc) {
//         return SafeArea(
//           child: Container(
//             child: new Wrap(
//               children: <Widget>[
//                 new ListTile(
//                     leading: new Icon(Icons.photo_library),
//                     title: new Text('Gallery'),
//                     onTap: () {
//                       profileCtrl.getImage(ImageSource.gallery);
//                       Navigator.of(context).pop();
//                     }),
//                 new ListTile(
//                   leading: new Icon(Icons.photo_camera),
//                   title: new Text('Camera'),
//                   onTap: () {
//                     profileCtrl.getImage(ImageSource.camera);
//                     Navigator.of(context).pop();
//                   },
//                 ),
//                 new ListTile(
//                   leading: new Icon(Icons.delete),
//                   title: new Text('Remove Photo'),
//                   onTap: () {
//                     profileCtrl.deleteMemoryImage();
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ],
//             ),
//           ),
//         );
//       });
// }
