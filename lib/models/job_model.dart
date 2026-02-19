import 'package:cloud_firestore/cloud_firestore.dart';

class JobModel {
  final String id;
  final Map<String, String> recruiter;
  final Map<String, String> position;
  final Map<String, String> location;
  final Map<String, String> jobDescription;
  final Map<String, String> jobRequirements;
  final DateTime date;
  final int salary;
  final String imageUrl;

  const JobModel({
    required this.id,
    required this.recruiter,
    required this.position,
    required this.location,
    required this.jobDescription,
    required this.jobRequirements,
    required this.date,
    required this.salary,
    required this.imageUrl,
  });

  factory JobModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return JobModel(
      id: doc.id,
      recruiter: Map<String, String>.from(data['recruiter'] ?? ''),
      position: Map<String, String>.from(data['position'] ?? ''),
      location: Map<String, String>.from(data['location'] ?? ''),
      jobDescription: Map<String, String>.from(data['jobDescription'] ?? ''),
      jobRequirements: Map<String, String>.from(data['jobRequirements'] ?? ''),
      date: (data['date'] as Timestamp?)?.toDate() ?? DateTime.now(),
      salary: data['salary'] ?? 0,
      imageUrl: data['imageUrl'] ?? '',
    );
  }

  String getRecruiter(String languageCode) =>
      recruiter[languageCode] ?? recruiter['en']!;
  String getPosition(String languageCode) =>
      position[languageCode] ?? position['en']!;
  String getLocation(String languageCode) =>
      location[languageCode] ?? location['en']!;
  String getJobDescription(String languageCode) =>
      jobDescription[languageCode] ?? jobDescription['en']!;
  String getJobRequirements(String languageCode) =>
      jobRequirements[languageCode] ?? jobRequirements['en']!;
}
