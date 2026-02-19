import 'package:cloud_firestore/cloud_firestore.dart';

class NewsModel {
  final String id;
  final Map<String, String> title;
  final Map<String, String> brief;
  final Map<String, String> description;
  final String imageUrl;
  final DateTime date;

  const NewsModel({
    required this.id,
    required this.title,
    required this.brief,
    required this.description,
    required this.imageUrl,
    required this.date,
  });

  factory NewsModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return NewsModel(
      id: doc.id,
      title: Map<String, String>.from(data['title']),
      brief: Map<String, String>.from(data['brief']),
      description: Map<String, String>.from(data['description']),
      imageUrl: data['imageUrl'] ?? '',
      date: (data['date'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  String getTitle(String languageCode) => title[languageCode] ?? title['en']! ;
  String getBrief(String languageCode) => brief[languageCode] ?? brief['en']!;
  String getDescription(String languageCode) =>
      description[languageCode] ?? description['en']!;
}
