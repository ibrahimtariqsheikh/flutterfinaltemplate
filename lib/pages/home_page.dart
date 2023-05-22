import 'package:final_template/pages/crud_test.dart';
import 'package:final_template/widgets/my_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Home Page\nUSER CREATED'),
                MyButton(
                  buttonText: 'Test Crud',
                  buttonColor: Colors.blue,
                  buttonWidth: size.width * .8,
                  buttonHeight: 60,
                  isSubmitting: false,
                  isOutlined: false,
                  buttonAction: () {
                    Navigator.pushNamed(context, CrudTest.routeName);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
