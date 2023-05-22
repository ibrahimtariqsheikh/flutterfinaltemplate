import 'package:final_template/app_theme.dart';
import 'package:final_template/build_routes.dart';
import 'package:final_template/firebase_options.dart';
import 'package:final_template/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase();
  setPortraitOrientation();
  runApp(const MyApp());
}

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

void setPortraitOrientation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return MultiRepositoryProvider(
    //   providers: const [
    //     // RepositoryProvider<AuthRepository>(
    //     //   create: (context) => AuthRepository(
    //     //     firebaseAuth: _firebaseAuth,
    //     //     firebaseFirestore: _firebaseFirestore,
    //     //   ),
    //     // ),
    //   ],
    // child: MultiBlocProvider(
    //   providers: const [
    //     // BlocProvider<AuthBloc>(
    //     //   create: (context) =>
    //     //       AuthBloc(authRepository: context.read<AuthRepository>()),
    //     // ),
    //   ],
    return MaterialApp(
      title: 'Final Template',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      onGenerateRoute: buildRoutes,
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
    // ),
    // );
  }
}
