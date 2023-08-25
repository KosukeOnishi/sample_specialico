import 'dart:ui';

import 'package:specialico/index.dart';

class DisMissPageButton extends StatelessWidget {
  const DisMissPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (context.canBeamBack) {
          context.beamBack();
        } else {
          Navigator.of(context).pop();
        }
      },
      child: SizedBox(
        width: 32,
        height: 32,
        child: Stack(
          children: [
            ClipOval(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.white24, Colors.black26],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: Colors.white30,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: const Icon(
                Icons.keyboard_arrow_down_outlined,
                size: 24,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
