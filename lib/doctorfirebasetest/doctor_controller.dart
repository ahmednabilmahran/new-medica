import 'package:get/get.dart';
import 'package:medica/doctorfirebasetest/doctor_model.dart';
import 'package:medica/services/firestore_db.dart';

class DoctorController extends GetxController {
  // Add a list of Doctor objects.
  final doctor = <Doctor>[].obs;

  @override
  void onInit() {
    doctor.bindStream(FirestoreDB().getAllDoctors());
    super.onInit();
  }
}
