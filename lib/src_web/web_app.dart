import 'package:flutter/material.dart';
import 'package:specialico/src/theme/color_schemes.g.dart';
import 'package:specialico/src/features/terms/presentation/privacy_policy_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class WebApp extends StatelessWidget {
  const WebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      title: 'Specialico',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/privacy_policy': (context) => const PrivacyPolicy(),
        '/support': (context) => const SupportPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: LayoutBuilder(builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64),
              child: Column(
                children: [
                  SizedBox(height: constraints.maxWidth >= 500 ? 200 : 100),
                  ConstrainedBox(
                    constraints: constraints,
                    child: Image.asset(
                      'assets/images/splash_image.png',
                      width: constraints.maxWidth < 512
                          ? constraints.maxWidth
                          : 512,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Image.asset(
                    'assets/images/splash_branding.png',
                    width:
                        constraints.maxWidth < 512 ? constraints.maxWidth : 512,
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            const PrivacyPolicy(),
                        settings: const RouteSettings(name: '/privacy_policy'),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ),
                    ),
                    child: const Text('プライバシーポリシー'),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                      onPressed: () => Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  const SupportPage(),
                              settings: const RouteSettings(name: '/support'),
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          ),
                      child: const Text('お問い合わせ')),
                  const SizedBox(height: 40),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: PrivacyPolicyScreen()),
    );
  }
}

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  late TextEditingController emailController;
  late TextEditingController contentController;
  bool _isSubmitAvailable = false;
  bool _isLoading = false;

  @override
  void initState() {
    emailController = TextEditingController();
    contentController = TextEditingController();
    super.initState();
  }

  void _checkUpdate() {
    // check email
    bool isEmailValid = true;
    if (emailController.text.isNotEmpty) {
      final emailText = emailController.text.trim();
      isEmailValid = (emailText.split('@')
                ..removeWhere((element) => element == ''))
              .length ==
          2;
    }

    // check content
    bool isContentValid = true;
    if (contentController.text.isEmpty) {
      setState(() {
        _isSubmitAvailable = false;
      });
      return;
    } else {
      final contentText = contentController.text.trim();
      isContentValid = contentText.isNotEmpty;
    }

    setState(() {
      _isSubmitAvailable = isEmailValid && isContentValid;
    });
  }

  Future<void> _submit(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    final String supportChannelId = dotenv.env['SUPPORT_CHANNEL_ID'] as String;
    final String oauthToken = dotenv.env['SLACK_OAUTH_TOKEN'] as String;
    final url = Uri.parse('https://slack.com/api/chat.postMessage');

    final text =
        'emailアドレス: ${emailController.text}\n内容: ${contentController.text}';

    final req = http.MultipartRequest('POST', url)
      ..fields['channel'] = supportChannelId
      ..fields['text'] = text
      ..fields['token'] = oauthToken;

    final stream = await req.send();
    final res = await http.Response.fromStream(stream);
    final status = res.statusCode;
    if (status != 200) throw Exception('http.send error: statusCode= $status');
    emailController.clear();
    contentController.clear();
    setState(() {
      _isLoading = false;
    });
    if (context.mounted) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              status == 200 ? '完了' : 'エラー',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            content:
                Text(status == 200 ? 'お問い合わせが完了しました。' : '時間をおいてもう一度お試しください。'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Specialico サポートページ'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 64),
                  const Text(
                    'メールアドレス（返信が必要な場合はご記入ください）',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 64),
                    child: TextField(
                      controller: emailController,
                      onChanged: (value) => _checkUpdate(),
                      decoration: const InputDecoration(
                        hintText: 'example@example.com',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'お問い合わせ内容',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 64),
                    child: TextField(
                      controller: contentController,
                      onChanged: (value) => _checkUpdate(),
                      minLines: 4,
                      maxLines: 4,
                      decoration: const InputDecoration(
                        hintText: 'サービスに関するお問い合わせ内容',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 64),
                    child: Text(
                      '※Specialicoで作成したアカウントを削除したい場合は、アプリ内の設定＞アカウント情報より確認できるユーザーIDをご記入ください。ユーザーIDのご確認がいただけない場合は、登録時のメールアドレスをご記入ください。アカウントのユーザーデータ、プロフィール画像はデータベースで確認され次第、即座に削除されます。なお、お店に紐づいたいいねの情報は保持されますのでご了承ください。（いいねのカウントに用いられますが、ユーザーのデータが再度表示されることはありません。）',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed:
                        _isSubmitAvailable ? () => _submit(context) : null,
                    child: const Text('送信する'),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.black12,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
