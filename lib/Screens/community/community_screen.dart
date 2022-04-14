import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  int _currentIndex = 0;
  Timer? _timer;

  final List<Color> colors = [Colors.green, Colors.yellow, Colors.red];

  final List<String> imgList = [
    "assets/imgs/test.jpg",
    "assets/imgs/8.png",
    "assets/imgs/5.png",
    "assets/imgs/2.png",
    "assets/imgs/4.png",
    "assets/imgs/7.png",
    "assets/imgs/6.png",
    "assets/imgs/1.png",
  ];

  final List<String> title = [
    "The Photographers",
    "Second Hand & Vintage",
    "The Surfers",
    "Yoga",
    "Soccer",
    "Travel with Kids",
    "Bicycling",
    "Puppy",
  ];

  final List<String> subtitle = [
    "Everything Currently going on, or Coming up!!!",
    "Vintage lover, you have got your eyes set on the right city",
    "Let’s Go Surfers!!!",
    "“The Sky is not the limit. Your mind is”.",
    "Find a team near your!",
    "Take it slow and Leaves Plenty of Time.",
    "We go out to roll by all the routes that we can",
    "They’re Fluffy and playful, they yip and bark, and all they want is to be loved",
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 6), (timer) async {
      if (mounted) {
        setState(() {
          if (_currentIndex + 1 == imgList.length) {
            _timer!.cancel();
            Navigator.pushNamed(context, '/register');
          } else {
            _currentIndex = _currentIndex + 1;
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(child: child, opacity: animation);
              },
              child: backgroudImage(imgList[_currentIndex]),
            ),
            SafeArea(
              child: Container(
                width: width,
                height: height,
                decoration: const BoxDecoration(color: Color(0x99000000)),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.h),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                        child: GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, '/add-community'),
                          child: Row(
                            children: List.generate(
                              3,
                              (index) {
                                return AnimatedContainer(
                                  duration: const Duration(milliseconds: 150),
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  height: index == 1 ? 15 : 12,
                                  width: index == 1 ? 15 : 12,
                                  decoration: BoxDecoration(
                                    color: colors[index],
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 133.h,
                            width: width,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 16.0, right: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title[_currentIndex],
                                    style: TextStyle(
                                      color: const Color(0xffffffff),
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "OpenSans",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 35.0.sp,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    subtitle[_currentIndex],
                                    style: TextStyle(
                                      color: const Color(0xffffffff),
                                      fontWeight: FontWeight.w300,
                                      fontFamily: "OpenSans",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0.sp,
                                    ),
                                    maxLines: 2,
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 120.h),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Stack(
                              children: [
                                const SizedBox(
                                  height: 70,
                                  width: 45,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.black,
                                      size: 28,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 45,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 18,
                                        height: 18,
                                        decoration: const BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x290e1f35),
                                              offset: Offset(0, 4),
                                              blurRadius: 8,
                                              spreadRadius: 0,
                                            ),
                                          ],
                                          shape: BoxShape.circle,
                                          color: Color(0xff31d641),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 42.h),
                      SizedBox(
                        height: 230.h,
                        width: width,
                        child: Column(
                          children: [
                            getCommunity(
                              txt1: 'The Surfer',
                              txt2: 'The Photographers',
                              color1: const Color(0xFFEB682A),
                              color2: const Color(0xFFEA3948),
                            ),
                            SizedBox(height: 30.h),
                            getCommunity(
                              txt1: 'Second Hand & Vintage',
                              txt2: 'Football',
                              color1: const Color(0xFFD89F07),
                              color2: const Color(0xFFBF6D84),
                            ),
                            SizedBox(height: 30.h),
                            getCommunity(
                              txt1: 'Yoga',
                              txt2: 'Puppy',
                              color1: const Color(0xFF62BAB6),
                              color2: const Color(0xFFA9C80C),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 100.h),
                      Container(
                        height: 120.h,
                        width: width,
                        color: Colors.transparent,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              thirdRowWidget(),
                              SizedBox(width: 26.w),
                              thirdRowWidget(),
                              SizedBox(width: 26.w),
                              thirdRowWidget(),
                              SizedBox(width: 26.w),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getCommunity({
    String? txt1,
    txt2,
    Color? color1,
    Color? color2,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 56.h,
          width: 120.w,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
          decoration: BoxDecoration(
            color: color1,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Center(
            child: Text(
              '$txt1',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        const Spacer(),
        Stack(
          children: [
            Container(
              height: 56.h,
              width: 120.w,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
              decoration: BoxDecoration(
                color: color2,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Text(
                  '$txt2',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
              width: 17,
              height: 17,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x290e1f35),
                    offset: Offset(0, 4),
                    blurRadius: 8,
                    spreadRadius: 0,
                  ),
                ],
                shape: BoxShape.circle,
                color: Color(0xfff60000),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget thirdRowWidget() {
    TextStyle grpStyle = TextStyle(
      fontSize: 12.sp,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    );

    return Container(
      height: 117.h,
      width: 322.w,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            height: 92,
            width: 99,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('assets/imgs/img.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 45.w),
          FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Group name',
                  style: grpStyle,
                ),
                SizedBox(height: 12.h),
                Text(
                  'Name (of Sending)',
                  style: grpStyle,
                ),
                SizedBox(height: 12.h),
                Text(
                  'Last Message.....',
                  style: grpStyle,
                ),
                SizedBox(height: 12.h),
                Text(
                  '17 : 30   25 / 09',
                  style: grpStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget backgroudImage(String img) {
    return ShaderMask(
      key: ValueKey<int>(_currentIndex),
      shaderCallback: (bounds) => const LinearGradient(
        colors: [Colors.white, Colors.white],
        begin: Alignment.bottomCenter,
        end: Alignment.center,
      ).createShader(bounds),
      blendMode: BlendMode.darken,
      child: Container(
        key: ValueKey<int>(_currentIndex),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(img),
            fit: BoxFit.cover,
            colorFilter:
                const ColorFilter.mode(Colors.transparent, BlendMode.lighten),
          ),
        ),
      ),
    );
  }
}
