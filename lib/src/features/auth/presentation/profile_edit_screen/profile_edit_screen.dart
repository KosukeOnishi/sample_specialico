import 'package:specialico/index.dart';

class ProfileEditScreen extends ConsumerStatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProfileEditScreenState();
}

class _ProfileEditScreenState extends ConsumerState<ProfileEditScreen> {
  late TextEditingController nameController;
  late FocusNode focusNode;

  @override
  void initState() {
    final user = ref.read(userRepositoryProvider);
    nameController = TextEditingController(text: user!.name);
    focusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state =
        ref.watch(profileEditScreenControllerProvider(nameController));
    final controller =
        ref.read(profileEditScreenControllerProvider(nameController).notifier);

    return MyWillPopScope(
      isFromAuth: (context.currentBeamLocation.state.routeInformation.location
              ?.contains('auth')) ??
          false,
      child: Scaffold(
        appBar: AppBar(
          leading: (context.currentBeamLocation.state.routeInformation.location
                      ?.contains('auth') ??
                  false)
              ? const SizedBox()
              : null,
          title: const Text('プロフィールを編集'),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Focus(
                focusNode: focusNode,
                child: GestureDetector(
                  onTap: () => focusNode.requestFocus(),
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        Container(
                          width: double.infinity,
                          height: 160,
                          alignment: Alignment.center,
                          child: Stack(
                            children: [
                              CircleAvatar(
                                foregroundImage: state.imageFile != null
                                    ? MemoryImage(state.imageFile!)
                                    : state.user.profileImageUrl != null
                                        ? NetworkImage(
                                            state.user.profileImageUrl!)
                                        : Image.asset(
                                                'assets/images/profile_default.png')
                                            .image,
                                backgroundColor: Colors.grey.withOpacity(0.1),
                                radius: 80,
                              ),
                              Positioned.fill(
                                child: Material(
                                  color: Colors.transparent,
                                  shape: const CircleBorder(),
                                  clipBehavior: Clip.hardEdge,
                                  child: InkWell(
                                    onTap: () => ref
                                        .read(
                                            profileEditScreenControllerProvider(
                                                    nameController)
                                                .notifier)
                                        .pickImage(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => controller.onTapBean(0),
                              behavior: HitTestBehavior.opaque,
                              child: Transform.scale(
                                scale: 1,
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  width: 64,
                                  child: Image.asset(
                                      'assets/images/beans_light.png'),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => controller.onTapBean(1),
                              behavior: HitTestBehavior.opaque,
                              child: Transform.scale(
                                scale: 1,
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  width: 64,
                                  child: Image.asset(
                                      'assets/images/beans_medium.png'),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => controller.onTapBean(2),
                              behavior: HitTestBehavior.opaque,
                              child: Transform.scale(
                                scale: 1,
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  width: 64,
                                  child: Image.asset(
                                      'assets/images/beans_dark.png'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        if (state.currentFlavor != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'フレーバー：${state.currentFlavor!.japaneseText}'),
                              Text(
                                state.currentFlavor!.detailCategories
                                    .join(', '),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              'ニックネーム',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            TextButton(
                                onPressed: () => controller.onTapGenerateName(),
                                child: const Text(
                                  'おまかせ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                        TextField(
                          controller: nameController,
                          cursorColor: Colors.blue,
                          onChanged: (value) => ref
                              .read(profileEditScreenControllerProvider(
                                      nameController)
                                  .notifier)
                              .onChangedName(value),
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            hintText: 'ニックネームを入力してください',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 16),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            suffixIcon: const Icon(Icons.check),
                            suffixIconColor:
                                state.isNameValid ? Colors.blue : null,
                          ),
                        ),
                        if (!state.isNameValid)
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text(
                              '20字以下で入力してください',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.error),
                            ),
                          ),
                        const SizedBox(height: 40),
                        Center(
                          child: ElevatedButton(
                            onPressed: state.isChanged && state.isNameValid ||
                                    (context.currentBeamLocation.state
                                            .routeInformation.location
                                            ?.contains('auth') ??
                                        false)
                                ? () => ref
                                    .read(profileEditScreenControllerProvider(
                                            nameController)
                                        .notifier)
                                    .saveChanges(context)
                                : null,
                            child: const Text('保存する'),
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
                color: Colors.black26,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(color: Colors.blue),
              ),
          ],
        ),
      ),
    );
  }
}

class MyWillPopScope extends StatelessWidget {
  const MyWillPopScope({
    required this.child,
    required this.isFromAuth,
    super.key,
  });

  final Widget child;
  final bool isFromAuth;

  @override
  Widget build(BuildContext context) {
    if (isFromAuth) {
      return WillPopScope(
        onWillPop: () async => false,
        child: child,
      );
    } else {
      return child;
    }
  }
}
