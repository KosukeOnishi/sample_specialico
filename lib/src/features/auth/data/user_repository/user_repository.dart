import 'package:specialico/index.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

part 'user_repository.g.dart';

@Riverpod(keepAlive: true)
class UserRepository extends _$UserRepository {
  @override
  User? build() {
    debugPrint('user repository build');
    return null;
  }

  Future<void> createUser(auth.User firebaseUser) async {
    await UserDao.createUser(firebaseUser);
  }

  Future<bool> checkUser() async {
    final firebaseUser = (await auth.FirebaseAuth.instance.userChanges().first)!;
    return await UserDao.checkUser(firebaseUser);
  }

  Future<User> getUser() async {
    debugPrint('getUser called');
    final firebaseUser = (await auth.FirebaseAuth.instance.userChanges().first)!;
    final user = await UserDao.getUser(firebaseUser.uid);
    state = user;
    return user;
  }

  Future<void> updateName(String newName) async {
    await UserDao.updateName(newName, state!.userId);
    state = state!.copyWith(name: newName);
  }

  Future<void> updateNameAndImage(String newName, String imageUrl) async {
    await UserDao.updateNameAndImage(newName, imageUrl, state!.userId);
    state = state!.copyWith(name: newName, profileImageUrl: imageUrl);
  }

  Future<void> deleteUser(String userId) async {
    await UserDao.createUserDelete(userId);
  }
}
