// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:avocado_lemon_cake/utils/app_textstyle.dart';
import 'package:avocado_lemon_cake/utils/assets_manager.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/colors.dart';
import 'components/screen_one.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List slides = [
    OnboardingContent(
        heading: "Find a Real Community",
        paragraph: "Discover and Connect with new and local Friends",
        image: SvgAssets.onboardImgOne),
    OnboardingContent(
        heading: "Create a Community",
        paragraph: "Expand your social circle by joinign a new community group",
        image: SvgAssets.onboardImgTwo),
    OnboardingContent(
        heading: "Come Join in the fun",
        paragraph: "Meet up and Explore your Area!",
        image: SvgAssets.onboardImgThree)
  ];
  int currentIndex = 0;
  PageController? _controller;
  Timer? _pageAnimationTimer;

  void _animatePages() {
    if (_controller == null) return;
    if (currentIndex < 2) {
      _controller!.nextPage(
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  void initState() {
    _pageAnimationTimer = Timer.periodic(const Duration(seconds: 7), (timer) {
      _animatePages();
    });
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
    // slides = getSlides();
  }

  @override
  void dispose() {
    _pageAnimationTimer!.cancel();
    _pageAnimationTimer = null;
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: (){},
                  child: Text(
                    "Skip",
                    style:
                        bodyNormalText(context).copyWith(color: AppColors.kwhite, fontSize: 14.sp),
                  ),
                ),
              ),
            ),
            
            Expanded(
              child: PageView.builder(
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  itemCount: slides.length,
                  itemBuilder: (context, index) {
                    // contents of slider
                    return slides[index];
                  }),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  slides.length,
                  (index) => buildDot(index, context),
                ),
              ),
            ),
            SizedBox(height: 32.h,),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 40),
              // width: double.infinity,
              child: currentIndex == slides.length - 1
                  ? Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          color: AppColors.kprimary,
                          borderRadius: BorderRadius.circular(10)),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/homepage');
                        },
                        child: Text(
                          "Get Started",
                          style: heading1(context),
                        ),
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.kprimary,
                          borderRadius: BorderRadius.circular(10)),
                      child: FlatButton(
                        child: Text(
                          "Next",
                          style: heading1(context),
                        ),
                        onPressed: () {
                          if (currentIndex == slides.length - 1) {
                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => OnboardingContent()),
                            // );
                          }
                          _controller!.nextPage(
                              duration: Duration(milliseconds: 100),
                              curve: Curves.bounceIn);
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
      // backgroundColor: Colors.white,
    );
  }

  // container created for dots
  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 5,
      width: currentIndex == index ? 15 : 5,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: currentIndex == index ? AppColors.kprimary : AppColors.kgrey,
      ),
    );
  }
}
