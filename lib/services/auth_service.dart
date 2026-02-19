import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:doctors_association_app/models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Stream to track login status
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> login(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    // Create user with Firebase Auth
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Create user document in Firestore
    final user = UserModel(
      uid: userCredential.user!.uid,
      email: email,
      firstName: firstName,
      lastName: lastName,
      createdAt: DateTime.now(),
    );

    await _firestore
        .collection('users')
        .doc(userCredential.user!.uid)
        .set(user.toFirestore());
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
