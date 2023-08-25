import 'package:firebase_auth/firebase_auth.dart';
import 'package:specialico/index.dart';

abstract class GoogleAuthClient {
  static Future<bool> signIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    final account = await _handleSignIn(googleSignIn);
    debugPrint(account?.id);

    if (account == null) return false;

    // リクエストから、認証情報を取得
    final googleAuth = await account.authentication;
    // クレデンシャルを新しく作成
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    try {
      // サインインしたら、UserCredentialを返す
      await FirebaseAuth.instance.signInWithCredential(credential);
      debugPrint('success');
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<GoogleSignInAccount?> _handleSignIn(
      GoogleSignIn googleSignIn) async {
    try {
      final account = await googleSignIn.signIn();
      return account;
    } catch (error) {
      debugPrint(error.toString());
      return null;
    }
  }
}
