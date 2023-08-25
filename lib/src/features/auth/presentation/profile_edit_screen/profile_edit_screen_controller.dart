import 'dart:math';
import 'dart:ui' as ui;

import 'package:app_settings/app_settings.dart';
import 'package:specialico/index.dart';

part 'profile_edit_screen_controller.g.dart';
part 'profile_edit_screen_controller.freezed.dart';

@freezed
class ProfileEditScreenState with _$ProfileEditScreenState {
  const factory ProfileEditScreenState({
    required User user,
    @Default(true) bool isNameValid,
    @Default(false) bool isLoading,
    @Default(false) bool isChanged,
    FlavorWheel? currentFlavor,
    Uint8List? imageFile,
  }) = _EmailAuthScreenState;
}

@riverpod
class ProfileEditScreenController extends _$ProfileEditScreenController {
  // ignore: annotate_overrides, overridden_fields
  late TextEditingController nameController;

  @override
  ProfileEditScreenState build(
    TextEditingController nameController,
  ) {
    debugPrint('ProfileEditScreenController build');
    nameController = nameController;
    final user = ref.read(userRepositoryProvider);
    return ProfileEditScreenState(user: user!);
  }

  Future<void> pickImage(BuildContext context) async {
    final picker = ImagePicker();
    XFile? imageFile;
    try {
      imageFile = await picker.pickImage(source: ImageSource.gallery);
    } catch (e) {
      if (e.toString().contains('photo_access_denied')) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            surfaceTintColor: Theme.of(context).colorScheme.background,
            title: const Text(
              '設定により拒否されました',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: const Text('写真を変更するには、設定から写真へのアクセスを許可する必要があります。'),
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
                  AppSettings.openAppSettings();
                },
                child: const Text('設定画面へ'),
              ),
            ],
          ),
        );
      }
    }
    if (imageFile == null) return;
    final imageUnit8List = await imageFile.readAsBytes();
    state = state.copyWith(imageFile: imageUnit8List, isChanged: true);
  }

  void onChangedName(String text) {
    bool isValid = text.isNotEmpty && text.length < 21;
    bool isChanged = text != state.user.name || state.imageFile != null;
    state = state.copyWith(isNameValid: isValid, isChanged: isChanged);
  }

  Future<void> saveChanges(BuildContext context) async {
    debugPrint(context.currentBeamLocation.state.routeInformation.location);
    state = state.copyWith(isLoading: true);
    await AuthService.updateProfile(
      ref.read(userRepositoryProvider.notifier),
      nameController.text,
      state.user.userId,
      state.imageFile,
    );
    state = state.copyWith(isLoading: false, isChanged: false);
    if (context.mounted) {
      if (context.currentBeamLocation.state.routeInformation.location
              ?.contains('auth') ??
          false) {
        AnalyticsClient()
            .logEvent(LogEvent.profileSet, {'name': nameController.text});
        context.beamToNamed('/auth/onboarding');
      } else {
        AnalyticsClient()
            .logEvent(LogEvent.profileEdit, {'name': nameController.text});
      }
    }
  }

  void onTapBean(int index) async {
    HapticFeedback.mediumImpact();
    final pathList = [
      'assets/images/beans_light.png',
      'assets/images/beans_medium.png',
      'assets/images/beans_dark.png'
    ];
    final beanImagePath = pathList[index];
    final flavor =
        FlavorWheel.values[Random().nextInt(FlavorWheel.values.length)];

    final imageData = await _createImage(beanImagePath, flavor);
    state = state.copyWith(
        imageFile: imageData, isChanged: true, currentFlavor: flavor);
    AnalyticsClient().logEvent(LogEvent.pressedProfileBean, {
      'roast_level': index == 0
          ? 'light'
          : index == 1
              ? 'medium'
              : 'dark'
    });
  }

  void onTapGenerateName() {
    HapticFeedback.mediumImpact();
    final beanType = BeanType.values[Random().nextInt(BeanType.values.length)];
    nameController.text = beanType.text;
    onChangedName(beanType.text);
    AnalyticsClient()
        .logEvent(LogEvent.pressedGenerateName, {'name': beanType.text});
  }

  Future<Uint8List> _createImage(String path, FlavorWheel flavor) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()..color = flavor.color;

    int size = 500;

    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.toDouble(), size.toDouble()), paint1);

    // 豆画像の描画
    final ByteData imageByteData = await rootBundle.load(path);
    final decodedData =
        await decodeImageFromList(imageByteData.buffer.asUint8List());
    final paint = Paint()..filterQuality = FilterQuality.high;
    const src = Rect.fromLTWH(0, 0, 567, 567);
    const dst = Rect.fromLTWH(45, 40, 420, 420);
    canvas.drawImageRect(decodedData, src, dst, paint);

    ui.Image img;

    img = await pictureRecorder.endRecording().toImage(size, size);
    final data =
        await img.toByteData(format: ui.ImageByteFormat.png) as ByteData;

    return data.buffer.asUint8List();
  }
}
