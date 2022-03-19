import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'function/provider/theme_provider.dart';
import 'routes/app_routes.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
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
              routes: AppRoutes().routes,
              initialRoute: '/aboutGroup',
            );
          },
        );
      },
    );
  }
}
