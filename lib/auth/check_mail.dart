import 'dart:io';
import 'package:android_intent_plus/android_intent.dart';
import 'package:avocado_lemon_cake/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckMail extends StatefulWidget {
  const CheckMail({Key? key}) : super(key: key);

  @override
  State<CheckMail> createState() => _CheckMailState();
}

class _CheckMailState extends State<CheckMail> {
  bool visible = false;

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 8),
      () => setState(() => visible = true),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30.h),
                Center(child: SvgPicture.asset('assets/svgs/open_mail.svg')),
                Text(
                  'Check your email',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 26.h),
                Text(
                  'We sent a password recovery instruction to your email.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 72.h),
                ButtonWidget(
                  btnName: 'Open Email App',
                  enabtn: true,
                  startLoad: false,
                  onPressed: () {
                    if (Platform.isAndroid) {
                      AndroidIntent intent = const AndroidIntent(
                        action: 'android.intent.action.MAIN',
                        category: 'android.intent.category.APP_EMAIL',
                      );
                      intent.launch().catchError((e) {
                        debugPrint(e);
                      });
                    } else if (Platform.isIOS) {
                      launchUrl(Uri.parse("message://")).catchError((e) {
                        debugPrint(e);
                      });
                    }
                    Navigator.of(context).pushNamed('/create-pass');
                  },
                ),
                Visibility(
                  visible: visible,
                  child: TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                    child: Text(
                      'Login now.',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 154.h),
                Text(
                  'Did not receive the Email? Check your spam Filter or try another Email Address',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 47.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
