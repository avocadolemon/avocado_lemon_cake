import 'package:avocado_lemon_cake/auth/splash.dart';
import 'package:flutter/material.dart';
import '../auth/forgot_pass.dart';
import '../auth/login.dart';
import '../auth/register.dart';
import '../screens/home_page.dart';

class AppRoutes {
  Map<String, Widget Function(BuildContext context)> routes =
      <String, WidgetBuilder>{
    '/login': (context) => const LoginScreen(),
    '/register': (context) => const RegisterScreen(),
    '/homepage': (context) => const HomePage(),
    '/forget-pass': (context) => const ForgetPassword(),
    '/splash-screen': (context) => const SplashScreen(),
  };
}
