import 'package:specialico/index.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

part 'auth_screen_controller.g.dart';
part 'auth_screen_controller.freezed.dart';

@freezed
class AuthScreenState with _$AuthScreenState {
  const factory AuthScreenState({
    @Default(false) bool isLoading,
  }) = _AuthScreenState;
}

@riverpod
class AuthScreenController extends _$AuthScreenController {
  @override
  AuthScreenState build() {
    debugPrint('AuthScreenController build');
    return const AuthScreenState();
  }

  void onPressedGoogle(BuildContext context) async {
    debugPrint('pressed google');
    state = state.copyWith(isLoading: true);
    final succeeded = await AuthService.signInWithGoogle();
    if (context.mounted) {
      _checkResultAndCreateAccount(context, succeeded, AuthSignInType.google);
    }
  }

  void onPressedApple(BuildContext context) async {
    debugPrint('pressed apple');
    state = state.copyWith(isLoading: true);
    final succeeded = await AuthService.signInWithApple();
    if (context.mounted) {
      _checkResultAndCreateAccount(context, succeeded, AuthSignInType.apple);
    }
  }

  void onPressedAnonymous(BuildContext context) async {
    debugPrint('pressed anonymous');
    state = state.copyWith(isLoading: true);
    final succeeded = await AuthService.signInAnonymously();
    if (context.mounted) {
      _checkResultAndCreateAccount(
          context, succeeded, AuthSignInType.anonymous);
    }
  }

  void _checkResultAndCreateAccount(
      BuildContext context, bool succeeded, AuthSignInType type) async {
    if (!succeeded) {
      state = state.copyWith(isLoading: false);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          surfaceTintColor: Theme.of(context).colorScheme.background,
          title: const Text(
            '認証エラー',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text('時間をおいて再度試すか、他の認証方法をお試しください'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Center(child: Text('OK')),
            ),
          ],
        ),
      );
    } else {
      final shouldCreateAccount = !(await AuthService.checkAccount(
          ref.read(userRepositoryProvider.notifier)));
      if (shouldCreateAccount) {
        await AuthService.createUserDoc(
            ref.read(userRepositoryProvider.notifier), type);
        await AuthService.initUserRepository(
          ref.read(userRepositoryProvider.notifier),
          ref.read(likedShopIdsRepositoryProvider.notifier),
        );
        state = state.copyWith(isLoading: false);
        if (type == AuthSignInType.anonymous) {
          if (context.mounted) context.beamToNamed('/auth/onboarding');
        } else {
          if (context.mounted) context.beamToNamed('/auth/profile');
        }
      } else {
        auth.FirebaseAuth.instance.userChanges().first.then(
              (firebaseUser) => AnalyticsClient().logEvent(LogEvent.login, {
                'type': type.name,
                'uid': firebaseUser!.uid,
                'email': firebaseUser.email,
              }),
            );
        state = state.copyWith(isLoading: false);
        if (context.mounted) App.restart(context);
      }
    }
  }
}
