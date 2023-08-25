import 'dart:ui' as ui;
import 'package:specialico/index.dart';

abstract class MarkerBitmapUtil {
  static Future<BitmapDescriptor> getMarkerBitmap(
    int sizeBase, {
    bool isLiked = false,
    String? text,
    String? name,
    ui.Image? favImage,
  }) async {
    debugPrint(name);
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()..color = const Color(0xFFBA1A04);
    final Paint paint2 = Paint()..color = Colors.white;

    int size = sizeBase;
    if (text != null) {
      double ratio = int.parse(text) / 300;
      if (ratio > 1.0) ratio = 1.0;
      size = size + (40 * ratio).toInt();
    }

    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.2, paint2);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.8, paint1);

    // favアイコンの描画
    if (isLiked) {
      if (favImage == null) {
        final ByteData assetImageByteData =
            await rootBundle.load('assets/images/fav.png');
        favImage =
            await decodeImageFromList(assetImageByteData.buffer.asUint8List());
      }
      final paint = Paint()..filterQuality = FilterQuality.high;
      const src = Rect.fromLTWH(0, 0, 200, 200);
      const dst = Rect.fromLTWH(0, 0, 40, 40);
      canvas.drawImageRect(favImage, src, dst, paint);
    }

    if (text != null) {
      TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
      painter.text = TextSpan(
        text: text,
        style: TextStyle(
          fontSize: size / 3,
          color: Colors.white,
          fontWeight: FontWeight.normal,
        ),
      );
      painter.layout();
      painter.paint(
        canvas,
        Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
      );
    }

    ui.Image img;

    if (name != null) {
      String nameText = name;
      if (name.length > 20) nameText = '${name.substring(0, 20)}...';

      TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
      painter.text = TextSpan(
        text: nameText,
        style: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Color(0xFFBA1A04),
          shadows: [
            Shadow(
              color: Colors.white,
              offset: Offset(0, 4),
              blurRadius: 2.0,
            ),
            Shadow(
              color: Colors.white,
              offset: Offset(0, -4),
              blurRadius: 2.0,
            ),
            Shadow(
              color: Colors.white,
              offset: Offset(4, 0),
              blurRadius: 2.0,
            ),
            Shadow(
              color: Colors.white,
              offset: Offset(-4, 0),
              blurRadius: 2.0,
            ),
          ],
        ),
      );
      painter.layout();
      painter.paint(
        canvas,
        Offset(72, size / 2 - painter.height / 2),
      );
      img = await pictureRecorder
          .endRecording()
          .toImage(painter.width.toInt() + 72, size);
    } else {
      img = await pictureRecorder.endRecording().toImage(size, size);
    }

    final data =
        await img.toByteData(format: ui.ImageByteFormat.png) as ByteData;

    return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
  }
}
