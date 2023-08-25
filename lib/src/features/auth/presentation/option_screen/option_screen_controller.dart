import 'package:specialico/index.dart';

part 'option_screen_controller.g.dart';

@riverpod
class OptionScreenController extends _$OptionScreenController {
  @override
  void build() {}

  void onPressedProfileEdit(BuildContext context, bool isAnonymous) {
    if (isAnonymous) {
      AuthService.requestSignUp(context, SignUpRequestType.userProfile);
    } else {
      context.beamToNamed('/home/option/profile_edit');
    }
  }

  void onPressedSuggest(BuildContext context, bool isAnonymous) {
    if (isAnonymous) {
      AuthService.requestSignUp(context, SignUpRequestType.suggest);
    } else {
      context.beamToNamed('/home/option/suggest');
    }
  }

  void onPressedLocationSetting(BuildContext context) {
    final isPositionEnabled =
        ref.read(currentPositionRepositoryProvider) != null;
    String text;
    if (isPositionEnabled) {
      text = '現在位置情報はONになっています。設定を変更後アプリを再起動すると、適用されます。';
    } else {
      text = '現在位置情報はOFFになっています。設定を変更後アプリを再起動すると、適用されます。';
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        surfaceTintColor: Theme.of(context).colorScheme.background,
        title: const Text(
          '位置情報の設定を変更',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(text),
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
              MapService.requestLocationDialog();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void onPressedSignOut(BuildContext context, bool isAnonymous) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        surfaceTintColor: Theme.of(context).colorScheme.background,
        title: Text(
          isAnonymous ? '認証画面へ' : 'ログアウト',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(
          isAnonymous ? '認証画面へ戻りますか？' :
          '"${ref.read(userRepositoryProvider)!.name}"のアカウントからログアウトしますか？',
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
              ref.invalidate(likedShopIdsRepositoryProvider);
              ref.invalidate(userRepositoryProvider);
              if (context.mounted) App.restart(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
