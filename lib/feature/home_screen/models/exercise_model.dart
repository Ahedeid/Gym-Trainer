import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';

class ExerciseModel {
  final String? id;
  final String? title;
  final String? description;
  final bool? isFavorite;
  final bool? isLocked;
  final String? categoryId;
  final String? goalId;
  final String? image;
  final Level? level;
  final String? time;
  final String? kal;

  ExerciseModel({
    this.id,
    this.title,
    this.description,
    this.isFavorite = false,
    this.isLocked = false,
    this.categoryId,
    this.image,
    this.level,
    this.time,
    this.goalId,
    this.kal,
  });
  factory ExerciseModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;

    return ExerciseModel(
      id: snapshot.id,
      title: data?['title'],
      description: data?['description'],
      isFavorite: data?['isFavorite'] ?? false,
      isLocked: data?['isLock'] ?? false,
      categoryId: data?['categorie_id'],
      image: data?['image'],
      level: parseLevel(data?['level']),
      time: data?['time'],
      goalId: data?['goal_id'],
      kal: data?['kal'],
    );
  }
  @override
  String toString() {
    return 'ExerciseModel(id: $id, title: $title, description: $description, isFavorite: $isFavorite, isLocked: $isLocked, categoryId: $categoryId, goalId: $goalId, image: $image, level: $level, time: $time, kal: $kal)';
  }

  String get levelDisplay {
    switch (level) {
      case Level.Beginner:
        return 'Beginner'.tr();
      case Level.Intermediate:
        return 'Intermediate'.tr();
      case Level.Advanced:
        return 'Advanced'.tr();
      default:
        return 'Unknown';
    }
  }

  static Level? parseLevel(String? levelString) {
    switch (levelString) {
      case '0':
        return Level.Beginner;
      case '1':
        return Level.Intermediate;
      case '2':
        return Level.Advanced;
      default:
        return null;
    }
  }
}

enum Level {
  Beginner,
  Intermediate,
  Advanced,
}
