import 'package:specialico/index.dart';

ElevatedButtonThemeData getElevatedButtonThemeData(
    Color color, Color foregroundColor) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 4,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: color,
      foregroundColor: foregroundColor,
      textStyle: myTextTheme.bodyMedium!.copyWith(fontFamily: 'LINESeedJP', fontSize: 13),
      splashFactory: NoSplash.splashFactory,
    ),
  );
}

OutlinedButtonThemeData getOutlinedButtonThemeData(
  ColorScheme colorScheme,
  Color sideColor,
) {
  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      surfaceTintColor: Colors.transparent,
      foregroundColor: colorScheme.outline,
      side: BorderSide(color: sideColor, width: 1.0),
      splashFactory: NoSplash.splashFactory,
    ),
  );
}
