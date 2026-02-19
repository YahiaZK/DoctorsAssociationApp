import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_association_app/models/complaint_model.dart';

class ComplaintsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get _complaintsCollection =>
      _firestore.collection('complaints');

  /// Submits a new complaint to Firestore
  Future<void> submitComplaint(ComplaintModel complaint) async {
    await _complaintsCollection.add(complaint.toFirestore());
  }
}
