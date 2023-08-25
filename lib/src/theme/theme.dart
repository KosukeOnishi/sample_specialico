import 'package:specialico/index.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  textTheme: myTextTheme,
  fontFamily: 'LINESeedJP',
  splashColor: Colors.transparent,
  elevatedButtonTheme: getElevatedButtonThemeData(
    lightColorScheme.tertiaryContainer.withOpacity(0.2),
    Colors.black.withOpacity(0.75),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: lightColorScheme.onSurface,
    unselectedItemColor: lightColorScheme.onSurface.withOpacity(0.33),
  ),
  appBarTheme: const AppBarTheme(
    surfaceTintColor: Colors.transparent,
  ),
  outlinedButtonTheme: getOutlinedButtonThemeData(
    lightColorScheme,
    lightColorScheme.outline.withOpacity(0.5),
  ),
);

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: darkColorScheme,
  textTheme: myTextTheme,
  fontFamily: 'LINESeedJP',
  splashColor: Colors.transparent,
  elevatedButtonTheme: getElevatedButtonThemeData(
    darkColorScheme.tertiaryContainer.withOpacity(0.2),
    Colors.white70,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: darkColorScheme.onSurface,
    unselectedItemColor: darkColorScheme.onSurface.withOpacity(0.33),
  ),
  appBarTheme: const AppBarTheme(
    surfaceTintColor: Colors.transparent,
  ),
  outlinedButtonTheme: getOutlinedButtonThemeData(
    darkColorScheme,
    darkColorScheme.outline.withOpacity(0.5),
  ),
);
