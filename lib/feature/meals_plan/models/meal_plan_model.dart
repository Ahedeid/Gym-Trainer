import 'package:cloud_firestore/cloud_firestore.dart';

class MealPlan {
  final String id;
  final String title;
  final String description;
  final String image;
  final String kcal;
  final String rating;
  final String time;
  final String writeBy;

  MealPlan({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.kcal,
    required this.rating,
    required this.time,
    required this.writeBy,
  });

  factory MealPlan.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;
    return MealPlan(
      id: snapshot.id,
      title: data!['title'],
      description: data['description'] ?? "No desctiption",
      image: data['image'] ?? "No Image",
      kcal: data['kcal'] ?? "",
      rating: data['rating'] ?? "",
      time: data['time'] ?? "",
      writeBy: data['writeby'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'kcal': kcal,
      'rating': rating,
      'time': time,
      'writeby': writeBy,
    };
  }
}
