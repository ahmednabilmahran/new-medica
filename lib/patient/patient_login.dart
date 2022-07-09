// // ignore_for_file: prefer_const_constructors, unused_field, unused_import, invalid_use_of_protected_member, prefer_final_fields

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:medica/core/view_model/auth_view_model.dart';
// import 'package:medica/patient/patient_getstarted.dart';
// import 'package:medica/patient/patient_home.dart';
// import 'package:medica/patient/patient_register.dart';
// import 'package:medica/providers/auth_provider.dart';
// import 'package:medica/view/widgets/LnRCurve.dart';
// import 'package:medica/view/widgets/constance.dart';
// import 'package:medica/view/widgets/custom_background.dart';
// import 'package:medica/view/widgets/custom_text.dart';
// import 'package:medica/view/widgets/custom_text_form_field.dart';
// import 'package:medica/view/widgets/my_flutter_app_icons.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class PatientLogin extends StatefulWidget {
//   @override
//   State<PatientLogin> createState() => _PatientLoginState();
// }

// class _PatientLoginState extends State<PatientLogin> {
//   var confirmPass;

//   bool keepMeLoggedIn = false;
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final CheckController ctrl = Get.put(CheckController());
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _emailFocusNode = FocusNode();
//   final _passwordFocusNode = FocusNode();
//   bool _isProgress = false;

//   void keepUserLoggedIn() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     preferences.setBool(k_keepMeLoggedIn, ctrl.checkbool.value);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
//     final Size size = MediaQuery.of(context).size;
//     final authProvider = Provider.of<AuthProvider>(context);

