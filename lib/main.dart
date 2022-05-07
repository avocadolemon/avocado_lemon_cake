import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'Screens/home/home_tab.dart';
import 'Screens/splash/splash.dart';
import 'auth/onboarding/index.dart';
import 'function/provider/theme_provider.dart';
import 'routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
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
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: () {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Community chatapp',
              themeMode: themeprovider.themeMode,
              theme: MyThemes.lightTheme,
              darkTheme: MyThemes.darkTheme,
              routes: AppRoutes().routes,
              builder: (context, widget) {
                ScreenUtil.setContext(context);
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget!,
                );
              },
              // initialRoute: '/splash', 
              home: StreamBuilder(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    log('snapshot data: ${snapshot.data}');
                    if (snapshot.hasData) {
                      return const SplashScreen(nextScreen: HomeTab());
                    } else {
                      return const SplashScreen(nextScreen: OnBoardingScreen());
                    }
                  }),
            );
          },
        );
      },
    );
  }
}
