import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  List<String> img = ['1', '2', '3', '4', '5', '6', '7', '8'];

  @override
  Widget build(BuildContext context) {
    // Timer(const Duration(seconds: 6), () {
    //   for (String i in img) {
    //     Future.delayed(
    //       const Duration(seconds: 5),
    //       () => print('$i 11234'),
    //     );
    //   }
    // });
    return Scaffold(
        body: Stack(
      children: [
        backgroudImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 30.sp),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Column(
                        children: [
                          Text(
                            'The Photographers',
                            style: TextStyle(
                              fontSize: 35.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Everything Currently going on, or Coming up!!!',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 200.sp),
                    Container(
                      height: 230.h,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.blue.withOpacity(0.6),
                      child: Column(
                        children: [],
                      ),
                    ),
                    SizedBox(height: 100.sp),
                    Container(
                      height: 120.h,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.pink.withOpacity(0.6),
                      child: Column(
                        children: [],
                      ),
                    ),
                    SizedBox(height: 50.sp),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }

  Widget backgroudImage() {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [Color(0xFFFFFFFF), Color.fromARGB(94, 0, 0, 0)],
        begin: Alignment.bottomCenter,
        end: Alignment.center,
      ).createShader(bounds),
      blendMode: BlendMode.darken,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imgs/${img[2]}.png'),
            fit: BoxFit.cover,
            colorFilter:
                const ColorFilter.mode(Colors.black45, BlendMode.lighten),
          ),
        ),
      ),
    );
  }
}
