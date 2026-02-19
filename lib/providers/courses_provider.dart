import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:doctors_association_app/models/course_model.dart';

final coursesProvider = StreamProvider<List<CourseModel>>((ref) {
  return FirebaseFirestore.instance
      .collection('courses')
      .orderBy('date', descending: false)
      .snapshots()
      .map(
        (snapshot) =>
            snapshot.docs.map((doc) => CourseModel.fromFirestore(doc)).toList(),
      );
});
