import 'package:firebase_auth/firebase_auth.dart';
import 'package:specialico/index.dart';

abstract class AppleAuthClient {
  static Future<bool> signIn() async {
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    // OAthCredentialのインスタンスを作成
    OAuthProvider oauthProvider = OAuthProvider('apple.com');
    final credential = oauthProvider.credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
    );
    try {
      // サインインしたら、UserCredentialを返す
      await FirebaseAuth.instance.signInWithCredential(credential);
      return true;
    } catch (e) {
      return false;
    }
  }
}
