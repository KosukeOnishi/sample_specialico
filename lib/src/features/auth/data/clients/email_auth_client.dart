import 'package:firebase_auth/firebase_auth.dart';
import 'package:specialico/index.dart';

abstract class EmailAuthClient {
  static Future<EmailAuthError?> signUp({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      debugPrint(credential.user!.uid);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return EmailAuthError.weakPassword;
      } else if (e.code == 'email-already-in-use') {
        return EmailAuthError.alreadyInUse;
      }
    } catch (e) {
      return EmailAuthError.unknown;
    }
    return null;
  }

  static Future<EmailAuthError?> signIn({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      debugPrint(credential.user!.uid);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return EmailAuthError.notFound;
      } else if (e.code == 'wrong-password') {
        return EmailAuthError.wrongPassword;
      }
    } catch (e) {
      return EmailAuthError.unknown;
    }
    return null;
  }
}
