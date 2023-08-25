import 'package:specialico/index.dart';

class SuggestNewShopButton extends ConsumerWidget {
  const SuggestNewShopButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        if (ref.read(userRepositoryProvider)!.isAnonymous) {
          AuthService.requestSignUp(context, SignUpRequestType.suggest);
        } else {
          context.beamToNamed('/home/suggest');
        }
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(Icons.lightbulb),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                'Specialicoに掲載されていない、おすすめのコーヒーショップを提案する',
                style: TextStyle(fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
