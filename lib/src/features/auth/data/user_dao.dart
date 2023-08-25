import 'package:specialico/index.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

abstract class UserDao {
  static Future<void> createUser(auth.User firebaseUser) async {
    var data = {
      'userId': firebaseUser.uid,
      'createdAt': FieldValue.serverTimestamp(),
      'name': firebaseUser.displayName ?? '名称未設定',
      'likedShops': [],
      'shopSuggestCount': [],
      'shopReportCount': [],
      'profileImageUrl': firebaseUser.photoURL,
      'isAnonymous': firebaseUser.isAnonymous,
    };

    await FirebaseFirestore.instance
        .collection('public/v1/public_users_v1')
        .doc(firebaseUser.uid)
        .set(data);
  }

  static Future<void> createUserDelete(String userId) async {
    var data = {
      'userId': userId,
      'createdAt': FieldValue.serverTimestamp(),
    };

    await FirebaseFirestore.instance
        .collection('public/v1/delete_users_v1')
        .doc()
        .set(data);
  }

  static Future<bool> checkUser(auth.User firebaseUser) async {
    final doc = await FirebaseFirestore.instance
        .collection('public/v1/public_users_v1')
        .doc(firebaseUser.uid)
        .get();
    return doc.exists;
  }

  static Future<User> getUser(String uid) async {
    final doc = await FirebaseFirestore.instance
        .collection('public/v1/public_users_v1')
        .doc(uid)
        .get();
    return User.fromJson(doc.data()!);
  }

  static Future<void> updateName(String name, String uid) async {
    final userDocRef = FirebaseFirestore.instance
        .collection('public/v1/public_users_v1')
        .doc(uid);
    return userDocRef
        .update({'name': name, 'updatedAt': FieldValue.serverTimestamp()});
  }

  static Future<void> updateNameAndImage(
    String name,
    String imageUrl,
    String uid,
  ) async {
    final userDocRef = FirebaseFirestore.instance
        .collection('public/v1/public_users_v1')
        .doc(uid);
    return userDocRef.update({
      'name': name,
      'profileImageUrl': imageUrl,
      'updatedAt': FieldValue.serverTimestamp()
    });
  }

  static Future<String?> uploadImage(Uint8List imageFile, String uid) async {
    final ref = FirebaseStorage.instance.ref().child('profile/$uid.jpeg');
    try {
      await ref.putData(imageFile);
      return ref.getDownloadURL();
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
