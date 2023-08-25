import 'package:specialico/index.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:specialico/src/routing/locations.dart';

final GlobalKey appKey = GlobalKey();

class App extends ConsumerStatefulWidget {
  const App({required this.firebaseUser, super.key});

  final auth.User? firebaseUser;

  // 認証状況が変わったときにアプリをリスタートさせる
  static Future<void> restart(BuildContext context) async {
    final firebaseUser = await auth.FirebaseAuth.instance.userChanges().first;
    if (firebaseUser != null) {
      await AnalyticsClient()
          .reInit(firebaseUser.uid, firebaseUser.isAnonymous);
    }
    if (context.mounted) {
      context.findAncestorStateOfType<_AppState>()!.restart(firebaseUser);
    }
  }

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  late BeamerDelegate _routerDelegate;

  Key key = UniqueKey();

  @override
  void initState() {
    _routerDelegate = _getRouterDelegate(widget.firebaseUser);
    super.initState();
  }

  void restart(auth.User? firebaseUser) {
    if (firebaseUser != null) {
      AuthService.initUserRepository(
        ref.read(userRepositoryProvider.notifier),
        ref.read(likedShopIdsRepositoryProvider.notifier),
      );
    }

    setState(() {
      _routerDelegate = _getRouterDelegate(firebaseUser);
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: MaterialApp.router(
        key: appKey,
        title: 'Specialico',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        routerDelegate: _routerDelegate,
        routeInformationParser: BeamerParser(),
        backButtonDispatcher:
            BeamerBackButtonDispatcher(delegate: _routerDelegate),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

_getRouterDelegate(auth.User? firebaseUser) {
  final initialPath = firebaseUser?.uid == null ? '/auth' : '/home';

  return BeamerDelegate(
    initialPath: initialPath,
    routeListener: (p0, p1) {
      AnalyticsClient().setScreen(p0.location);
    },
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '*': (context, state, data) {
          if (state.uri.path.contains('auth')) {
            return Beamer(
              routerDelegate: BeamerDelegate(
                initialPath: '/auth',
                locationBuilder: (routerInformation, _) {
                  if (routerInformation.location!.contains('/auth')) {
                    return AuthLocation(routerInformation);
                  } else {
                    return NotFound(path: routerInformation.location!);
                  }
                },
              ),
            );
          } else {
            return const ScaffoldWithBottomNavBar();
          }
        },
      },
    ),
  );
}
