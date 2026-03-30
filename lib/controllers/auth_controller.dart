import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends Notifier<AsyncValue<void>> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> registerNewUser(
    String email,
    String fullName,
    String password,
  ) async {
    String res = 'Произошла ошибка.';
    try {
      if (email.isNotEmpty && fullName.isNotEmpty && password.isNotEmpty) {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);
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
            });
      }

      res = 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        res = 'Пароль слишком слабый';
      } else if (e.code == 'email-already-in-use') {
        res = 'Пользователь с таким email уже существует';
      } else {
        e.message ?? 'Произошла ошибка при регистрации';
      }
    } catch (err) {
      err.toString();
    }
    return res;
  }

  @override
  AsyncValue<void> build() {
    return const AsyncValue.data(null);
  }
}
