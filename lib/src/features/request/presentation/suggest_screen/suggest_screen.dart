import 'package:specialico/index.dart';

class SuggestScreen extends ConsumerStatefulWidget {
  const SuggestScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SuggestScreenState();
}

class _SuggestScreenState extends ConsumerState<SuggestScreen> {
  late TextEditingController shopNameController;
  late TextEditingController mapUrlController;
  late FocusNode focusNode;

  @override
  void initState() {
    shopNameController = TextEditingController();
    mapUrlController = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(
      suggestScreenControllerProvider(shopNameController, mapUrlController),
    );
    final controller = ref.read(
      suggestScreenControllerProvider(shopNameController, mapUrlController)
          .notifier,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('お店を提案する'),
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
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .outline
                              .withOpacity(0.04),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '・ウェブサイトや各種SNSアカウントなどにより、スペシャルティコーヒーの提供が確認できた場合Specialicoに掲載されます',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                  ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              '・大規模なチェーン店は掲載されない場合があります',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '店名',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: shopNameController,
                        onChanged: (value) =>
                            controller.onChangeShopName(value),
                        onSubmitted: (_) => controller.onSubmitShopName(),
                        cursorColor: Colors.blue,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(),
                          hintText: '店名を入力してください',
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          suffixIcon: const Icon(Icons.check),
                          suffixIconColor:
                              state.isShopNameValid ? Colors.blue : null,
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                      controller.shopNameValidateText(context),
                      const SizedBox(height: 48),
                      Row(
                        children: [
                          Text(
                            'お店のGoogleマップURL',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          TextButton(
                            onPressed: () => controller.paste(),
                            child: const Text('ペーストする'),
                          ),
                        ],
                      ),
                      TextField(
                        controller: mapUrlController,
                        onChanged: (value) => controller.onChangeMapUrl(value),
                        onSubmitted: (_) => controller.onSubmitMapUrl(),
                        cursorColor: Colors.blue,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(),
                          hintText: 'お店のページのURLを入力してください',
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          suffixIcon: const Icon(Icons.check),
                          suffixIconColor:
                              state.isMapUrlValid ? Colors.blue : null,
                        ),
                      ),
                      controller.mapUrlValidateText(context),
                      const SizedBox(height: 64),
                      ElevatedButton(
                        onPressed: state.isShopNameValid && state.isMapUrlValid
                            ? () => controller.submit(context)
                            : null,
                        child: const Center(
                          child: Text('上記の内容で提案する'),
                        ),
                      ),
                      const SizedBox(height: 100),
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
            )
        ],
      ),
    );
  }
}
