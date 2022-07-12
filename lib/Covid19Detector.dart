// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medica/patient/patient_home.dart';
import 'package:medica/patient/patient_profile.dart';
import 'package:medica/view/widgets/constance.dart';
import 'package:medica/view/widgets/custom_text.dart';
import 'package:tflite/tflite.dart';

import 'view/widgets/custom_background.dart';

class Covid19Detector extends StatefulWidget {
  @override
  _Covid19DetectorState createState() => _Covid19DetectorState();
}

class _Covid19DetectorState extends State<Covid19Detector> {
  bool? _isLoading;
  File? _image;
  List? _output;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLoading = true;
    loadMLModel().then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        // Get.to(loginAs());
        Get.to(() => patient_home());
        return true;
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: () {
            chooseImage();
          },
          child: Icon(
            Icons.image,
            color: Colors.white,
          ),
        ),
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
                        text: "USERNAME",
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600),
                      ),
                      Image.asset('assets/images/Notify.png')
                    ],
                  ),
                ],
              ),
            ),
            Stack(alignment: Alignment.bottomCenter, children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      // right: size.width * 0.08,
                      // left: size.width * 0.08,
                      top: size.height * 0.04,
                    ),
                    // color: Colors.green,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(75),
                        // topRight: Radius.circular(10),
                      ),
                      color: whitegrayish,
                    ),
                    height: size.height * 0.88,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          // padding: EdgeInsets.only(bot),
                          margin: EdgeInsets.only(bottom: size.height * 0.01),
                          child: Wrap(
                            // alignment: WrapAlignment.start,
                            // direction: Axis.horizontal,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  right: size.width * 0.08,
                                  left: size.width * 0.08,
                                ),
                                child: CustomText(
                                  textAlign: TextAlign.left,
                                  text: 'Medica™ Covid-19 Detector',
                                  textStyle: TextStyle(
                                    color: primaryColor,
                                    fontSize: 19.7,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Inter',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: size.height * 0.1),
                          padding: EdgeInsets.only(
                            right: size.width * 0.08,
                            left: size.width * 0.08,
                          ),
                          // width: double.infinity,
                          // color: Colors.amber,
                          height: size.height * 0.58,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // alignment: WrapAlignment.spaceBetween,
                            // crossAxisAlignment: WrapCrossAlignment.end,
                            children: [
                              Container(
                                child: _isLoading!
                                    ? Container(
                                        alignment: Alignment.center,
                                        child: CircularProgressIndicator(),
                                      )
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          _image == null
                                              ? Container()
                                              : Image.file(_image!),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          _output == null
                                              ? Text("")
                                              : Text("${_output![0]["label"]}")
                                        ],
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }

  chooseImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _isLoading = true;
      _image = File(image.path);
    });
    runModelOnImage(_image!);
  }

  runModelOnImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 2,
        imageMean: 127.5,
        imageStd: 127.5,
        threshold: 0.5);
    setState(() {
      _isLoading = false;
      _output = output!;
    });
  }

  loadMLModel() async {
    await Tflite.loadModel(
        model: "assets/model_unquant.tflite", labels: "assets/labels.txt");
  }
}
