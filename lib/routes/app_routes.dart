import 'package:avocado_lemon_cake/Screens/group/about_group/about_group.dart';
import 'package:avocado_lemon_cake/Screens/group/group_conversation.dart';
import 'package:avocado_lemon_cake/Screens/home/add_group.dart';
import 'package:avocado_lemon_cake/Screens/home/edit_group.dart';
import 'package:avocado_lemon_cake/Screens/home/groups_screen.dart';
import 'package:avocado_lemon_cake/Screens/home/home_tab.dart';
import 'package:avocado_lemon_cake/Screens/profile_management/profile_management.dart';
import 'package:avocado_lemon_cake/auth/onboarding/index.dart';
import 'package:flutter/material.dart';
import '../Screens/add/add_city.dart';
import '../Screens/add/add_community.dart';
import '../Screens/home_page.dart';
import '../Screens/profile-management/add_image_screen.dart';
import '../Screens/profile-management/community_survery.dart';
import '../Screens/profile-management/edit_personal_data.dart';
import '../auth/check_mail.dart';
import '../auth/create_new_pass.dart';
import '../auth/forgot_pass.dart';
import '../auth/login.dart';
import '../auth/pass_reset_success.dart';
import '../auth/register.dart';

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
    // '/splash': (context) => const SplashScreen(),
    '/onboarding': (context) => const OnBoardingScreen(),
    '/add-city': (context) => const AddCity(),
    // '/community-screen': (context) => CommunityScreen(),
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
