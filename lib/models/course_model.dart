import 'package:cloud_firestore/cloud_firestore.dart';

class CourseModel {
  final String id;
  final Map<String, String> title;
  final Map<String, String> description;
  final String imageUrl;
  final DateTime date;
  final Map<String, String> location;
  final bool isOnline;
  final int price;

  const CourseModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.date,
    required this.location,
    required this.isOnline,
    required this.price,
  });

  factory CourseModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CourseModel(
      id: doc.id,
      title: Map<String, String>.from(data['title']),
      description: Map<String, String>.from(data['description']),
      imageUrl: data['imageUrl'] ?? '',
      date: (data['date'] as Timestamp?)?.toDate() ?? DateTime.now(),
      location: data['location'] != null
          ? Map<String, String>.from(data['location'])
          : {},
      isOnline: data['isOnline'] ?? false,
      price: data['price'] ?? 0,
    );
  }

  String getTitle(String languageCode) => title[languageCode] ?? title['en']!;
  String getDescription(String languageCode) =>
      description[languageCode] ?? description['en']!;
  String getLocation(String languageCode) =>
      location.isEmpty ? '' : (location[languageCode] ?? location['en'] ?? '');
}
