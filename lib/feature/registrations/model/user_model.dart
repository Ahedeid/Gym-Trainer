import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String image;
  final String phone;
  final String selectedGoal;
  final String level;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.image,
    required this.phone,
    required this.selectedGoal,
    required this.level,
  });

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return UserModel(
      uid: data['uid'],
      name: data['name'],
      email: data['email'],
      image: data['image'] ?? '',
      phone: data['phone'] ?? '',
      selectedGoal: data['goal'] ?? "DLlfkpNUXfPdjm8HIYmg",
      level: data['level'].toString(),
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      image: json['image'] ?? '',
      phone: json['phone'] ?? '',
      selectedGoal: json['goal'] ?? "DLlfkpNUXfPdjm8HIYmg",
      level: json['level'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'image': image,
      'phone': phone,
      'goal': selectedGoal.trim() == "" ? "DLlfkpNUXfPdjm8HIYmg" : selectedGoal,
      'level': level,
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
      level: this.level,
    );
  }

  UserModel copyWithUserProfile(
      {String? name, String? email, String? phone, String? image}) {
    return UserModel(
      uid: this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      image: image ?? this.image,
      phone: phone ?? this.phone,
      selectedGoal: this.selectedGoal,
      level: this.level,
    );
  }

  UserModel copyWithLevel({level}) {
    return UserModel(
      uid: this.uid,
      name: this.name,
      email: this.email,
      image: this.image,
      phone: this.phone,
      selectedGoal: this.selectedGoal,
      level: level ?? this.level,
    );
  }
}
