import 'package:specialico/index.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

part 'email_auth_screen_controller.g.dart';
part 'email_auth_screen_controller.freezed.dart';

@freezed
class EmailAuthScreenState with _$EmailAuthScreenState {
  const factory EmailAuthScreenState({
    @Default(false) bool isEmailValid,
    @Default(false) bool isPasswordValid,
    @Default(false) bool isEmailForm,
    @Default(true) bool isEmailHalfWidth,
    @Default(false) bool isPasswordForm,
    @Default(true) bool isPasswordHalfWidth,
    @Default(false) bool isEmailSubmitted,
    @Default(false) bool isPasswordSubmitted,
    @Default(false) bool isLoading,
  }) = _EmailAuthScreenState;
}

@riverpod
class EmailAuthScreenController extends _$EmailAuthScreenController {
  // ignore: annotate_overrides, overridden_fields
  late TextEditingController emailController;
  // ignore: overridden_fields, annotate_overrides
  late TextEditingController passwordController;

  @override
  EmailAuthScreenState build(
    TextEditingController emailController,
    TextEditingController passwordController,
  ) {
    debugPrint('EmailAuthScreenController build');
    emailController = emailController;
    passwordController = passwordController;
    return const EmailAuthScreenState();
  }

  void submit(EmailAuthType authType, BuildContext context) async {
    debugPrint('pressed submit');
    state = state.copyWith(isLoading: true);
    EmailAuthError? result;
    if (authType == EmailAuthType.signUp) {
      result = await AuthService.signUpWithEmail(
        emailAddress: emailController.text,
        password: passwordController.text,
      );
    } else {
      result = await AuthService.signInWithEmail(
        emailAddress: emailController.text,
        password: passwordController.text,
      );
    }
    if (result != null && context.mounted) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          surfaceTintColor: Theme.of(context).colorScheme.background,
          title: const Text(
            '認証エラー',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(result!.displayText),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Center(child: Text('やり直す')),
            ),
          ],
        ),
      );
    } else if (authType == EmailAuthType.signUp) {
      await AuthService.createUserDoc(
          ref.read(userRepositoryProvider.notifier), AuthSignInType.email);
      await AuthService.initUserRepository(
        ref.read(userRepositoryProvider.notifier),
        ref.read(likedShopIdsRepositoryProvider.notifier),
      );
      state = state.copyWith(isLoading: false);
      if (context.mounted) context.beamToNamed('/auth/profile');
    } else {
      auth.FirebaseAuth.instance.userChanges().first.then(
            (firebaseUser) => AnalyticsClient().logEvent(LogEvent.login, {
              'type': AuthSignInType.email.name,
              'uid': firebaseUser!.uid,
              'email': firebaseUser.email,
            }),
          );
      state = state.copyWith(isLoading: false);
      // ログインするときはオンボーディングに飛ばない
      App.restart(context);
    }
  }

  void onSubmitEmail() {
    state = state.copyWith(isEmailSubmitted: true);
  }

  void onSubmitPassword() {
    state = state.copyWith(isPasswordSubmitted: true);
  }

  void onChangeEmail(String value) async {
    final isEmailForm = EmailValidator.validate(value);
    final isNotFullWidth = !await _hasFullWidth(value);
    state = state.copyWith(
      isEmailValid: isEmailForm && isNotFullWidth,
      isEmailForm: isEmailForm,
      isEmailHalfWidth: isNotFullWidth,
    );
  }

  void onChangePassword(String value) async {
    final isPasswordForm = _validatePassword(value);
    final isNotFullWidth = !await _hasFullWidth(value);
    state = state.copyWith(
      isPasswordValid: isPasswordForm && isNotFullWidth,
      isPasswordForm: isPasswordForm,
      isPasswordHalfWidth: isNotFullWidth,
    );
  }

  Widget emailValidateText(BuildContext context) {
    if (!state.isEmailSubmitted) {
      return const SizedBox.shrink();
    } else if (!state.isEmailForm) {
      return Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text(
          'eメールアドレスの形式で入力してください',
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
      );
    } else if (!state.isEmailHalfWidth) {
      return Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text(
          '半角英数で入力してください',
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget passwordValidateText(BuildContext context) {
    if (!state.isPasswordSubmitted) {
      return const SizedBox.shrink();
    } else if (!state.isPasswordForm) {
      return Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text(
          '6文字以上20文字以下入力してください',
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
      );
    } else if (!state.isPasswordHalfWidth) {
      return Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text(
          '半角英数で入力してください',
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  bool _validatePassword(String text) {
    final isGreaterThan6 = text.length > 5;
    final isLessThan20 = text.length < 21;
    return isGreaterThan6 && isLessThan20;
  }

  Future<bool> _hasFullWidth(String text) async {
    int stringCount = 0;
    await Future.forEach(text.runes, (int rune) async {
      List<int> bytes = await CharsetConverter.encode(
        'cp932',
        String.fromCharCode(rune),
      );
      stringCount += bytes.length;
    });
    return stringCount != text.length;
  }
}
