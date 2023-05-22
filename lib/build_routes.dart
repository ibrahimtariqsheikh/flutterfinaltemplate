import 'package:final_template/pages/home_page.dart';
import 'package:final_template/pages/signin_page.dart';
import 'package:final_template/pages/signup_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> buildRoutes(RouteSettings settings) {
  WidgetBuilder builder;
  switch (settings.name) {
    case SignUpPage.routeName:
      builder = (BuildContext _) => const SignUpPage();
      break;
    case SignInPage.routeName:
      builder = (BuildContext _) => const SignInPage();
      break;
    case HomePage.routeName:
      builder = (BuildContext _) => const HomePage();
      break;
    default:
      throw Exception('Invalid route: ${settings.name}');
  }
  return MaterialPageRoute(builder: builder, settings: settings);
}