//     return WillPopScope(
//       onWillPop: () async {
//         // Get.to(patient_getstarted());
//         Get.to(() => patient_getstarted());
//         return true;
//       },
//       child: GestureDetector(
//         onTap: () {
//         _emailFocusNode.unfocus();
//         _passwordFocusNode.unfocus();
//       },
//         child: Scaffold(
//             resizeToAvoidBottomInset: false,
//             body: Stack(children: [
//               myDefaultBackground(),
//               Container(
//                   decoration: const BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage('assets/images/png/Login.png'),
//                     fit: BoxFit.fill),
//               )),
//               Container(
//                 // padding: EdgeInsets.symmetric(
//                 //   horizontal: size.width * 0.05,
//                 // ),
//                 // color: Colors.green,
//                 alignment: Alignment.center,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: size.height * 0.05,
//                     ),
//                     CustomText(
//                       text: 'MEDICA',
//                       textStyle: TextStyle(
//                           color: Colors.white,
//                           fontSize: 32,
//                           fontFamily: 'Inter',
//                           fontWeight: FontWeight.w600),
//                     ),
//                     SizedBox(
//                       height: size.height * 0.04,
//                     ),
//                     SvgPicture.asset(
//                       'assets/images/userLogin.svg',
//                       width: size.width * 0.2,
//                     ),
//                     SizedBox(
//                       height: size.height * 0.04,
//                     ),
//                     CustomText(
//                       text: 'Login to Continue',
//                       textStyle: TextStyle(
//                           color: Colors.white,
//                           fontFamily: 'Inter',
//                           fontSize: size.width * 0.06),
//                     ),
//                     Divider(
//                       color: Color(0xffFEB197),
//                       indent: size.width * 0.4,
//                       endIndent: size.width * 0.4,
//                       height: 15,
//                       thickness: 2,
//                     ),
//                   ],
//                 ),
//               ),
//               Form(
//                 key: _formKey,
//                 child: Stack(children: [
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       CustomPaint(
//                         size: Size(
//                             double.infinity,
//                             (size.height * 0.45 * 1.6680872965861588)
//                                 .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//                         painter: LnRCurve(),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Container(
//                         height: size.height * 0.666666,
//                         // color: Colors.green,
//                         padding: EdgeInsets.symmetric(
//                           vertical: size.height * 0.04,
//                           horizontal: size.width * 0.05,
//                         ),
//                         child: Column(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               CustomTextFromField(
//                                   text: '\t\t\tEmail',
//                                   fontSize: 20,
//                                   color: Color(0xff300C92),
//                                   hint: 'Your email',
//                                   icon_name: Icon(
//                                     MyFlutterApp.mail,
//                                     size: 12,
//                                     color: Color(0xffF95DDE),
//                                   ),
//                                   onSave: (value) {
//                                     controller.email = value!;
//                                   },
//                                   validator: (value) {
//                                     if (value!.isEmpty) {
//                                       return "\t\t\t\t\t\tE-Mail Is Required";
//                                     }
//                                     if (!RegExp(
//                                             "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
//                                         .hasMatch(value)) {
//                                       return "\t\t\t\t\t\tPlease Enter Valid E-Mail";
//                                     }
//                                   }),
//                               const Divider(
//                                 color: Color(0xff3E1E96),
//                                 indent: 20,
//                                 endIndent: 20,
//                                 height: 1,
//                                 thickness: 2,
//                               ),
//                               SizedBox(
//                                 height: size.height * 0.03,
//                               ),
//                               CustomTextFromField(
//                                   obscureText: true,
//                                   text: '\t\t\tPassword',
//                                   fontSize: 18,
//                                   color: Color(0xff300C92),
//                                   hint: 'Password',
//                                   icon_name: Icon(
//                                     MyFlutterApp.lock,
//                                     size: 20,
//                                     color: Color(0xffF95DDE),
//                                   ),
//                                   onSave: (value) {
//                                     controller.password = value!;
//                                   },
//                                   validator: (value) {
//                                     confirmPass = value;
//                                     if (value!.isEmpty) {
//                                       return "\t\t\t\t\t\tPassword Is Required";
//                                     } else {
//                                       return null;
//                                     }
//                                   }),
//                               const Divider(
//                                 color: Color(0xff3E1E96),
//                                 indent: 20,
//                                 endIndent: 20,
//                                 height: 1,
//                                 thickness: 2,
//                               ),
//                               SizedBox(
//                                 height: size.height * 0.03,
//                               ),
//                               Container(
//                                 child: TextButton(
//                                     onPressed: () {
//                                       _formKey.currentState?.save();
      
//                                       if (_formKey.currentState!.validate()) {
//                                         if (ctrl.checkbool.value == true) {
//                                           keepUserLoggedIn();
//                                         }
//                                         controller.signInWithEmailAndPassword();
//                                       }
//                                     },
//                                     style: TextButton.styleFrom(
//                                       minimumSize: Size(
//                                           size.width * 0.8, size.height * 0.06),
//                                       // padding: EdgeInsets.symmetric(
//                                       //   horizontal:
//                                       //       size.width * 0.35,
//                                       //   // double.infinity,
//                                       //   vertical: size.height *
//                                       //       0.023,
//                                       // ),
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.only(
//                                         topLeft: Radius.circular(25),
//                                         bottomRight: Radius.circular(25),
//                                       )),
//                                       backgroundColor: secondaryColor,
//                                     ),
//                                     child: CustomText(
//                                         text: 'LOGIN',
//                                         textStyle: TextStyle(
//                                             color: Colors.white,
//                                             fontFamily: 'Inter',
//                                             fontWeight: FontWeight.w800,
//                                             fontSize: 14))),
//                               ),
//                               SizedBox(
//                                 height: size.height * 0.001,
//                               ),
//                               Row(
//                                 children: <Widget>[
//                                   Theme(
//                                     data: ThemeData(
//                                         unselectedWidgetColor: primaryColor),
//                                     child: Obx(
//                                       () => Checkbox(
//                                         checkColor: primaryColor,
//                                         activeColor: secondaryColor,
//                                         value: ctrl.checkbool.value,
//                                         onChanged: (value) {
//                                           ctrl.checkbool.value =
//                                               !ctrl.checkbool.value;
//                                           print(ctrl.checkbool.value);
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                   CustomText(
//                                       text: "Remember Me ",
//                                       textStyle: TextStyle(
//                                           color: Color(0xff300C92),
//                                           fontFamily: 'Inter',
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 14)),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   CustomText(
//                                     text: "Dont't have an account?",
//                                     textStyle:
//                                         TextStyle(color: Color(0xff6D6487)),
//                                   ),
//                                   // SizedBox(
//                                   //   width: size.width * 0.001,
//                                   // ),
//                                   TextButton(
//                                     style: TextButton.styleFrom(
//                                       padding: EdgeInsets.all(0),
//                                     ),
//                                     onPressed: () {
//                                       Get.to(() => patient_register());
//                                     },
//                                     child: CustomText(
//                                       text: "Register",
//                                       textStyle: TextStyle(
//                                           color: Color(0xff4CD2CF),
//                                           decoration: TextDecoration.underline),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: size.height * 0.015,
//                               ),
//                               CustomText(
//                                 text:
//                                     '-\u00a0 - \u00a0- \u00a0 or \u00a0 -\u00a0 -\u00a0 - ',
//                                 textStyle: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 16,
//                                   // (
//                                   //   size.width +
//                                   //         size.width) /
//                                   //     2 *
//                                   //     0.05,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: size.height * 0.02,
//                               ),
//                               CustomText(
//                                 text: 'Continue with',
//                                 textStyle: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 16,
//                                   // (
//                                   //   size.width +
//                                   //         size.width) /
//                                   //     2 *
//                                   //     0.05,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   TextButton(
//                                     onPressed: () {},
//                                     style: TextButton.styleFrom(
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.only(
//                                         topLeft: Radius.circular(15),
//                                         bottomRight: Radius.circular(15),
//                                       )),
//                                       backgroundColor: primaryColor,
//                                       minimumSize: Size(
//                                           size.width * 0.15, size.height * 0.062),
//                                     ),
//                                     child: SvgPicture.asset(
//                                         'assets/images/facebook.svg'),
//                                   ),
//                                   SizedBox(width: size.width * 0.02),
//                                   TextButton(
//                                     onPressed: () {},
//                                     style: TextButton.styleFrom(
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.only(
//                                         topLeft: Radius.circular(15),
//                                         bottomRight: Radius.circular(15),
//                                       )),
//                                       // padding: EdgeInsets.symmetric(
//                                       //   vertical:
//                                       //       size.height * 0.02,
//                                       // ),
//                                       minimumSize: Size(
//                                           size.width * 0.15, size.height * 0.062),
//                                       backgroundColor: primaryColor,
//                                     ),
//                                     child: SvgPicture.asset(
//                                         'assets/images/twitter.svg'),
//                                   ),
//                                   SizedBox(width: size.width * 0.02),
//                                   TextButton(
//                                     onPressed: () {},
//                                     style: TextButton.styleFrom(
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.only(
//                                         topLeft: Radius.circular(15),
//                                         bottomRight: Radius.circular(15),
//                                       )),
//                                       backgroundColor: primaryColor,
//                                       minimumSize: Size(
//                                           size.width * 0.15, size.height * 0.062),
//                                     ),
//                                     child: SvgPicture.asset(
//                                         'assets/images/linkedin.svg'),
//                                   ),
//                                 ],
//                               )
//                             ]),
//                       )
//                     ],
//                   ),
//                 ]),
//               ),
//             ])),
//       ),
//     );
//   }
// }

// class CheckController extends GetxController {
//   var checkbool = false.obs;
// }
