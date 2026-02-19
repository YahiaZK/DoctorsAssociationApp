import 'package:cloud_firestore/cloud_firestore.dart';

class FeedbackModel {
  final String? id;
  final int stars;
  final String feedback;
  final DateTime submittedAt;

  const FeedbackModel({
    this.id,
    required this.stars,
    required this.feedback,
    required this.submittedAt,
  });

  Map<String, dynamic> toFirestore() {
    return {
      'stars': stars,
      'feedback': feedback,
      'submittedAt': Timestamp.fromDate(submittedAt),
    };
  }
}
