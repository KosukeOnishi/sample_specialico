import 'package:specialico/index.dart';

class OptionScreen extends ConsumerWidget {
  const OptionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userRepositoryProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () => ref
                  .read(optionScreenControllerProvider.notifier)
                  .onPressedProfileEdit(context, user.isAnonymous),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                width: double.infinity,
                color:
                    Theme.of(context).colorScheme.secondary.withOpacity(0.05),
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    CircleAvatar(
                      foregroundImage: user!.profileImageUrl != null
                          ? NetworkImage(user.profileImageUrl!)
                          : Image.asset('assets/images/profile_default.png')
                              .image,
                      backgroundColor: Colors.grey.withOpacity(0.1),
                      radius: 28,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.isAnonymous ? 'ゲスト' : user.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            'プロフィールを編集',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (!user.isAnonymous)
              _buildRow(
                context,
                () => context.beamToNamed('/home/option/account'),
                'アカウント情報',
              ),
            _buildRow(
              context,
              () => ref
                  .read(optionScreenControllerProvider.notifier)
                  .onPressedLocationSetting(context),
              '位置情報の設定',
            ),
            _buildRow(
              context,
              () => ref
                  .read(optionScreenControllerProvider.notifier)
                  .onPressedSuggest(context, user.isAnonymous),
              '未登録のお店を提案する',
            ),
            _buildRow(
              context,
              () => context.beamToNamed('/home/option/terms_of_service'),
              '利用規約',
            ),
            _buildRow(
              context,
              () => context.beamToNamed('/home/option/privacy_policy'),
              'プライバシーポリシー',
            ),
            _buildRow(
              context,
              () => context.beamToNamed('/home/option/credit'),
              'クレジット/ライセンス情報',
            ),
            _buildRow(
              context,
              () => ref
                  .read(optionScreenControllerProvider.notifier)
                  .onPressedSignOut(context, user.isAnonymous),
              user.isAnonymous ? '認証画面へ' : 'ログアウト',
            ),
          ],
        ),
      ),
    );
  }

  _buildRow(BuildContext context, void Function()? onTap, String text) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            const SizedBox(width: 24),
            Text(
              text,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const Expanded(child: SizedBox()),
            const Icon(Icons.arrow_forward_ios),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
