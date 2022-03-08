import 'package:avocado_lemon_cake/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CheckMail extends StatefulWidget {
  const CheckMail({Key? key}) : super(key: key);

  @override
  State<CheckMail> createState() => _CheckMailState();
}

class _CheckMailState extends State<CheckMail> {
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
                  onPressed: () =>
                      Navigator.of(context).pushNamed('/create-pass'),
                ),
                SizedBox(height: 47.h),
                Text(
                  'Skip I will check later',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w300,
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
