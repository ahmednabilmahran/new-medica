import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class rosheta extends StatefulWidget {
  const rosheta({Key? key}) : super(key: key);

  @override
  _roshetaState createState() => _roshetaState();
}

class _roshetaState extends State<rosheta> {
  File? singleImage;
  String? _imagePath;
  @override
  void initState() {
    super.initState();
    loadImage();
  }

  final singlePicker = ImagePicker();
  final multiPicker = ImagePicker();
  List<XFile>? images = [];
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    dynamic email = '';
    dynamic name = '';
    dynamic picture = '';
    if (user != null) {
      email = user.email;
      name = user.displayName;
      picture = user.photoURL;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  getSingleImage();
                },
                child: singleImage == null
                    ? Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                            )),
                        width: 100,
                        height: 100,
                        child: Icon(
                          CupertinoIcons.camera,
                          color: Colors.grey,
                        ),
                      )
                    : Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                            )),
                        width: 100,
                        height: 100,
                        child: Image.file(
                          singleImage!, 
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Mohab Erabi',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey.withOpacity(0.2),
              ),
              SizedBox(
                height: 10,
              ),
              Text('You Can Add Phoots Here'),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    getMultiImages();
                  },
                  child: GridView.builder(
                      itemCount: images!.isEmpty ? 1 : images!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.5))),
                          child: images!.isEmpty
                              ? Icon(
                                  CupertinoIcons.camera,
                                  color: Colors.grey.withOpacity(0.5),
                                )
                              : Image.file(
                                  File(images![index].path),
                                  fit: BoxFit.cover,
                                ))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future getSingleImage() async {
    final pickedImage =
        await singlePicker.getImage(source: (ImageSource.gallery));
    setState(() {
      if (pickedImage != null) {
        singleImage = File(pickedImage.path);
      } else {
        print('No Image Selected');
      }
    });
  }

  Future getMultiImages() async {
    final List<XFile>? selectedImages = await multiPicker.pickMultiImage();
    setState(() {
      if (selectedImages!.isNotEmpty) {
        images!.addAll(selectedImages);
      } else {
        print('No Images Selected ');
      }
      saveImage(_imagePath);
    });
  }

  void saveImage(path) async {
    SharedPreferences saveImage = await SharedPreferences.getInstance();
    saveImage.setString('imagePath', path);
  }

  void loadImage() async {
    SharedPreferences saveImage = await SharedPreferences.getInstance();
    setState(() {
      _imagePath = saveImage.getString("imagePath");
    });
  }
}
