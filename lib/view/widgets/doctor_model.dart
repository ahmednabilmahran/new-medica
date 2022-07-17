import 'package:cloud_firestore/cloud_firestore.dart';

class Doctor {
  // Product's variables: name, price, imageUrl. All required.
  final String name;
  final String speciality;
  final String imageAddress;
  final String email;

  const Doctor({
    required this.name,
    required this.speciality,
    required this.imageAddress,
    required this.email
  });

  static Doctor fromSnapshot(DocumentSnapshot snap) {
    Doctor doctor = Doctor(
      name: snap['name'],
      speciality: snap['speciality'],
      imageAddress: snap['imageAddress'],
      email: snap['email']
    );
    return doctor;
  }

  // static const List<Product> products = [
  //   Product(
  //       name: 'Apple',
  //       price: 2.99,
  //       imageUrl:
  //           'https://images.unsplash.com/photo-1568702846914-96b305d2aaeb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80'),
  //   Product(
  //       name: 'Orange',
  //       price: 2.99,
  //       imageUrl:
  //           'https://images.unsplash.com/photo-1547514701-42782101795e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
  //   Product(
  //       name: 'Pear',
  //       price: 2.99,
  //       imageUrl:
  //           'https://images.unsplash.com/photo-1548199569-3e1c6aa8f469?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=638&q=80'),
  // ];
}
