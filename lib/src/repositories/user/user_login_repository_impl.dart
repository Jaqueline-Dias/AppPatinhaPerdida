import 'package:firebase_auth/firebase_auth.dart';

import 'user_login_repository.dart';

class UserLoginRepositoryImpl implements UserLoginRepository {
  final FirebaseAuth _firebaseAuth;

  UserLoginRepositoryImpl(this._firebaseAuth);

  @override
  Future<String?> execute(String email, String password) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Retorne o token de autenticação do usuário
      return userCredential.user!.uid;
    } catch (e) {
      // Trate possíveis erros aqui (por exemplo, FirebaseAuthException)
      // e converta-os para AuthException personalizado, se necessário
      // throw AuthException(message: e.toString());
      return null;
    }
  }
}
