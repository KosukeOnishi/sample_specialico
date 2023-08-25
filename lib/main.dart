import 'package:flutter/foundation.dart';
import 'package:specialico/src_web/web_app.dart';

import 'index.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:stack_trace/stack_trace.dart' as stack_trace;

const flavor = String.fromEnvironment('FLAVOR');

Future<void> main() async {
  if (kIsWeb) {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: "env");
    runApp(const WebApp());
  } else {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    await dotenv.load(fileName: "env");

    await MobileAds.instance.initialize();

    await Firebase.initializeApp();

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };

    // FirebaseUser を取得する
    final firebaseUser = await auth.FirebaseAuth.instance.userChanges().first;
    debugPrint('uid = ${firebaseUser?.uid}');

    await AnalyticsClient().init(firebaseUser?.uid, firebaseUser?.isAnonymous ?? false);

    FlutterNativeSplash.remove();

    runApp(
      ProviderScope(
        child: App(firebaseUser: firebaseUser),
      ),
    );

    FlutterError.demangleStackTrace = (StackTrace stack) {
      if (stack is stack_trace.Trace) return stack.vmTrace;
      if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
      return stack;
    };
  }
}
