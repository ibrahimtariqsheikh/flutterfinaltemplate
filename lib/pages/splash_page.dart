import 'package:final_template/blocs/auth/auth_bloc.dart';
import 'package:final_template/pages/home_page.dart';
import 'package:final_template/pages/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  static const String routeName = '/';
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(title: const Text('SPLASH')),
    //   body: const Center(
    //     child: Text('Final Template Splash Page'),
    //   ),
    // );
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state.authStatus == AuthStatus.unauthenticated) {
          final currentRoute = ModalRoute.of(context)?.settings.name;
          // await Future.delayed(const Duration(seconds: 3));

          // ignore: use_build_context_synchronously
          Navigator.restorablePushNamedAndRemoveUntil(
              context, SignInPage.routeName, (route) {
            return route.settings.name == currentRoute ? true : false;
          });
        } else if (state.authStatus == AuthStatus.authenticated) {
          Navigator.pushReplacementNamed(context, HomePage.routeName);
        }
      },
      builder: (context, state) {
        return const Scaffold(
          body: Center(
            child: Text('Splash Page'),
          ),
        );
      },
    );
  }
}
