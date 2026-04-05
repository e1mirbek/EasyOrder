import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_order/core/errors/failure.dart';
import 'package:easy_order/core/utils/auth_error_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Провайдер, чтобы контроллер мог "нанять" этот репозиторий (пв)

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

  // Стрим для отслеживания состояния (залогинен или нет)

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Метод регистрации (только логика данных)
  Future<void> signUp(String email, String fullName, String password) async {
    try {
      // Регистрация в Auth
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final String uid = userCredential.user!.uid;

      // Запись в FireStore
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

  // Метод для входа (логин)
  // ВХОД В СИСТЕМУ
  Future<UserCredential> signIn(String email, String password) async {
    try {
      // Это стандартный метод Firebase. Он сам ищет юзера в базе.
      return await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
    } on FirebaseAuthException catch (e) {
      // Здесь мы ловим конкретные ошибки от Firebase
      final errorMessage = AuthErrorHandler.mapFirebaseError(e.code);
      throw AuthFailure(errorMessage);
    }
  }

  // Метод для выхода (логаут)
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
