import 'package:cloud_firestore/cloud_firestore.dart';

class ArticlesModel {
  final String uId;
  final String image;
  final String title;
  final String body;
  final String subTitle;

  ArticlesModel({
    required this.uId,
    required this.image,
    required this.title,
    required this.body,
    required this.subTitle,
  });

  factory ArticlesModel.fromQueryDocumentSnapshot(
      QueryDocumentSnapshot<Object?> snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return ArticlesModel(
      uId: data['uId'],
      image: data['image'],
      title: data['title'],
      body: data['body'],
      subTitle: data['subTitle'],
    );
  }
}
