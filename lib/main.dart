import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_template/app_theme.dart';
import 'package:final_template/blocs/auth/auth_bloc.dart';
import 'package:final_template/blocs/signin/signin_cubit.dart';
import 'package:final_template/blocs/signup/signup_cubit.dart';
import 'package:final_template/build_routes.dart';
import 'package:final_template/firebase_options.dart';
import 'package:final_template/pages/splash_page.dart';
import 'package:final_template/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

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
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(
            firebaseFirestore: _firebaseFirestore,
            firebaseAuth: _firebaseAuth,
          ),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) =>
                AuthBloc(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider<SignInCubit>(
            create: (context) =>
                SignInCubit(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider<SignUpCubit>(
            create: (context) =>
                SignUpCubit(authRepository: context.read<AuthRepository>()),
          )
        ],
        child: MaterialApp(
          title: 'Final Template',
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: ThemeMode.system,
          onGenerateRoute: buildRoutes,
          debugShowCheckedModeBanner: false,
          home: const SplashPage(),
        ),
      ),
    );
    // ),
    // );
  }
}
