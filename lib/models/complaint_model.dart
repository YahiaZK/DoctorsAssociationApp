import 'package:cloud_firestore/cloud_firestore.dart';

class ComplaintModel {
  final String? id;
  final String fullName;
  final String membershipId;
  final String title;
  final String description;
  final DateTime submittedAt;

  const ComplaintModel({
    this.id,
    required this.fullName,
    required this.membershipId,
    required this.title,
    required this.description,
    required this.submittedAt,
  });

  Map<String, dynamic> toFirestore() {
    return {
      'fullName': fullName,
      'membershipId': membershipId,
      'title': title,
      'description': description,
      'submittedAt': Timestamp.fromDate(submittedAt),
    };
  }
}
