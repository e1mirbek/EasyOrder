import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> registerNewUser(
    String email,
    String fullName,
    String password,
  ) async {
    // Логика регистрации нового пользователя
    // Например, можно использовать FirebaseAuth для регистрации

    String res = 'Some error occurred';

    // Пример регистрации с помощью FirebaseAuth
    try {
      if (email.isNotEmpty && fullName.isNotEmpty && password.isNotEmpty) {
        await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
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
}
