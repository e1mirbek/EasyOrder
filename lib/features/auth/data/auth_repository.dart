import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_order/core/errors/failure.dart';
import 'package:easy_order/core/utils/auth_error_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

class AuthRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  AuthRepository({
    required FirebaseAuth auth,
    required FirebaseFirestore firestore,
  }) : _auth = auth,
       _firestore = firestore;

  /// стрим для отслеживания изменений в состоянии авторизации
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> signUp(String email, String fullName, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final String uid = userCredential.user!.uid;

      await _firestore.collection('buyers').doc(uid).set({
        'fullName': fullName,
        'email': email,
        'profilePicture': '',
        'uid': uid,
        'pinCode': '',
        'location': '',
        'city': '',
        'state': '',
        'createdAt': FieldValue.serverTimestamp(),
      });
    } on FirebaseAuthException catch (e) {
      final errorMessage = AuthErrorHandler.mapFirebaseError(e.code);
      throw AuthFailure(errorMessage);
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
    } on FirebaseAuthException catch (e) {
      final errorMessage = AuthErrorHandler.mapFirebaseError(e.code);
      throw AuthFailure(errorMessage);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
