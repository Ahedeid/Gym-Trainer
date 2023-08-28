import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String image;
  final String phone;
  final String selectedGoal;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.image,
    required this.phone,
    required this.selectedGoal,
  });

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return UserModel(
      uid: data['uid'],
      name: data['name'],
      email: data['email'],
      image: data['image'],
      phone: data['phone'],
      selectedGoal: data['goal'],
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      image: json['image'],
      phone: json['phone'],
      selectedGoal: json['goal'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'image': image,
      'phone': phone,
      'goal': selectedGoal,
    };
  }

  UserModel copyWith({String? selectedGoal}) {
    return UserModel(
      uid: this.uid,
      name: this.name,
      email: this.email,
      image: this.image,
      phone: this.phone,
      selectedGoal: selectedGoal ?? this.selectedGoal,
    );
  }
}
