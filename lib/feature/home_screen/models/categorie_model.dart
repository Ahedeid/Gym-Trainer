import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String name;
  final String id;
  final String goalID;
  final String image;

  CategoryModel({
    required this.name,
    required this.id,
    required this.image,
    required this.goalID,
  });

  factory CategoryModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return CategoryModel(
      id: data["exercise_category_id"],
      name: data['name'],
      image: data['image'],
      goalID: data['goal_id'],
    );
  }
}
