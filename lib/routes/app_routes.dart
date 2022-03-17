import 'package:avocado_lemon_cake/screens/onboarding/index.dart';
import 'package:flutter/material.dart';
import '../auth/check_mail.dart';
import '../auth/create_new_pass.dart';
import '../auth/forgot_pass.dart';
import '../auth/login.dart';
import '../auth/pass_reset_success.dart';
import '../auth/register.dart';
import '../screens/add/add_city.dart';
import '../screens/add/add_community.dart';
import '../screens/community/community_screen.dart';
import '../screens/home_page.dart';
import '../screens/splash/splash.dart';

class AppRoutes {
  Map<String, Widget Function(BuildContext context)> routes =
      <String, WidgetBuilder>{
    '/login': (context) => const LoginScreen(),
    '/register': (context) => const RegisterScreen(),
    '/homepage': (context) => const HomePage(),
    '/forget-pass': (context) => const ForgetPassword(),
    '/check-mail': (context) => const CheckMail(),
    '/create-pass': (context) => const CreateNewPassword(),
    '/pass-success': (context) => const PasswordResetSuccess(),
    '/splash': (context) => const SplashScreen(),
    '/onboarding': (context) => const OnBoardingScreen(),
    '/add-city': (context) => const AddCity(),
    '/community-screen': (context) => const CommunityScreen(),
    '/add-community': (context) => const AddCommunity(),
  };
}
