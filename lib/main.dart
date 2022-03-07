import 'package:avocado_lemon_cake/auth/login.dart';
import 'package:avocado_lemon_cake/auth/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'Screens/home_page.dart';
import 'function/provider/theme_provider.dart';
import 'routes/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeprovider = Provider.of<ThemeProvider>(context);

        return ScreenUtilInit(
          builder: () {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Community chatapp',
              themeMode: themeprovider.themeMode,
              theme: MyThemes.lightTheme,
              darkTheme: MyThemes.darkTheme,
              home: const HomePage(),
            );
          },
        );
      },
    );
  }
}
