import 'package:avocado_lemon_cake/screens/onboarding/index.dart';
import 'package:flutter/material.dart';
import '../auth/check_mail.dart';
import '../auth/create_new_pass.dart';
import '../auth/forgot_pass.dart';
import '../auth/login.dart';
import '../auth/pass_reset_success.dart';
import '../auth/register.dart';
<<<<<<< HEAD
import '../screens/community/community_screen.dart';
=======
import '../screens/add/add_city.dart';
import '../screens/add/add_community.dart';
>>>>>>> 171cea8653cd6cf689c559cf8a64af5b576e48b3
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
<<<<<<< HEAD
    '/community-screen': (context) => const CommunityScreen(),
=======
    '/splash': (context) => const SplashScreen(),
    '/onboarding': (context) => const OnBoardingScreen(),
    '/add-city': (context) => const AddCity(),
    '/add-community': (context) => const AddCommunity(),
>>>>>>> 171cea8653cd6cf689c559cf8a64af5b576e48b3
  };
}
