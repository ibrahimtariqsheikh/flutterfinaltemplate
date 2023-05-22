import 'package:final_template/blocs/auth/auth_bloc.dart';
import 'package:final_template/pages/c_qualifications.dart';
import 'package:final_template/pages/r_qualifications.dart';
import 'package:final_template/pages/signin_page.dart';
import 'package:final_template/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.authStatus == AuthStatus.unauthenticated) {
          Navigator.pushNamedAndRemoveUntil(
              context, SignInPage.routeName, (route) => false);
        }
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: SafeArea(
            child: SizedBox(
              width: size.width,
              child: Column(
                children: [
                  const Spacer(),
                  const Text('Home Page (Welcome)'),
                  const SizedBox(
                    height: 20,
                  ),
                  MyButton(
                    buttonText: 'Create Qualifications',
                    buttonColor: Colors.blue,
                    buttonWidth: size.width * .8,
                    buttonHeight: 60,
                    isSubmitting: false,
                    isOutlined: false,
                    buttonAction: () {
                      Navigator.pushNamed(
                          context, CreateQualificationsPage.routeName);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyButton(
                    buttonText: 'Read Qualifications',
                    buttonColor: Colors.blue,
                    buttonWidth: size.width * .8,
                    buttonHeight: 60,
                    isSubmitting: false,
                    isOutlined: false,
                    buttonAction: () {
                      Navigator.pushNamed(
                          context, ReadQualificationsPage.routeName);
                    },
                  ),
                  const Spacer(),
                  MyButton(
                    buttonText: 'Sign Out',
                    buttonColor: Colors.red,
                    buttonWidth: size.width * .8,
                    buttonHeight: 60,
                    isSubmitting: false,
                    isOutlined: false,
                    buttonAction: () {
                      context.read<AuthBloc>().add(SignOutRequestedEvent());
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
