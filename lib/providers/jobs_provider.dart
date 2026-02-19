import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:doctors_association_app/models/job_model.dart';

final jobsProvider = StreamProvider<List<JobModel>>((ref) {
  return FirebaseFirestore.instance
      .collection('jobs')
      .orderBy('date', descending: true)
      .snapshots()
      .map(
        (snapshot) =>
            snapshot.docs.map((doc) => JobModel.fromFirestore(doc)).toList(),
      );
});
