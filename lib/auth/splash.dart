import 'dart:async';
import 'package:avocado_lemon_cake/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Widget nextScreen;
  const SplashScreen({Key? key, required this.nextScreen}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 10), _goNext);
  }

  _goNext() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (ctx) => widget.nextScreen));
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
            const Spacer(flex: 2),
            Container(
              height: 300,
              decoration: const BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage(ImageAssets.splashBG))),
            ),
            const Spacer(
              flex: 1,
            ),
            Container(
              height: 80,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageAssets.splashLogo))),
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
