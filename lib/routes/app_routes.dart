import 'package:avocado_lemon_cake/Screens/group/about_group/about_group.dart';
import 'package:avocado_lemon_cake/Screens/group/about_group/components/profiles_avater.dart';
import 'package:avocado_lemon_cake/Screens/home/edit_group.dart';
import 'package:avocado_lemon_cake/Screens/profile_management/profile_management.dart';
import 'package:avocado_lemon_cake/auth/onboarding/index.dart';
import 'package:avocado_lemon_cake/screens/group/group_conversation.dart';
import 'package:avocado_lemon_cake/screens/home/add_group.dart';
import 'package:avocado_lemon_cake/screens/home/groups_screen.dart';
import 'package:avocado_lemon_cake/screens/home/home_tab.dart';
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
import '../screens/profile-management/add_image_screen.dart';
import '../screens/profile-management/community_survery.dart';
import '../screens/profile-management/edit_personal_data.dart';
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
    '/home': (context) => const GroupScreen(),
    '/homeWrapper': (context) => const HomeTab(),
    '/addToGroup': (context) => const AddGroup(),
    '/editNewGroup': (context) => const EditNewGroup(),
    '/groupConversation': (context) => const GroupConversation(),
    '/aboutGroup': (context) => const AboutGroup(),
    '/editPersonalData': (context) => const EditPersonalData(),
    '/communitySurvey': (context) => const CommunitySurvey(),
    '/addImageScreen': (context) => const AddImageScreen(),
    '/ProfileManagement': (context) => const ProfileManagement(),
  };
}
