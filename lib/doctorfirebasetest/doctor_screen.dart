import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/doctorfirebasetest/catalog_doctor.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Doctors")),
      body: SafeArea(
        child: Column(
          children: [
            CatalogDoctor(),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: Text('Go to Cart'),
            // ),
          ],
        ),
      ),
    );
  }
}
