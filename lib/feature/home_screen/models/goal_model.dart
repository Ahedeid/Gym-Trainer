import 'package:cloud_firestore/cloud_firestore.dart';

class GoalModel {
  final String name;
  final String id;
  final List<dynamic>? categorieList;

  GoalModel({
    required this.name,
    required this.id,
    required this.categorieList,
  });

  factory GoalModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return GoalModel(
      id: data["id"],
      name: data['name'],
      categorieList: data['categorie_list'] ?? [],
    );
  }
}
