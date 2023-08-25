import 'package:specialico/index.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

part 'auth_service.g.dart';

abstract class AuthService {
  static Future<void> initUserRepository(
    UserRepository userRepo,
    LikedShopIdsRepository likedShopIdsRepo,
  ) async {
    final user = await userRepo.getUser();
    likedShopIdsRepo.setIds(user.likedShops);
  }

  static Future<EmailAuthError?> signUpWithEmail({
    required String emailAddress,
    required String password,
  }) async {
    return EmailAuthClient.signUp(
      emailAddress: emailAddress,
      password: password,
    );
  }

  static Future<EmailAuthError?> signInWithEmail({
    required String emailAddress,
    required String password,
  }) async {
    return EmailAuthClient.signIn(
      emailAddress: emailAddress,
      password: password,
    );
  }

  static Future<bool> signInWithGoogle() async {
    return await GoogleAuthClient.signIn();
  }

  static Future<bool> signInWithApple() async {
    return await AppleAuthClient.signIn();
  }

  static Future<bool> signInAnonymously() async {
    try {
      await auth.FirebaseAuth.instance.signInAnonymously();
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<void> signOut() async {
    await auth.FirebaseAuth.instance.signOut();
    await AnalyticsClient().logEvent(LogEvent.logout, {});
    await FirebaseAnalytics.instance
        .setUserProperty(name: 'user_id', value: null);
  }

  static Future<void> createUserDoc(
      UserRepository userRepo, AuthSignInType type) async {
    final firebaseUser =
        (await auth.FirebaseAuth.instance.userChanges().first)!;
    AnalyticsClient().logEvent(LogEvent.signUp, {
      'type': type.name,
      'uid': firebaseUser.uid,
      'name': firebaseUser.displayName ?? '',
      'email': firebaseUser.email ?? '',
    });
    await userRepo.createUser(firebaseUser);
  }

  static Future<bool> checkAccount(UserRepository userRepo) async {
    return await userRepo.checkUser();
  }

  static Future<void> updateProfile(
    UserRepository userRepo,
    String name,
    String userId,
    Uint8List? imageFile,
  ) async {
    debugPrint('imageFile != null: ${(imageFile != null).toString()}');
    if (imageFile == null) {
      await userRepo.updateName(name);
    } else {
      final compressedFile = await ImageCompressor.compressImageFile(imageFile);
      final String? imageUrl =
          await UserDao.uploadImage(compressedFile, userId);
      debugPrint(imageUrl);
      imageUrl != null
          ? await userRepo.updateNameAndImage(name, imageUrl)
          : await userRepo.updateName(name);
    }
  }

  static Future<void> deleteUser(UserRepository userRepo, String userId) async {
    await userRepo.deleteUser(userId);
    await AnalyticsClient()
        .logEvent(LogEvent.deleteAccount, {'userId': userId});
    await FirebaseAnalytics.instance
        .setUserProperty(name: 'user_id', value: null);
  }

  static void requestSignUp(BuildContext context, SignUpRequestType type) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        surfaceTintColor: Theme.of(context).colorScheme.background,
        title: const Text(
          'ユーザー登録が必要です',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: const Text(
          'お持ちのGoogleアカウントやAppleアカウントですぐに登録できます。',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'キャンセル',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.8),
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await AuthService.signOut();
              final exp = RegExp('(?<=[a-z])[A-Z]');
              await AnalyticsClient().logEvent(LogEvent.signUpRequest, {
                'type': type.name.replaceAllMapped(exp, (m) => '_${m.group(0)}').toLowerCase(),
              });
              if (context.mounted) App.restart(context);
            },
            child: const Text('登録に進む'),
          ),
        ],
      ),
    );
  }
}

@riverpod
bool isLiked(IsLikedRef ref, String shopId) {
  final likedShopIds = ref.watch(likedShopIdsRepositoryProvider);
  return likedShopIds.contains(shopId);
}
