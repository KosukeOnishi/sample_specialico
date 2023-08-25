import 'package:flutter/gestures.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:specialico/index.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(authScreenControllerProvider.notifier);
    final state = ref.watch(authScreenControllerProvider);

    debugPrint(MediaQuery.of(context).size.height.toString());

    return Scaffold(
      body: Stack(
        children: [
          SizedBox.fromSize(
            size: Size.infinite,
            child: Column(
              children: [
                Expanded(
                  child: ClipPath(
                    clipper: WaveClipperOne(),
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0XFFBA1A04),
                            Color(0XFFBA0404),
                            Color(0XFFFF4D1B),
                            Color(0XFFE8782B),
                          ],
                          stops: [0, 0.2, 0.8, 1.0],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(48),
                        child: Image.asset(
                          'assets/images/logo_white.png',
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 32),
                    _buildButton(
                      context,
                      text: 'メールアドレスで新規登録',
                      onPressed: () =>
                          context.beamToNamed('/auth/email?type=signUp'),
                      icon: const Icon(
                        Icons.mail,
                        color: Color(0xFF6F5C2E),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildButton(
                      context,
                      text: 'メールアドレスでログイン',
                      onPressed: () =>
                          context.beamToNamed('/auth/email?type=signIn'),
                      icon: const Icon(
                        Icons.mail,
                        color: Color(0xFF6F5C2E),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text('SNS認証'),
                    const SizedBox(height: 16),
                    _buildButton(
                      context,
                      text: 'Googleアカウントで認証',
                      onPressed: () => controller.onPressedGoogle(context),
                      icon: Image.asset('assets/images/google_light.png'),
                    ),
                    const SizedBox(height: 16),
                    _buildButton(
                      context,
                      text: 'Appleアカウントで認証',
                      onPressed: () => controller.onPressedApple(context),
                      icon: const Icon(
                        FontAwesomeIcons.apple,
                        color: Color(0xFF201A19),
                      ),
                    ),
                    const SizedBox(height: 16),
                    OutlinedButton(
                      onPressed: () => controller.onPressedAnonymous(context),
                      child: const Text('登録せずに始める'),
                    ),
                    const SizedBox(height: 104),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '認証することで、',
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.onBackground),
                        ),
                        TextSpan(
                          text: '利用規約',
                          style: const TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              AnalyticsClient()
                                  .logEvent(LogEvent.authTermsOfService, {});
                              showMaterialModalBottomSheet(
                                context: context,
                                builder: (context) => const TermsOfServiceScreen(),
                              );
                            },
                        ),
                        TextSpan(
                          text: 'と',
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.onBackground),
                        ),
                        TextSpan(
                          text: 'プライバシーポリシー',
                          style: const TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              AnalyticsClient()
                                  .logEvent(LogEvent.authPrivacyPolicy, {});
                              showMaterialModalBottomSheet(
                                context: context,
                                builder: (context) => const PrivacyPolicyScreen(),
                              );
                            },
                        ),
                        TextSpan(
                          text: 'に同意したものとみなします',
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.onBackground),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (state.isLoading)
            Container(
              color: Colors.black45,
              alignment: Alignment.center,
              child: const CircularProgressIndicator(color: Colors.blue),
            )
        ],
      ),
    );
  }

  _buildButton(
    BuildContext context, {
    required String text,
    required void Function() onPressed,
    required Widget icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: OutlinedButton(
        onPressed: onPressed,
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.white),
        ),
        child: SizedBox(
          height: 48,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                width: 48,
                height: double.infinity,
                alignment: Alignment.center,
                child: icon,
              ),
              const SizedBox(width: 24),
              Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF201A19),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
