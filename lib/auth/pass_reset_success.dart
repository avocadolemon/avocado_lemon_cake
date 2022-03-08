import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/button_widget.dart';

class PasswordResetSuccess extends StatefulWidget {
  const PasswordResetSuccess({Key? key}) : super(key: key);

  @override
  State<PasswordResetSuccess> createState() => _PasswordResetSuccessState();
}

class _PasswordResetSuccessState extends State<PasswordResetSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(height: 50.h),
                Center(child: SvgPicture.asset('assets/svgs/mark.svg')),
                SizedBox(height: 63.h),
                Text(
                  'Your Password has been reset',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 93.h),
                ButtonWidget(
                  btnName: 'Log-in Now',
                  enabtn: true,
                  startLoad: false,
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/login');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
