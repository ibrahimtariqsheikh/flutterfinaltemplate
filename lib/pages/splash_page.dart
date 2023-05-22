import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  static const String routeName = '/';
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Page 2.0'),
      ),
    );
    // return BlocConsumer<AuthBloc, AuthState>(
    // listener: (context, state) async {
    //   if (state.authStatus == AuthStatus.unauthenticated) {
    //     final currentRoute = ModalRoute.of(context)?.settings.name;
    //     await Future.delayed(const Duration(seconds: 3));
    //     // ignore: use_build_context_synchronously
    //     Navigator.restorablePushNamedAndRemoveUntil(
    //         context, AuthLanding.routeName, (route) {
    //       return route.settings.name == currentRoute ? true : false;
    //     });
    //   } else if (state.authStatus == AuthStatus.authenticated) {
    //     Navigator.pushReplacementNamed(context, TabBarPage.routeName);
    //   }
    // },
    // builder: (context, state) {
    //   return const Scaffold(
    //     body: Center(
    //       child: Text('Splash Page'),
    //     ),
    //   );
    // },
    // );
  }
}
