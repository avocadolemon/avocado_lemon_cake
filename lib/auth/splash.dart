import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 130.h),
            const Center(
              child: Image(
                image: AssetImage('assets/imgs/Ellipse 31.png'),
              ),
            ),
            SizedBox(
              height: 90.h,
            ),
            const Center(
              child: Image(
                image: AssetImage('assets/imgs/ALC logo white 1.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
