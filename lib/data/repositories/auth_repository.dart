import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<void> signUp(
    String email,
    String fullName,
    String password,
  ) async {
    try {
      // Регистрация в Auth
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Запись в FireStore
      if (userCredential.user != null) {
        await _firestore
            .collection('buyers')
            .doc(userCredential.user!.uid)
            .set({
              'fullName': fullName,
              'profilePicture': '',
              'uid': userCredential.user!.uid,
              'pinCode': '',
              'location': '',
              'city': '',
              'state': '',
              'dateCreated': DateTime.now(),
            });
      }
    } on FirebaseAuthException catch (e) {
      // Прокидываем ошибку дальше в контроллер
      throw e.message ?? 'An error occurred';
    } catch (e) {
      throw 'An unexpected error occurred';
    }
  }
}
