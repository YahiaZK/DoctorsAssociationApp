import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_association_app/models/feedback_model.dart';

class FeedbackService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get _feedbackCollection =>
      _firestore.collection('feedback');

  /// Submits feedback to Firestore
  Future<void> submitFeedback(FeedbackModel feedback) async {
    await _feedbackCollection.add(feedback.toFirestore());
  }
}
