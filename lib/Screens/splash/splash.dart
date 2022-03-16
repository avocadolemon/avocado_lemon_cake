import 'dart:async';
import 'package:avocado_lemon_cake/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, '/onboarding');
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2
            ),
            Container(
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(ImageAssets.splashBG))
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Container(
              height: 80,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(ImageAssets.splashLogo))
              ),
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}