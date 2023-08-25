import 'package:firebase_auth/firebase_auth.dart';
import 'package:specialico/index.dart';

class AccountDetailScreen extends ConsumerWidget {
  const AccountDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('アカウント情報'),
      ),
      body: FutureBuilder(
        future: FirebaseAuth.instance.userChanges().first,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final firebaseUser = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const Text('ユーザーID', style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 8.0),
                  Text(user?.userId ?? '',
                      style: const TextStyle(fontWeight: FontWeight.normal)),
                  const SizedBox(height: 16),
                  const Text('メールアドレス', style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 8.0),
                  Text(firebaseUser.email ?? '',
                      style: const TextStyle(fontWeight: FontWeight.normal)),
                  const SizedBox(height: 16),
                  const Text('登録日', style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 8.0),
                  Text(firebaseUser.metadata.creationTime.toString(),
                      style: const TextStyle(fontWeight: FontWeight.normal)),
                  const SizedBox(height: 32),
                  Center(
                    child: OutlinedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            surfaceTintColor:
                                Theme.of(context).colorScheme.background,
                            title: const Text(
                              '退会',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            content: Text(
                                '"${firebaseUser.uid}"のアカウントを削除して退会しますか？'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text(
                                  'キャンセル',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
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
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      surfaceTintColor: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      title: const Text(
                                        '確認してください',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      content:
                                          const Text('この操作は取り消せません。OKを押すことで退会します。'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                          child: Text(
                                            'キャンセル',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
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
                                            // delete_users_v1にdocumentを追加
                                            await AuthService.deleteUser(
                                              ref.read(userRepositoryProvider
                                                  .notifier),
                                              ref
                                                  .read(userRepositoryProvider)!
                                                  .userId,
                                            );
                                            // signOut
                                            await FirebaseAuth.instance
                                                .signOut();
                                            ref.invalidate(
                                                likedShopIdsRepositoryProvider);
                                            ref.invalidate(
                                                userRepositoryProvider);
                                            if (context.mounted) App.restart(context);
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Text('アカウントを削除する'),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
