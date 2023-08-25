import 'package:specialico/index.dart';

abstract class ImageCompressor {
  static Future<Uint8List> compressImageFile(Uint8List imageFile) async {
    return FlutterImageCompress.compressWithList(
      imageFile,
      minHeight: 512,
      minWidth: 512,
      quality: 96,
    );
  }
}