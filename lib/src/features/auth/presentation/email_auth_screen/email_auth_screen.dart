import 'package:specialico/index.dart';

class EmailAuthScreen extends ConsumerStatefulWidget {
  const EmailAuthScreen({required this.authType, super.key});

  final EmailAuthType authType;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EmailAuthScreenState();
}

class _EmailAuthScreenState extends ConsumerState<EmailAuthScreen> {
  late EmailAuthType authType;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late FocusNode focusNode;

  @override
  void initState() {
    authType = widget.authType;
    focusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(
      emailAuthScreenControllerProvider(emailController, passwordController),
    );
    final controller = ref.read(
      emailAuthScreenControllerProvider(emailController, passwordController)
          .notifier,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          authType == EmailAuthType.signIn ? 'メールアドレスでログイン' : 'メールアドレスで登録',
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Focus(
              focusNode: focusNode,
              child: GestureDetector(
                onTap: focusNode.requestFocus,
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Text('メールアドレス',
                          style: Theme.of(context).textTheme.titleSmall),
                      const SizedBox(height: 16),
                      TextField(
                        controller: emailController,
                        onChanged: (value) => controller.onChangeEmail(value),
                        onSubmitted: (_) => controller.onSubmitEmail(),
                        autofocus: true,
                        cursorColor: Colors.blue,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(),
                          hintText: 'メールアドレスを入力してください',
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          suffixIcon: const Icon(Icons.check),
                          suffixIconColor:
                              state.isEmailValid ? Colors.blue : null,
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                      controller.emailValidateText(context),
                      const SizedBox(height: 48),
                      Text('パスワード',
                          style: Theme.of(context).textTheme.titleSmall),
                      TextField(
                        controller: passwordController,
                        onChanged: (value) =>
                            controller.onChangePassword(value),
                        onSubmitted: (_) => controller.onSubmitPassword(),
                        cursorColor: Colors.blue,
                        obscureText: true,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(),
                          hintText: '半角英数、20字以内で入力してください',
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          suffixIcon: const Icon(Icons.check),
                          suffixIconColor:
                              state.isPasswordValid ? Colors.blue : null,
                        ),
                      ),
                      controller.passwordValidateText(context),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: state.isEmailValid && state.isPasswordValid
                            ? () => controller.submit(authType, context)
                            : null,
                        child: const Center(
                          child: Text('次へ'),
                        ),
                      ),
                    ],
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
            ),
        ],
      ),
    );
  }
}
