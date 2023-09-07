import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationsModel {
  final String id;
  final String title;
  final String body;
  final String time;

  NotificationsModel({
    required this.body,
    required this.title,
    required this.id,
    required this.time,
  });

  factory NotificationsModel.fromJson(QueryDocumentSnapshot<Object?> snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return NotificationsModel(
      body: data['body'],
      title: data['title'],
      id: data['uId'],
      time: data['time'],
    );
  }
}
