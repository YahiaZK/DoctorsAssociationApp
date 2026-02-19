import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:doctors_association_app/models/news_model.dart';

final newsProvider = StreamProvider<List<NewsModel>>((ref) {
  return FirebaseFirestore.instance
      .collection('news')
      .orderBy('date', descending: true)
      .snapshots()
      .map(
        (snapshot) =>
            snapshot.docs.map((doc) => NewsModel.fromFirestore(doc)).toList(),
      );
});
