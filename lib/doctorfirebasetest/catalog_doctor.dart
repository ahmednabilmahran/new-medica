import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/doctorfirebasetest/doctor_controller.dart';

class CatalogDoctor extends StatelessWidget {
  final doctorController = Get.put(DoctorController());

  CatalogDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flexible(
        child: ListView.builder(
            itemCount: doctorController.doctor.length,
            itemBuilder: (BuildContext context, int index) {
              return CatalogDoctorCard(index: index);
            }),
      ),
    );
  }
}

class CatalogDoctorCard extends StatelessWidget {
  final cartController = Get.put(DoctorController());
  final DoctorController doctorController = Get.find();
  final int index;

  CatalogDoctorCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              doctorController.doctor[index].imageAddress,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Text(
              doctorController.doctor[index].name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: Text('${doctorController.doctor[index].speciality}'),
          ),
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(
          //     Icons.add_circle,
          //   ),
          // ),
        ],
      ),
    );
  }
}
